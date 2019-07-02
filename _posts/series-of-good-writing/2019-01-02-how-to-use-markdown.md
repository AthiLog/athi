---
title: "#2 Markdown 사용법"
subtitle: "How to use Markdown"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "/img/c.jpg"
tags: [goodwriting-series, VScode]
date: 2019-01-02 12:12:12
---

# 참고문서

[https://shd101wyy.github.io/markdown-preview-enhanced/#/markdown-basics?id=syntax-guide](https://shd101wyy.github.io/markdown-preview-enhanced/#/markdown-basics?id=syntax-guide)

# Markdown이란?

> \# 또는 \*와 같은 특수문자들을 이용해서 보다 빠르고 쉽게, 사전에 미리 정의해둔 스타일을 입히는 것이다.

# 굳이 Markdown을 써야하는가?

결론부터 말하면 글을 쓰는데 당신의 시간을 줄여줄 것이다.

처음에는 뭔가 어색하고 어렵게 느껴질 수 있다.

그게 정상이다 모든 처음하는 것은 어색하고 어렵다.

하지만 1~2시간만 사용하다보면 느낄 것이다.

와~~ 내가 이 좋은걸 이제야 알았지 하고 말이다.

처음 markdown을 만났을 때, 정말 보물을 발견한것처럼 기뻤다.

이 강의를 만든것도 개발자금이 없어서 돈을 보태기위해 만든것도 있지만,

내가 보물을 발견했던 이 기쁨을 개발자 뿐만 아니라 모든 사람들에게 공유하고 싶어서이기도 하다.

# 마크다운 문법 사용법

## 헤더

```markdwon
# 최상된 제목태그입니다.
## 두번째 제목 태그입니다.
### 세번째 제목 태그입니다.
#### 네번째 제목 태그입니다.
##### 다섯번째 제목 태그입니다.
###### 여섯번째 제목 태그입니다.
```

## 강조

```markdown
_This text will be italic_
_This will also be italic_

**This text will be bold**
**This will also be bold**

_You **can** combine them_

~~This text will be strikethrough~~
```

## enter

## 리스트

### 순서가 없는 리스트

```
* Item 1
* Item 2
  * Item 2a
  * Item 2b
```

### 순서가 있는 리스트

```
1. Item 1
1. Item 2
1. Item 3
   1. Item 3a
   1. Item 3b
```

## 이미지

```
![Alt Text](url)
```

이미지를 추가할 때는 이미지 호스팅이라는걸 쓰게 되는데

이미지 호스팅이란 이미지를 여러사람들이 이용하는 공유 웹서버에 올려 놓아서 내가 이미지를 저장해놓지 않아도 url로 가져다 쓸 수 있습니다.

이미지 호스팅을 이용할려면 MarkdwonPriview에서 마우스 오른쪽 클릭하시면 `Image Helper`나오는데, 클릭해주세요.

![이미지 헬퍼](https://i.imgur.com/UrDAvPZ.png)

업로드를 클릭하시고 원하는 이미지를 클릭하시면 됩니다.
단점은 한번에 한개씩 밖에 되질 않습니다.

![업로드](https://i.imgur.com/1yyP3jS.png)

이미지 호스팅을 이용하기 싫으시다면

위에 Copy image to workspace /assets folder를 클릭해주시면 됩니다.

## 링크

```
[GitHub](http://github.com)
```

## 인용구문

```
> We're living the future so
> the present is our past.

```

## 가로선

```
Three or more...

---

Hyphens

***

Asterisks

___

Underscores
```

## 인라인 코드

```
I think you should use an
`<addr>` element here instead.
```

## 코드블록 & 구문강조

```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```

## 작업

```
- [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported
- [x] list syntax required (any unordered or ordered list supported)
- [x] this is a complete item
- [ ] this is an incomplete item
```

## 표

```
First Header | Second Header
------------ | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column
```

## 이모지 & 이미지 추가하기

[이모지사이트1](https://emojipedia.org/)
[이모지사이트2](https://www.emojiengine.com/ko/)

위 사이트에서 복사 붙여넣기를 하시면 됩니다.
