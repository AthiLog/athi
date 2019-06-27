---
title: "리액트 네이티브 가운데정렬"
subtitle: "Jekyll folder's structure"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "/img/f.jpg"
tags: [react-native]
date: 2019-06-04 14:12:12
---

```javascript
import React, { Component } from "react";
import { Text, View, StyleSheet } from "react-native";

const styles = StyleSheet.create({
  login: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center"
  }
});

class Login extends Component {
  render() {
    return (
      <View style={styles.login}>
        <Text> Login </Text>
      </View>
    );
  }
}

export default Login;
```

alignItems는 가로로 가운데 정렬
justifyContent는 세로로 가운데 정렬
![가운데 정렬](https://i.imgur.com/n4DVf3q.png)
