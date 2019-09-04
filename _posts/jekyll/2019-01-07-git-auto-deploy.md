---
title: "#7 Git 자동화 하는법"
subtitle: "auto deploy"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "/img/c.jpg"
tags: [jekyll-blog-series]
date: 2019-01-07 12:12:12
---

간단하다. sh파일을 만들어서 지금 까지 입려했던 명령어를 적어주면 된다.

최상위 폴더에서 auto.sh 파일을 만들고(파일명은 맘대루) 다음 명령어를 입력해 준다.

```bash
#!/bin/bash

bundle exec jekyll build

cd _site
git add .
git commit -m "commit"
git push origin master
```

그리고 나서 이걸 실행시켜주면 끝이다.

./auto.sh 입력 후 엔터 끝!!
