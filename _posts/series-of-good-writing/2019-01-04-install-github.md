---
title: "#4 github설치하기 "
subtitle: "How to install Github"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "/img/a.jpg"
tags: [goodwriting-series, github]
date: 2019-01-04 12:12:12
---

# github

## github란?

### 정의

깃(git)은 프로그램 등의 소스 코드 관리를 위한 분산 버전 관리 시스템입니다. 깃의 작업 폴더는 모두 기록하고 있어서 추적이 가능하고, 완전한 형태의 저장소입니다.

### 쉽게말하면

- 파일 관리도구
- 파일을 변경시(삭제, 수정 등) 변경사항을 기록
- 기록을 했으므로 원할 때마다 기록사항을 볼 수 있고 복구할 수도 있다.

## github bash설치하기

- [github다운로드](https://gitforwindows.org/)

![다운로드2](https://i.imgur.com/EE2GHhK.png)

여기서 반드시 git bash에 체크가 되있어야하고
git GUI가 필요없는 사람은 체크 해제를 해준다.

나머지는 다 Next를 누른다.

## VSCode에서 bash설정하기

![bash설정](https://i.imgur.com/KnT3hqE.png)

![bash설정2](https://i.imgur.com/6wLcAyh.png)

Edit in settings.json을 클릭해준다.

`terminal.integrated.shell.windows` 부분을 다음과 같이 수정해준다.

이렇게 설정하면 VSCode Terminal에서 git bash를 사용할 수 있게된다.

![bash설정3](https://i.imgur.com/V2cyZqq.png)

VSCode Terminal을 보는 방법은 `` Ctrl + ` `` 이다.

![bash창](https://i.loli.net/2019/06/30/5d18087580d3261364.png)

설정이 잘 되었으면 다음과 같은 창을 볼 수 있다.

## github 로그인하기

[github사이트](https://github.com/)

첫화면부터 가입할 수 있다.

가입을 할 때 Username을 입력하실 때 자신을 대표할만한 이름을 적어주세요.

나중에 인터넷 주소 맨 앞을 나타낼 것입니다.

![깃가입](https://i.imgur.com/dKgn6HX.png)

Unlimited public repositores for free를 선택한다.
무료만으로도 충분히 많은 기능을 사용할 수 있다.
![프리](https://i.imgur.com/HDwE9lf.png)

마지막으로 자기에 해당사항을 체크하고 가입한다.
그러면 이메일에 확인 메일이 와있을 것이다.

![step3](https://i.imgur.com/j5R9TGE.png)

## git clone으로 데이터 가져오기

시작버튼 -> git bash검색 -> git bash프로그램

![git bash](https://i.imgur.com/vmiDTQ3.png)

`pwd` 입력시 현재 폴더 위치를 알 수 있다.
![pwd](https://i.imgur.com/7eQsYRz.png)

ex) `/c/User/blabla~~`

/c/는 c드라이브를 가르키고
User는 c드라이브 밑에있는 User폴더를 가르킨다
출력결과는 자기 컴퓨터마다 다 다르다

폴더간에 이동 할 때는 `cd` 명령어를 쓴다
ex) `cd [이동할경로]`

폴더간에 이동을 하면서 어떠한 파일이 있는지 알고 싶을 때 `ls`명령어를 사용하면 파일과 폴더 목록을 볼 수 있다
ex) `ls`

이제 우리가 데이터를 받을 경로로 이동한다.

나는 Documents(문서)로 가겠다.
![이동](https://i.imgur.com/2c7TXKA.png)

Documents로 이동한 걸 볼 수 있다.
![이동2](https://i.imgur.com/dCGBKXv.png)

그리고 `git clone [가져올 데이터 주소]` 명령어로 데이터를 가져올 것이다.

데이터를 가져올려면 무엇을 가져올지 알아야 한다.
[github athi](https://github.com/AthiLog/athi)

여기에 접속해서 Clone or Download를 클릭 한뒤 복사 이미지를 클릭한다.

![clone](https://i.imgur.com/DyrbTGD.png)

클릭을 했으면 https://github.com/AthiLog/athi.git가 복사 되었을 것이다.

다시 git bash로 돌아와서 다음 명령어를 적어준다.

`git clone --branch lecture https://github.com/AthiLog/athi.git`

![git 가져오기](https://i.imgur.com/f1cO68W.png)

--branch lecture 옵션을 써준 이유는 master branch(master폴더)가 아닌 lecture branch(lecture 폴더를) 가져올 것이기 때문이다.

그럼 이제 내 문서에 들어가보면 github에서 가져온 파일들이 생길 것이다.

VSCode로 가져온 파일을 열어보자.

![구성](https://i.imgur.com/ToGOlHI.png)

위와 같은 파일구성으로 화면이 뜬다면 성공이다.

위 폴더와 파일 구성을 jekyll이라고 하는데 jekyll을 서버로 실행시킬려면 ruby 개발 환경이 필요하다.

다음 강의는 마지막 설치 강의로 ruby를 설치할 것이다.
