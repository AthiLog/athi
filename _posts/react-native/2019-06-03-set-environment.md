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

## 개발환경을 구성할 때는 expo init으로 하지 않고 react-native init [project name]으로 한다

그래야 android, ios폴더가 생기고, react-hoooks가 가능한 최신버젼으로 다운 받을 수 있으며, product버젼엔 이게 적합하다

[expo와 react-native 차이점](https://apiko.com/blog/expo-vs-vanilla-react-native/)

## react-native run-android가 실행 방법

방법 1. android studio -> AVD Manager에서 애뮬레이터를 실행한 뒤에 실행가능하다.  
방법 2. yarn start하고 뜨는 페이지에서 Run on Android device/emulator를 클릭한다.  
방법 3. expo에선 react-native run-android 대신 expo start --android 명령어를 쓸 수 있다.

## 안드로이드 스튜디오 다운

[참고자료](https://yuddomack.tistory.com/entry/1React-Native-%EC%84%A4%EC%B9%98%EC%99%80-%EC%8B%A4%ED%96%89hello-world)

### AVD Manager설정
Cotlin이 아닌 JAVA프로젝트를 한개 만들어서 sync가 되면 Tools->AVDManger 메뉴가 생긴다.

## JAVA다운 받는곳

[다운로드링크](https://www.oracle.com/technetwork/java/javase/downloads/jdk12-downloads-5295953.html)

jre가 아닌 jdk를 다운 받아야 한다.

![자바 받는곳](https://i.imgur.com/UTlqurA.png)

## 윈도우 환경변수 설정

### ANDROID_HOME
**Adroid SDK를 설치하였으니 시스템 변수를 편집해줘야 합니다.**

**고급 시스템 설정 > 고급 탭의 환경변수 > 시스템변수 > 새 변수 생성**

![](https://t1.daumcdn.net/cfile/tistory/255DD23658291AA935)

변수이름 : **ANDROID\_HOME**

변수 값 : **ANDROID 설치 경로**

를 입력하고 확인 클릭~!

### SDK 환경변수

![](https://t1.daumcdn.net/cfile/tistory/2466703658291AAE2E)

두번째로는 Path 변수를 편집한다.

(사전에 진행했던 JAVA 설치 및 개발환경 구성에서 진행했던 Path 변수가 있을거에요)

**가장 끝에 ; 를 붙이고 위에서 설정해주었던 안드로이드 홈의 path를 잡아줍니다.**

**%ANDROID\_HOME%\\tools;%ANDROID\_HOME%\\platform\-tools;**

(혹시 이렇게 설정되어 있는데 개발환경에서 path를 못잡는 다던가 하는

error가 나면 %ANDROID\_HOME%변수로 넣지말고

풀 경로를 복사해서 넣어보세요)

![](https://t1.daumcdn.net/cfile/tistory/2175453658291AAF21)

### JAVA환경변수

![자바환경변수](https://i.imgur.com/lNO3VgN.png)

![자바환경변수2](https://i.imgur.com/tfXes5F.png)


## git bash에서 JAVA환경변수 보는법

`echo $JAVA_HOME`

## git bash에서 JAVA환경변수 설정

bash.bashrc위치
`cd /etc/bash.bashrc`

JAVA환경변수 설정
`export JAVA_HOME="C:\Program Files\Java\[JAVA버젼]"`

javac환경변수 설정
`export PATH=$PATH:$JAVA_HOME/bin`

## 디바이스 상태 확인 명령어

`adb devices`

![상태](https://i.imgur.com/5JdayWM.png)

디바이스는 Nexus5 API 28로 Pie버젼으로 하는게 좋다

# 에러

## react-native run-android할 때 에러

![에러](https://i.imgur.com/yov8l39.png)

이 에러는 명령어를 실행하는 위치 혹은 상위 경로에 한글이 있어서 그렇다(자바와 관련된 문제인듯하다)
