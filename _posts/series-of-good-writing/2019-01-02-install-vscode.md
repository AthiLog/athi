---
title: "#2 VSCode 설치하기"
subtitle: "How to install VScode"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "/img/a.jpg"
tags: [goodwriting-series, VScode]
date: 2019-01-02 12:12:12
---

# VScode

## VSCode설치하기

## VScode 설정하기

### git bash설정

### VScode Extensions 설치하기

- Bracket Pair Colorizer
- Color Hightlight
- Markdown Preview Enhanced

🔧

```less
/* Please visit the URL below for more information: */
/*   https://shd101wyy.github.io/markdown-preview-enhanced/#/customize-css */

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