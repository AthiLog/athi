---
title: "#5 ruby 설치하기"
subtitle: "How to install Github"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "/img/f.jpg"
tags: [goodwriting-series, github]
date: 2019-01-05 12:12:12
---

# ruby 다운로드

[루비 다운로드](https://rubyinstaller.org/downloads/)

위 사이트에서 ruby를 다운받아주세요.

2.4.2 버젼 이상을 다운받아주세요,

(x64)는 64비트용 컴퓨터
(x86)은 32비트용 컴퓨터

이런것에 잘 모르겠다면 그냥 (x86)을 다운받아주면 됩니다.

계속 next해주면 다음같은 화면이 뜰 것인데

![ruby화면](https://i.imgur.com/6eJIXCp.png)

이제 3가지 설정을 해주어야 합니다.

## 첫번째 설정

숫자 1을 누른 뒤 enter를 눌러주세요.
![숫자1](https://i.imgur.com/bd5rlEw.png)

다음과 같은 화면이 나올 텐데

![ruby설치](https://i.imgur.com/OEpopIN.png)

계속 next를 눌러주고

![체크](https://i.imgur.com/OHgGsu0.png)

이 체크하는 화면에서 체크를 해제해주세요,

저 화면이 안나온다면 그냥 넘어가면 됩니다.

여기까지 첫번째 설정이 끝났고 2번째 설정을 해주세요.

## 두번째 설정

숫자 2를 누르고 enter를 누릅니다.

![숫자2](https://i.imgur.com/4AcZBxw.png)

다음과 같은 succeeded가 나오면 성공입니다.

![성공](https://i.imgur.com/TPSKjfu.png)

## 세번째 설정

숫자 3을 누르고 enter를 누르세요,

![숫자3](https://i.imgur.com/HNoM0TB.png)

다음과 같은 succeeded가 나오면 성공입니다.

![성공2](https://i.imgur.com/dQJ6m5i.png)

# ruby가 잘 설치 되었는지 확인해보자

다음 명령어가 잘 실행된다면 잘 설치 되었습니다.

```bash
ruby -v
gem -v
```

![ruby설치확인](https://i.imgur.com/HhKm4gO.png)

그리고 다음명령어를 사용해주세요.

```bash
gem install jekyll bundler
```

jekyll 명령어를 사용하기 위해 다음 명령어로 jekyll bundler를 설치해주세요.

```bash
jekyll -v
```

![jekyll설치](https://i.imgur.com/lDoXJcS.png)

위 명령어가 잘 실행된다면 잘 설치가 되었습니다.

이제 모든 설치강의는 끝났습니다.

다음 강의는 빠르게 시작하기 강의로, 이 강의만 끝나면 모두 개인 블로그를 개설할 수 있습니다.
