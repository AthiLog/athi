---
title: "#1 좋은 글쓰기-배포하기"
subtitle: "How to deploy site"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "/img/a.jpg"
tags: [goodwriting-series, jekyll]
date: 2019-01-06 12:12:12
---

# pugins사용시 배포할 때

Depending if you deal with a User/Organization (**UO**) site or a Project site (**P**), do :

1.  from your working folder `git init`
2.  `git remote add origin git@github.com:userName/userName.github.io.git` (**UO**) or `git remote add origin git@github.com:userName/repositoryName.git` (**P**)
3.  `jekyll new .` creates your code base
4.  in _\_config.yml_, set the _baseurl_ parameter to `baseurl: ''` (**UO**) or `baseurl: '/repositoryName'` (**P**)
5.  in _.gitignore_ add **\_site**, it will be versioned in the other branch
6.  `jekyll build` will create the destination folder and build site.
7.  `git checkout -b sources` (**UO**) or `git checkout master` (**P**)
8.  `git add -A`
9.  `git commit -m "jekyll base sources"` commit your source code
10. `git push origin sources` (**UO**) or `git push origin master` (**P**) push your sources in the appropriate branch
11. `cd _site`
12. `touch .nojekyll`, this file tells gh\-pages that there is no need to build
13. `git init` init the repository
14. `git remote add origin git@github.com:userName/userName.github.io.git` (**UO**) or `git remote add origin git@github.com:userName/repositoryName.git` (**P**)
15. `git checkout master` (**UO**) or `git checkout -b gh-pages` (**P**) put this repository on the appropriate branch
16. `git add -A`
17. `git commit -m "jekyll first build"` commit your site code
18. `git push origin master` (**UO**) or `git push origin gh-pages` (**P**)

You now have something like [Octopress](http://octopress.org/docs/) does. Look at their rake file, there are some nice comments inside.
\_site만 따로 분리해서 github에 배포해야 한다.
그냥 올릴 시 github pages는 인식하지 못한다.

# 참고자료

- [https://stackoverflow.com/questions/28249255/how-do-i-configure-github-to-use-non-supported-jekyll-site-plugins/28252200#28252200#fromHistory](https://stackoverflow.com/questions/28249255/how-do-i-configure-github-to-use-non-supported-jekyll-site-plugins/28252200#28252200#fromHistory)
