---
title: "클라이언트 인증"
subtitle: "Client Auth"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "/img/d.jpg"
tags: [react-native]
date: 2019-06-04 14:12:12
---

[참고자료](https://medium.com/handlebar-labs/graphql-authentication-with-react-native-apollo-part-1-2-9613aacd80b3)

```javascript
// app.js
import React, { Component } from "react";
import { StackNavigator } from "react-navigation"; // 1.0.0-beta.19
import { ApolloClient, HttpLink, InMemoryCache } from "apollo-client-preset";
import { ApolloProvider } from "react-apollo";
import { setContext } from "apollo-link-context";

import Register from "./Register";
import Login from "./Login";
import Profile from "./Profile";
import { signIn, signOut, getToken } from "./util";

const AuthStack = StackNavigator({
  Register: {
    screen: Register,
    navigationOptions: { headerTitle: "Register" }
  },
  Login: { screen: Login, navigationOptions: { headerTitle: "Login" } }
});

const LoggedInStack = StackNavigator({
  Profile: { screen: Profile, navigationOptions: { headerTitle: "Profile" } }
});

const httpLink = newHttpLink({ uri: 'https://graphql서버주소'});
const authLink = setContext(async (req, {headers }) => {
  const token = await getToken();

  return {
    ...headers,
    headers: {
      authorization: token ?`Bearer $(token)` :null,
    }
  }
});

const link = authLink.concat(httpLInk);

const client = new ApolloClient({
    link,
    cache: new InMemoryCache(),

})

export default class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      loggedIn: false
    };
  }

  async componentWillMount() {
    const token = await getToken();
    if (token) {
      this.setState({ loggedIn: true });
    }
  }

  handleChangeLoginState = (loggedIn = false, jwt) => {
    this.setState({ loggedIn });
    if (loggedIn) {
      signIn(jwt);
    } else {
      signOut();
    }
  };

  render() {
      return(
          <ApolloClient client={client}>
          {
            this.state.loggedIn ?
            <LoggedInStack
                screenProps={ changeLoginState: this.handleChangeLoginState }
            />
             :
            <AuthStack
                screenProps={ changeLoginState: this.handleChangeLoginState }
            />
        }
        </AolloClient>
      );
  }
}
```

bla

```javascript
// util.js
import { AsyncStorage } from "react-native";

const AUTH_TOKEN = "AUTH_TOKEN";

let token;

export const getToken = async () => {
  if (token) {
    return Promise.resolve(token);
  }

  token = await AsyncStorage.getItem(AUTH_TOKEN);
  return token;
};

export const signIn = newToken => {
  token = newToken;
  return AsyncStorage.setItem(AUTH_TOKEN, newToken);
};

export const signOut = () => {
  token = undefined;
  return AsyncStorage.removeItem(AUTH_TOKEN);
};
```

bla

```javascript
//login.js
import React from "react";
import {
  Container,
  Button,
  Content,
  Form,
  Item,
  Input,
  Text
} from "native-base";
import gql from "graphql-tag";
import { graphql } from "react-apollo";

class Login extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      email: "",
      emailError: false,
      password: "",
      passwordError: false
    };
  }

  handleInputChange = (field, value) => {
    const newState = {
      ...this.state,
      [field]: value
    };
    this.setState(newState);
  };

  handleSubmit = () => {
    const { email, password } = this.state;
    if (email.length === 0) {
      return this.setState({ emailError: true });
    }
    this.setState({ emailError: false });

    if (password.length === 0) {
      return this.setState({ passwordError: true });
    }
    this.setState({ passwordError: false });

    // return this.props.screenProps.changeLoginState(true);
    this.props
      .login(email, password)
      .then(({ data }) => {
        return this.props.screenProps.changeLoginState(true, data.login.jwt);
      })
      .catch(e => {
        if (/email/i.test(e.message)) {
          this.setState({ emailError: true });
        }
        if (/password/i.test(e.message)) {
          this.setState({ passwordError: true });
        }
      });
  };

  render() {
    const { emailError, passwordError } = this.state;

    return (
      <Container>
        <Content>
          <Form>
            <Item error={emailError}>
              <Input
                placeholder="Email"
                onChangeText={value => this.handleInputChange("email", value)}
                keyboardType="email-address"
                autoCapitalize="none"
                autoCorrect={false}
              />
            </Item>
            <Item error={passwordError}>
              <Input
                placeholder="Password"
                onChangeText={value =>
                  this.handleInputChange("password", value)
                }
                autoCapitalize="none"
                autoCorrect={false}
                secureTextEntry
              />
            </Item>
          </Form>
          <Button full onPress={this.handleSubmit}>
            <Text>Sign In</Text>
          </Button>
        </Content>
      </Container>
    );
  }
}

export default graphql(
  gql`
    mutation LogIn($email: String!, $password: String!) {
      login(email: $email, password: $password) {
        _id
        email
        jwt
      }
    }
  `,
  {
    props: ({ mutate }) => ({
      login: (email, password) => mutate({ variables: { email, password } })
    })
  }
)(Login);
```

bla

```javascript
// register.js
import React from "react";
import {
  Container,
  Button,
  Content,
  Form,
  Item,
  Input,
  Text
} from "native-base";

import {graphql} from "react-apollo";
import gql from "graph-tag";

class Register extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      email: "",
      emailError: false,
      password: "",
      passwordError: false,
      confirmPassword: "",
      confirmPasswordError: false
    };
  }

  handleInputChange = (field, value) => {
    const newState = {
      ...this.state,
      [field]: value
    };
    this.setState(newState);
  };

  handleSubmit = () => {
    const { email, password, confirmPassword } = this.state;
    if (email.length === 0) {
      return this.setState({ emailError: true });
    }
    this.setState({ emailError: false });

    if (password.length === 0) {
      return this.setState({ passwordError: true });
    }
    this.setState({ passwordError: false });

    if (confirmPassword.length === 0) {
      return this.setState({ confirmPasswordError: true });
    }
    this.setState({ confirmPasswordError: false });

    if (password !== confirmPassword) {
      return this.setState({ passwordError: true, confirmPasswordError: true });
    }
    this.setState({ passwordError: false, confirmPasswordError: false });

    // return this.props.screenProps.changeLoginState(true);
    this.props
      .signup(email, passowrd)
      .then(({data}) => {
        return this.props.screenProps.changeLoginState(true, data.signup.jwt)'
      })
      .catch(e => {
        if (/email/i.test(e.message)) {
          this.setState({ emailError: true});
        }
        if (/password/i.test(e.message)) {
          this.setState({ passwordError: true});
        }
      })

  };

  render() {
    const { navigation } = this.props;
    const { emailError, passwordError, confirmPasswordError } = this.state;

    return (
      <Container>
        <Content>
          <Form>
            <Item error={emailError}>
              <Input
                placeholder="Email"
                onChangeText={value => this.handleInputChange("email", value)}
                keyboardType="email-address"
                autoCapitalize="none"
                autoCorrect={false}
              />
            </Item>
            <Item error={passwordError}>
              <Input
                placeholder="Password"
                onChangeText={value =>
                  this.handleInputChange("password", value)
                }
                autoCapitalize="none"
                autoCorrect={false}
                secureTextEntry
              />
            </Item>
            <Item last error={confirmPasswordError}>
              <Input
                placeholder="Confirm Password"
                onChangeText={value =>
                  this.handleInputChange("confirmPassword", value)
                }
                autoCapitalize="none"
                autoCorrect={false}
                secureTextEntry
              />
            </Item>
          </Form>
          <Button full onPress={this.handleSubmit}>
            <Text>Sign Up</Text>
          </Button>
          <Button full transparent onPress={() => navigation.navigate("Login")}>
            <Text>Sign In</Text>
          </Button>
        </Content>
      </Container>
    );
  }
}

export default graphql(
  gql`
    mutation SignUp($email: String!, $password: String!) {
      signup(email: $email, password: $password) {
        _id
        email
        jwt
      }
    }
  `,
  {
    props: ({ mutate }) => {
      signup: (email, password) => mutate({ variables: { email, passwrod } });
    }
  }
)(Register);
```

```javascript
// profile.js

import React from "react";
import { View } from "react-native";
import { Container, Text, Button, Content } from "native-base";
import { graphql } from "react-apollo";
import gql from "graphql-tag";

class Logout extends React.Component {
  handleLogout = () => {
    return this.props.screenProps.changeLoginState(false);
  };

  render() {
    const { currentUser } = this.props.data;
    return (
      <Container>
        <Content>
          {currentUser && (
            <View>
              <Text>{currentUser._id}</Text>
              <Text>{currentUser.password}</Text>
            </View>
          )}
          <Button full onPress={this.handleLogout}>
            <Text>Log Out</Text>
          </Button>
        </Content>
      </Container>
    );
  }
}

export default graphql(
  gql`
    query User {
      currentUser {
        _id
        email
      }
    }
  `
)(Logout);
```
