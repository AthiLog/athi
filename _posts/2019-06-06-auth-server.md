---
title: "서버 인증"
subtitle: "Auth Server"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "/athi/img/c.jpg"
tags: [react-native]
date: 2019-06-04 14:12:12
---

[참고자료](https://medium.com/handlebar-labs/graphql-authentication-with-react-native-apollo-part-2-2-13ac8c362113)

## 전체코드

```javascript
import { makeExecutableSchema } from "graphql-tools";
import { MongoClient } from "mongodb";

const TEMP_USER = {
  _id: "1",
  email: "spencer@handlebarlabs.com"
};

const typeDefs = `
  type User {
    _id: String
    email: String
  }
  type Query {
    currentUser: User
  }
  type Mutation {
    login(email: String!, password: String!): User
    signUp(email: String!, password: String!): User
  }
`;

const resolvers = {
  Query: {
    currentUser: () => {
      return TEMP_USER;
    }
  },
  Mutation: {
    login: (root, { email, password }) => {
      console.log("data", email, passwrod);
      return TEMP_USER;
    },
    signup: (root, { email, password }, { mongo }) => {
      return TEMP_USER;
    }
  }
};

// Required: Export the GraphQL.js schema object as "schema"
export const schema = makeExecutableSchema({
  typeDefs,
  resolvers
});

// Optional: Export a function to get context from the request.

let mongo;

export async function context(headers, secrets) {
  if (!mongo) {
    mongo = await MongoClient.connect(secrets.MONGO_URL);
  }
  return {
    headers,
    secrets,
    mongo
  };
}
```

## Connecting to the Database

Once you’ve set up your account with [mLab](https://mlab.com) and created a new mongo db instance you should see a url along the lines of

```bash
mongodb://<dbuser>:<dbpassword>@ds121665.mlab.com:21665/graphql-auth-demo-1
```

```bash
// 나의경우
mongodb://shiftcard:1234@ds121665.mlab.com:21665/graphql-auth-demo-1
```

`launchpad apollo의 key에 MONGO_URL, value값에 위의 값 추가함`

you’ll also need to create a user for that database (with write permissions). Take that url and add it to our “secrets” as `MONGO_URL` in Launchpad. Make sure to swap out `<dbuser>` and `<dbpassword>` with the values of the user you created.

By adding the secret values here we can access them from our context function, which is where we’ll be establishing our mongo connection. This context function will be called each time a request is made to a GraphQL endpoint so we want to store a reference to our connection outside of the function (allowing us to only make the db connection request once). We’ll then return the mongo variable in context so that we access it in our resolver functions.

```javascript
let mongo;
let client;
export async function context(headers, secrets) {
  if (!mongo) {
    client = await MongoClient.connect(secrets.MONGO_URL);
    mongo = client.db("graphql-auth-demo-1");
  }
  return {
    headers,
    secrets,
    mongo
  };
}
```

Make sure you `import { MongoClient } from 'mongodb';` at the top of your file! Launchpad will automatically install it.

## Sign Up

Now let’s access the database from the resolver functions… first signup. We’ll get a reference to a `users` collection and then check if a user with the given email address already exists.

```javascript

const resolvers = {
  ...
  Mutation: {
    ...
    signup: async (root, { email, password }, { mongo }) => {
      const Users = mongo.collection('users');
      const existingUser = await Users.findOne({ email });

      if (existingUser) {
        throw new Error('Email already used');
      }

      // TODO: Make this real
      return TEMP_USER;
    },
  },
};
```

We can then insert the user document into the collection. I’ll be using `bcrypt` to hash the user’s password, because you should never store a plain text password in your database! Make sure you import the lib:

```javascript
import bcrypt from "bcrypt";
```

I’m going to be using async/await because it makes for easy to follow code.

```javascript
const resolvers = {
  ...
  Mutation: {
    ...
    signup: async (root, { email, password }, { mongo }) => {
      const Users = mongo.collection('users');
      const existingUser = await Users.findOne({ email });

      if (existingUser) {
        throw new Error('Email already used');
      }

      const hash = await bcrypt.hash(password, 10);
      await Users.insert({
        email,
        password: hash,
      });
      const user = await Users.findOne({ email });

      return user;
    },
  },
};
```

Go ahead and give it a shot in Launchpad

```javascript
mutation {
  signup(email:"c@test.com", password:"password") {
    _id
    email
  }
}
```

## Login

The login mutation is very similar to the one we just put together.

First we’ll check if a user with that email address exists.

```javascript
const resolvers = {
  ...
  Mutation: {
    login: async (root, { email, password }, { mongo }) => {
      const Users = mongo.collection('users');

      const user = await Users.findOne({ email });
      if (!user) {
        throw new Error('Email not found');
      }
    },
    ...
  },
};
```

Then we’ll compare the password supplied and the password we have stored. If they match then return the user!

```javascript
const resolvers = {
  ...
  Mutation: {
    login: async (root, { email, password }, { mongo }) => {
      const Users = mongo.collection('users');

      const user = await Users.findOne({ email });
      if (!user) {
        throw new Error('Email not found');
      }

      const validPassword = await bcrypt.compare(password, user.password);
      if (!validPassword) {
        throw new Error('Password is incorrect');
      }

      return user;
    },
    ...
  },
};
```

So now we’ve got our sign in & sign up mutations working, but that isn’t all! We don’t want to force the user to have to login with every request. Enter…

## JSON Web Tokens

> JSON Web Token (JWT) is an open standard ([RFC 7519](https://tools.ietf.org/html/rfc7519)) that defines a compact and self\-contained way for securely transmitting information between parties as a JSON object. This information can be verified and trusted because it is digitally signed. JWTs can be signed using a secret (with the **HMAC** algorithm) or a public/private key pair using **RSA**.

For us this means that we can generate a JWT and use that as a means of confidently identifying a user. The flow will work like this

1.  User logs in or signs up
2.  The server returns a JWT
3.  The client saves the JWT to their local storage (covered in part 2)
4.  The JWT is passed with each request from client to server (on the `Authorization` header — covered in part 2)
5.  The server uses the JWT to grab the user’s information and add it to `context`

> A note on step 5: Since I wanted to keep this all browser based we need to do this manually. If you’ve got total control over the server though you can use `[express-jwt](https://www.npmjs.com/package/express-jwt)` to do this automatically. This is a good way to learn what that module is doing though!

### The Secret

A JWT is signed with a secret value. We’ll want to come up with one and add that to the “Secrets” in Launchpad, like we did `MONGO_URL`. I’m storing it as `JWT_SECRET` with a value of `super-secret`.

`launchpad apollo의 key값에 JWT_SCRET과 value값에 super-secret 추가함`

Now, using that secret we’ll want to generate a new JWT and return it on the user object when they successfully login or sign up. First I’ll add `jwt` to the `User`type in our type definitions.

```javascript

...

const typeDefs = `
  type User {
    _id: String
    email: String
    jwt: String
  }
  type Query {
    currentUser: User
  }
  type Mutation {
    login(email: String!, password: String!): User
    signup(email: String!, password: String!): User
  }
`;

...
```

Make sure you add import jwt from 'jsonwebtoken'; to the top of your file.

## Generating the Token

Then, upon successful login, I’ll create a JWT. We’re passing the user’s id as part of the payload and secrets is coming from context.

```javascript
const resolvers = {
  ...
  Mutation: {
    login: async (root, { email, password }, { mongo, secrets }) => {
      const Users = mongo.collection('users');

      const user = await Users.findOne({ email });
      if (!user) {
        throw new Error('Email not found');
      }

      const validPassword = await bcrypt.compare(password, user.password);
      if (!validPassword) {
        throw new Error('Password is incorrect');
      }

      // Generate the jwt and add it to the user document being returned.
      user.jwt = jwt.sign({ _id: user._id }, secrets.JWT_SECRET);

      return user;
    },
    ...
  },
};
```

We’ll do the same for sign up.

```javascript
const resolvers = {
  ...
  Mutation: {
    ...
    signup: async (root, { email, password }, { mongo, secrets }) => {
      const Users = mongo.collection('users');
      const existingUser = await Users.findOne({ email });

      if (existingUser) {
        throw new Error('Email already used');
      }

      const hash = await bcrypt.hash(password, 10);
      await Users.insert({
        email,
        password: hash,
      });
      const user = await Users.findOne({ email });

      user.jwt = jwt.sign({ _id: user._id }, secrets.JWT_SECRET);

      return user;
    },
  },
};
```

## Adding the Current User to Context

Finally (for this part at least) we need to add the current user to context.

Remember, if you’re not using Launchpad you can use express-jwt to do this automatically. I also need to note that I’m basing this function a bit off of this launchpad which does the same thing but for the Auth0 service.

First, create a new function called getUser and check if we’ve got a potentially valid authorization token in the header.

```javascript
const getUser = async (authorization, secrets, mongo) => {
  const bearerLength = "Bearer ".length;
  if (authorization && authorization.length > bearerLength) {
  }

  return null;
};
```

Then we’ll try to verify the token that was passed.

```javascript
const getUser = async (authorization, secrets, mongo) => {
  const bearerLength = "Bearer ".length;
  if (authorization && authorization.length > bearerLength) {
    const token = authorization.slice(bearerLength);
    const { ok, result } = await new Promise(resolve =>
      jwt.verify(token, secrets.JWT_SECRET, (err, result) => {
        if (err) {
          resolve({
            ok: false,
            result: err
          });
        } else {
          resolve({
            ok: true,
            result
          });
        }
      })
    );

    if (ok) {
      const user = await mongo
        .collection("users")
        .findOne({ _id: ObjectId(result._id) });
      return user;
    } else {
      console.error(result);
      return null;
    }
  }

  return null;
};
```

Then we’ll attempt to fetch the user from our database using the \_id that we put into the jwt payload initially. ObjectId is coming from the mongdb module.

```javascript
const getUser = async (authorization, secrets, mongo) => {
  const bearerLength = "Bearer ".length;
  if (authorization && authorization.length > bearerLength) {
    const token = authorization.slice(bearerLength);
    const { ok, result } = await new Promise(resolve =>
      jwt.verify(token, secrets.JWT_SECRET, (err, result) => {
        if (err) {
          resolve({
            ok: false,
            result: err
          });
        } else {
          resolve({
            ok: true,
            result
          });
        }
      })
    );

    if (ok) {
      const user = await mongo
        .collection("users")
        .findOne({ _id: ObjectId(result._id) });
      return user;
    } else {
      console.error(result);
      return null;
    }
  }

  return null;
};
```

Finally, let’s go ahead and call this getUser function from the context function.

```javascript
export async function context(headers, secrets) {
  if (!mongo) {
    client = await MongoClient.connect(secrets.MONGO_URL);
    mongo = client.db("graphql-auth-demo-1");
  }
  const user = await getUser(headers["authorization"], secrets, mongo);

  return {
    headers,
    secrets,
    mongo,
    user
  };
}
```

We can also update the `currentUser` query to return the user from context.

```javascript
const resolvers = {
  Query: {
    currentUser: (root, args, context) => {
      return context.user;
    },
  },
  ...
};
```

Let’s go ahead and check this out…

And there you have it! Runnable source code is available below
