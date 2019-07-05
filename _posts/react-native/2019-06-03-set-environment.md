---
title: "리액트 네이티브 개발환경구성"
subtitle: "React native set environment"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "/img/a.jpg"
tags: [react-native]
date: 2019-06-03 16:12:12
---
# 개발환경 구성

[참고자료-환경변수](https://stackoverflow.com/questions/45182717/java-home-is-set-to-an-invalid-directory?rq=1)

### 개발환경을 구성할 때는 expo init으로 하지 않고 react-native init [project name]으로 한다

그래야 android, ios폴더가 생기고, react-hoooks가 가능한 최신버젼으로 다운 받을 수 있으며, product버젼엔 이게 적합하다

[expo와 react-native 차이점](https://apiko.com/blog/expo-vs-vanilla-react-native/)

### react-native run-android가 실행 방법

방법 1. android studio -> AVD Manager에서 애뮬레이터를 실행한 뒤에 실행가능하다.
방법 2. yarn start하고 뜨는 페이지에서 Run on Android device/emulator를 클릭한다.
방법 3. expo에선 react-native run-android 대신 expo start --android 명령어를 쓸 수 있다.

### 안드로이드 스튜디오 다운

[참고자료](https://yuddomack.tistory.com/entry/1React-Native-%EC%84%A4%EC%B9%98%EC%99%80-%EC%8B%A4%ED%96%89hello-world)

### JAVA다운 받는곳

jre가 아닌 jdk를 다운 받아야 한다.

아이디: rlagmlwnd3@naver.com
비번: Khj34713
![자바 받는곳](https://i.imgur.com/UTlqurA.png)

### git bash에서 JAVA환경변수 보는법

`echo $JAVA_HOME`

### git bash에서 JAVA환경변수 설정

bash.bashrc위치
`cd /etc/bash.bashrc`

JAVA환경변수 설정
`export JAVA_HOME="C:\Program Files\Java\[JAVA버젼]"`

javac환경변수 설정
`export PATH=$PATH:$JAVA_HOME/bin`

### 디바이스 상태 확인 명령어

`adb devices`

![상태](https://i.imgur.com/5JdayWM.png)

디바이스는 Nexus5 API 28로 Pie버젼으로 하는게 좋다

# 에러

### react-native run-android할 때 에러

![에러](https://i.imgur.com/yov8l39.png)

이 에러는 명령어를 실행하는 위치 혹은 상위 경로에 한글이 있어서 그렇다(자바와 관련된 문제인듯하다)
