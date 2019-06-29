---
title: "#2 VSCode 설치하기"
subtitle: "How to install VScode"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "/img/a.jpg"
tags: [goodwriting-series, VScode]
date: 2019-01-01 12:12:12
---

# VScode

## VSCode란?

메모장은 모두들 아실 겁니다.
메모장을 다른말로 `텍스트 편집기`라고도 하는데

VSCode는 개발자를 위한 `텍스트 편집기`일 뿐입니다.
VSCode는 개발자들이 코드를 작성하면 예쁘게 볼 수 있게 도와주어서 한눈에 알아보기 쉽게 해줍니다.

텍스트 편집기는 정말 다양하게 여러가지가 있는데
Sublime Text, Atom, Vim, Emacs, 등등
이 모든걸 다 써본결과 정말 가볍고, 확장프로그램까지 완변하고 좋은 것이라고 판단 되는것이 VSCode입니다.
그래서 이 강의

## VSCode설치하기

[VSCode 다운로드](https://code.visualstudio.com/download)

위에 들어가서 자기 컴퓨터에 맞는걸 다운로드 하세요.

![vscode](https://i.imgur.com/mtMO3x3.png)

설치할 때 따로 설정은 필요없고 계속 next를 눌러주세요.

설치가 다 됬으면 vscode를 실행 시켜주세요.

## VSCode 실행

git bash에서 원하는 폴더에 들어가서
`code .`명령어를 실행시키거나

💬 git bash는 install github강의를 끝내면 사용하실 수 있습니다.

폴더창에서 마우스 오른쪽 클릭해서 vscode를 실행시키면 됩니다.
![vscode열기](https://i.imgur.com/91U7VSK.png)

## VScode 설정하기

### 🔧VScode Extensions 설치하기

왼쪽 상단에 보시면 다음과 같은 아이콘이 있을 겁니다. **제일 밑에 있는 아이콘**을 클릭해주세요.
![vscode구조](https://i.imgur.com/qMOw6B2.png)

그럼 여러가지 Extensions을 설치하실 수 있는데 다음 네가지 Extensions을 설치 할 겁니다.
모두 검색을 해서 다운받아 주세요.
다운 받을 떄는 install 버튼만 누르면 됩니다.

- Bracket Pair Colorizer: (),{},[] 이러한 괄호등에 색깔을 입혀 구분을 쉽게 도와줍니다.
- Color Hightlight: #fff, #000 이런 색상코드에 색깔을 표시해주어 생산성을 높여줍닌다.
- Markdown Preview Enhanced: 이 강의에서 가장 핵심이 되는 Extension으로 markdown 파일을 예쁘게 표시해줍니다.
- Prettier: 저장 버튼을 누르게 되면 코드를 예쁘게 정리해줍니다.

![extension1](https://i.loli.net/2019/06/28/5d15876a0874714097.png)
![extension2](https://i.loli.net/2019/06/28/5d1587d6a66bd83757.png)
![extension3](https://i.loli.net/2019/06/28/5d1587e0db73210219.png)
![extension4](https://i.imgur.com/3ZbMxdm.png)

다 설치했으면 창을 닫아주세요.
창을 열고 닫고 하는 단축키는
`ctrl + B` 입니다.

### 🔧 Markdown Preview Enhanced Extension 설정

`ctrl + shift + p` 키를 눌러서

Markdown Preview Enhanced: Customize CSS 검색 후 눌러 줍니다.

![markdown preview](https://i.imgur.com/v4l2gQR.png)

```less
/* 아래 코드를 Markdown Preview Enhanced: Customize CSS-> style.less에 복사 붙여넣기하고 저장 해주세요*/

.markdown-preview.markdown-preview {
  @font-face {
    font-family: "NanumBarunpen";
    src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumBarunpen.woff")
      format("woff");
    font-weight: normal;
    font-style: normal;
  }
  // task-list
  input[type="checkbox"]::after {
    border-width: 1px;
    border-style: solid;
    border-color: #3dbcf6;
    background: #3dbcf6;
  }

  input[type="checkbox"]:checked,
  del {
    opacity: 0.5;
  }

  ul {
    margin: 0;
  }

  // task-list

  // progress설정

  progress[value]::-webkit-progress-value {
    background-image: -webkit-linear-gradient(
        -45deg,
        transparent 33%,
        rgba(0, 0, 0, 0.1) 33%,
        rgba(0, 0, 0, 0.1) 66%,
        transparent 66%
      ),
      -webkit-linear-gradient(top, rgba(255, 255, 255, 0.25), rgba(255, 255, 255, 0.25)),
      -webkit-linear-gradient(left, #09c, #f44),
      -webkit-linear-gradient(bottom, #09c, #f44);

    border-radius: 2px;
    background-size: 35px 20px, 100% 100%, 100% 100%;

    animation: animate-stripes 5s linear infinite;
  }

  /* Styling the determinate progress element */

  progress[value] {
    /* Get rid of the default appearance */
    appearance: none;

    /* This unfortunately leaves a trail of border behind in Firefox and Opera. We can remove that by setting the border to none. */
    border: none;

    /* Add dimensions */
    width: 100%;
    max-width: 850px;
    height: 20px;

    /* Although firefox doesn't provide any additional pseudo class to style the progress element container, any style applied here works on the container. */
    background-color: whiteSmoke;
    border-radius: 3px;
    box-shadow: 0 2px 3px rgba(0, 0, 0, 0.5) inset;

    /* Of all IE, only IE10 supports progress element that too partially. It only allows to change the background-color of the progress value using the 'color' attribute. */
    color: royalblue;

    position: fixed;
    top: 15px;
    margin: 0 0 1.5em;
  }

  progress[value]::-webkit-progress-bar {
    background-color: #dadfe1;
    border-radius: 3px;
  }

  @keyframes animate-stripes {
    100% {
      background-position: -100px 0;
    }
  }

  .progress-bar span {
    position: fixed;
    width: 100%;
    max-width: 850px;
    top: 13px;
    border-radius: 3px;
    color: white;
    font-weight: 550;
    text-align: center;
    display: block;
  }

  // progress설정

  // h content
  h1::before {
    content: "#"; /* Insert content that looks like bullets */
    color: #f92672;
    margin-right: 10px;
  }

  h2::before {
    content: "##"; /* Insert content that looks like bullets */
    color: #f44;
    margin-right: 10px;
  }

  h3::before {
    content: "###"; /* Insert content that looks like bullets */
    color: #e6db74;
    margin-right: 10px;
  }
  // h content

  // 색깔
  .red {
    color: red;
    font-size: 20px;
    font-weight: 550;
  }

  .orange {
    color: orange;
    font-size: 20px;
    font-weight: 550;
  }

  .yellow {
    color: yellow;
    font-size: 20px;
    font-weight: 550;
  }

  .green {
    color: green;
    font-size: 20px;
    font-weight: 550;
  }

  .blue {
    color: blue;
    font-size: 20px;
    font-weight: 550;
  }

  .deepblue {
    color: darkblue;
    font-size: 20px;
    font-weight: 550;
  }

  .purple {
    color: purple;
    font-size: 20px;
    font-weight: 550;
  }

  // 색깔
  p {
    font-size: 23px;
    font-family: "NanumBarunpen";
    letter-spacing: 1.2px;
  }

  a {
    color: #845ef7;
    font-weight: 550;
  }

  hr {
    height: 1px;
  }

  code {
    background: #f1f3f5;
    border: 1px solid #ced4da;
  }
  h1 {
    // color: #fc4700d3;
    font-size: 40px;
    border-bottom: 1px solid #d6d6d6;
  }

  // h2 {
  //   background: #f9f9f9;
  //   border-left: 7px solid #dd4c39;
  //   padding: 0.5em 10px;
  // }

  blockquote {
    background: #f9f9f9;
    border-left: 10px solid #00cec9;
    margin: 1.5em 10px;
    padding: 0.5em 10px;
    quotes: "\201C""\201D""\2018""\2019";
  }
  blockquote:before {
    color: #ccc;
    content: open-quote;
    font-size: 4em;
    line-height: 0.1em;
    margin-right: 0.25em;
    vertical-align: -0.4em;
  }
  blockquote p {
    display: inline;
  }

  // 자바스크립트

  pre {
    background: #1e1e1e;
    color: #abb2bf;
  }

  .keyword {
    color: #c678dd;
  }

  .string {
    color: #98c379;
  }

  .punctuation {
    color: #abb2bf;
  }

  .function {
    color: #61afef;
  }

  .constant {
    color: #d19a66;
  }

  .class-name {
    color: #e5c07b;
  }
  // 자바스크립트

  // css
  .rule,
  .url {
    color: #e6db74;
  }

  .selector {
    color: #a6e22e;
  }

  .property {
    color: #f92672;
  }

  // css
}
```

저장을 했으면 그 다음에는
Markdown Preview Enhanced: Extend Parser을 검색 후 눌러 줍니다.

![markdown preview parser](https://i.imgur.com/mcKkugL.png)

```javascript
// 아래 코드를 Markdown Preview Enhanced: Extend Parser->parser.js에 복사 붙여넣기 하고 저장 해주세요.
module.exports = {
  onWillParseMarkdown: function(markdown) {
    return new Promise((resolve, reject) => {
      // markdown = markdown.replace(
      //   /\<red\>([\w\W]+?)\<\/red\>/g,
      //   (whole, content) => `<div class="red">${content}</div>`
      // );
      // markdown = markdown.replace(
      //   /(^|[^\*])\!(?!\*)(.*?[^\*])\!(?!\*)/g,
      //   (whole, content) => `<div class="red">${content}</div>`
      // );
      markdown = markdown.replace(
        /!!11([\w\W]+?)11!!/g,
        (whole, content) => `<p class="red">${content}</p>`
      );
      markdown = markdown.replace(
        /@@22([\w\W]+?)22@@/g,
        (whole, content) => `<p class="orange">${content}</p>`
      );
      markdown = markdown.replace(
        /##33([\w\W]+?)33##/g,
        (whole, content) => `<p class="yellow">${content}</p>`
      );
      markdown = markdown.replace(
        /$$44([\w\W]+?)44$$/g,
        (whole, content) => `<p class="green">${content}</p>`
      );
      markdown = markdown.replace(
        /%%55([\w\W]+?)55%%/g,
        (whole, content) => `<p class="blue">${content}</p>`
      );
      markdown = markdown.replace(
        /^^66([\w\W]+?)66^^/g,
        (whole, content) => `<p class="deepblue">${content}</p>`
      );
      markdown = markdown.replace(
        /&&77([\w\W]+?)77&&/g,
        (whole, content) => `<p class="purple">${content}</p>`
      );
      markdown = markdown.replace(
        /\-\s\[[d]\]\s(.+)/g,
        (whole, content) =>
          `<ul><li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" checked><del>${content}</del></li></ul>`
      );
      return resolve(markdown);
    });
  },
  onDidParseMarkdown: function(html) {
    return new Promise((resolve, reject) => {
      return resolve(html);
    });
  }
};
```

좋습니다.

여기까지 잘 따라오셨으면 벌써 우리가 사용할 기능의 절반을 사용할 수 있게 되셨습니다.

이제 Markdown을 쓰실 때 누구보다 멋지고, 예쁘게, 그리고 빠르게 쓰실 수 있습니다.

Markdown이 뭔지 모른다고요?

걱정하지마세요.

다음강의에 설명해드리겠습니다.

# Customizing

위의 코드는 제가 삽질하면서 만든 코드이고 나중에 따로 자기만의 스타일을 만드시고 싶은분들은 아래 문서를 참조하시면 됩니다.

[Customize CSS](https://shd101wyy.github.io/markdown-preview-enhanced/#/customize-css)
[Extend Markdown Parser](https://shd101wyy.github.io/markdown-preview-enhanced/#/extend-parser)
