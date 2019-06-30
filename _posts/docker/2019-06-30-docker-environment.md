---
title: "모든 폴더에서 도커 명령어 사용하기"
subtitle: "Use docker command on everywhere"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "/img/e.jpg"
tags: [docker]
date: 2019-06-30 03:12:12
---

### 문제

도커를 설치하게 되면 도커명령어는

`C:\Program Files\Docker Toolbox`

에서만 사용이 가능한데 이것을 모든 폴더에서 사용할 수 있도록 변경할려면 환경 변수를 설정해주어야 한다.

### 경로

`내컴퓨터 -> 속성 -> 고급 시스템 설정 -> 환경변수 -> 새로만들기`

### 설정

변수이름: docker
변수값: C:\Program Files\Docker Toolbox

![도커설정](https://i.imgur.com/MUaX5AP.png)
