---
title: "Jekyll 페이지네이션"
subtitle: "Jekyll Paginator"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "https://source.unsplash.com/5LOhydOtTKU/1920x1200"
tags: [jekyll]
date: 2019-06-04 16:12:12
---

## jekyll\-pagination 설치

```bash
gem install jekyll-pagination

```

## \_config.yml 파일 업데이트

\_config.yml 파일에 페이징 관련 정보를 추가한다.

```bash
paginate: 10                  # 페이징 처리 개수
paginate_path: "/page:num/"   # URL 규칙

```

## Gemfile 파일 업데이트

Gemfile 파일에 jekyll\-paginate 플러그인 정보를 추가한다.
플러그인 버전 정보는 github 페이지를 참조한다.
[https://pages.github.com/versions.json](https://pages.github.com/versions.json)

```bash
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.6"
  gem "jekyll-paginate", "~> 1.1.0"  # 추가
end

```

## bundle install & update

```bash
$ bundle install
$ bundle update

```

## index.html 추가

구동 시 index.html 파일이 필요하다.
index.md은 필요 없으므로 삭제하고, index.md가 쓰던 home 템플릿 역시 필요 없으므로 삭제한다.
다만, home 템플릿에 있던 내용은 필요하므로 index.html로 옮긴다.
(minima 기본 테마 기준)

## 페이징 코드 수정 & 추가

포스트 템플릿 반복문을 아래와 같이 변경한다.

```bash
for post in posts.posts      # as-is
for post in paginator.posts  # to-be

```

하단에 페이징 버튼 을 추가한다.test

```bash
{% raw %}

<!-- Pagination links -->
<div class="pagination">
  {% if paginator.previous_page %}
    <a href="{{ paginator.previous_page_path }}" class="previous">Previous</a>
  {% else %}
    <span class="previous">Previous</span>
  {% endif %}
  <span class="page_number ">Page: {{ paginator.page }} of {{ paginator.total_pages }}</span>
  {% if paginator.next_page %}
    <a href="{{ paginator.next_page_path }}" class="next">Next</a>
  {% else %}
    <span class="next ">Next</span>
  {% endif %}
</div>

{% endraw %}
```

## 주의

Paginator는 서버를 껐다 켜야 적용된다.

## 참조

- [pilot376블로그](https://pilot376.tistory.com/42)
