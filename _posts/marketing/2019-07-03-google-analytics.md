---
title: "google-analytics 사용법"
subtitle: "google-analytics"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "/img/f.jpg"
tags: [google-analytics]
date: 1999-06-03 12:12:12
---

## Jekyll을 사용한 blog에 Google Analytics 적용하기

Jekyll로 생성한 blog에 Google Analytics(이하 GA)를 적용해보자. 일단 Google 계정이 없다면 [Google부터 가입](https://accounts.google.com/SignUp)한 뒤, [GA에 가입](https://analytics.google.com/analytics/web/?authuser=0#provision/SignUp/)하자.

![](https://rextarx.github.io/assets/2017-02-03-Applying_Google_Analytics_to_a_blog_using_Jekyll/1.png)

가입은 간단하다. 아래와 같이 작성하면 된다.

![](https://rextarx.github.io/assets/2017-02-03-Applying_Google_Analytics_to_a_blog_using_Jekyll/2.png)

전부 작성 후 국가를 자신의 거주 국가로 맞춘 다음 약관 동의를 하자.

![](https://rextarx.github.io/assets/2017-02-03-Applying_Google_Analytics_to_a_blog_using_Jekyll/3.png)

가입이 완료 된 후에 관리 메뉴로 들어가면 우리가 사용해야 할 추적 ID가 발급되어 있는 것을 확인할 수 있다.
이를 이용하여 Jekyll 프로젝트에 적용하면 된다.

![](https://rextarx.github.io/assets/2017-02-03-Applying_Google_Analytics_to_a_blog_using_Jekyll/4.png)

만약 적용한 Jekyll 프로젝트에 \_config.yml 파일이 있다면, 해당 파일에서 g\-analytics 항목을 찾아서 해당 추적 ID로 변경하면 된다.

![](https://rextarx.github.io/assets/2017-02-03-Applying_Google_Analytics_to_a_blog_using_Jekyll/5.png)

\_config.yml 파일이 없다면, \_includes폴더 아래에 analytics.html 파일과 같이 설정 파일이 있을 텐데, 그쪽 코드를 변경하면 된다.
아래 코드에서 `UA-91308413-1`를 발급받은 추적 ID로 변경하자.

```javascript
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-143250392-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-143250392-1');
</script>
```

그리고 default.html 파일을 찾아서 아래 스크린샷과 같이 analytics.html 파일이 실행되도록 anaytics.html 추가 코드를 넣어주자.
default.html은 \_layouts 폴더 아래에 있다.

![](https://rextarx.github.io/assets/2017-02-03-Applying_Google_Analytics_to_a_blog_using_Jekyll/6.png)

적용을 모두 마친 후, 수정 사항을 모두 Push하고 스마트폰이나 기타 다른 Device에서 접근을 하고 GA에서 확인해보자.
확인은 **실시간** 메뉴에서 해야 한다.

![](https://rextarx.github.io/assets/2017-02-03-Applying_Google_Analytics_to_a_blog_using_Jekyll/7.png)
