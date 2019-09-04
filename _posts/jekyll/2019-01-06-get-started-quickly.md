---
title: "#6 빠르게 만들어보고 배우기"
subtitle: "Get started quickly"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "/img/a.jpg"
tags: [jekyll-blog-series]
date: 2019-01-06 12:12:12
---

# 미리보기 서버 실행시키기

전 강의에서 모든 설치를 완료하였으므로 이제 서버를 실행 시킬 수 있습니다.

cmd(명령 프롬프트)창을 켜도되고, bash 창을 켜서 하셔도 됩니다.  
저는 cmd창을 키고 진행하겠습니다.

cmd에서는 `dir` 명령어는 현재폴더에 있는 목록들을 확인 할 수 있습니다.
이동 명령어는 `cd`로 똑같습니다.

git clone으로 가져온 파일 목록에 가서 `jekyll serve` 미리보기 서버를 실행시켜줍니다.

![서버실행](https://i.imgur.com/4hOXykO.png)

저렇게 뜨면 잘 실행이 성공한 것 입니다.

`http://127.0.0.1`은 `로컬주소`

즉 인터넷을 통해 다른 컴퓨터에 접속하는 서버가 아닌 자기컴퓨터에서 접속할 수 있음을 뜻하고

`:4000`은 `포트`를 의미

포트란 서버에 들어갈 수 있는 문이 여러개가 있는데 4000이라고 적혀져 있는 문을 열어 놓은거라고 할 수 있습니다.

`/athi/`는 따로 지정해 놓은것으로 나중에 원하는대로 바꿀 수 있습니다.

그래서 이제 미리보기 서버를 접속할 수 있습니다.

인터넷에 아래를 주소창에 입력해주면 접속이 잘 됩니다.

🔥주의! `/`를 꼭 붙여주세요.

`http://localhost:4000/athi/`

`http://127.0.0.1:4000/athi/`

![접속](https://i.imgur.com/8gTRCuN.png)

# 글 작성하기

## 글작성 폴더

![폴더구조](https://i.imgur.com/IyqZUK1.png)

이렇게 생긴 폴더구조에서 당장 필요한건 `_posts`폴더 입니다.

이 폴더에 평소 우리가 컴퓨터 폴더에서 텍스트파일을 만들고 글을 쓰고 저장하는 것처럼 작성하면 됩니다.

## 글쓰기 위해 markdown파일 만들기

🔥 주의!

1. 파일명 형식이 앞에 날짜가 들어가 있어야하고 파일제목에는 한글이 들어가선 안됩니다(jekyll이 인식하지 못하기 때문).
   yyyy-mm-dd-english-title.md

2. data시간이 [utc(세계 표준시계)](https://time.is/UTC)를 넘어가면 블로그에 표시가 되지 않습니다.

지금 현재 저의 \_post폴더 상태입니다.

![post폴더](https://i.imgur.com/ynu5fWS.png)

여기서 `test폴더`를 만들고 `2019-06-30-test-posting.md` 파일을 만들겠습니다.

## 글 내용 입력하기

`2019-06-30-test-posting.md` 파일에 다음과 같이 입력해주시면 됩니다.

아직 이해되지 않더라도 따라와 주세요.

차근 차근 설명해 드리겠습니다.

```
---
title: "#00 테스트 글 작성"
subtitle: "Test Posting"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "/img/a.jpg"
tags: [test1, tag2, tag3]
date: 2019-06-30 12:12:12
---

# Dolor sit amet?

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vestibulum non mi non pulvinar. Donec tempus risus vel ex fringilla tempor. Vivamus pharetra non mauris quis fermentum. Vestibulum sed maximus elit, sit amet suscipit orci. Morbi at enim at libero dignissim egestas vel ac nisi. Etiam at lectus a arcu sodales consequat. Aliquam consequat ligula sed purus tincidunt, a ultrices nibh dapibus. Phasellus convallis ipsum nec semper ultricies. In facilisis lacus velit, sit amet lacinia velit blandit id. Nullam ut magna erat. Aliquam sit amet dapibus odio, aliquet tempus tortor. Donec in nisi massa.

# Aliquam suscipit.

Cras eget nisl accumsan, porta nisl in, egestas sapien. Vestibulum gravida nulla sed facilisis tempor. Suspendisse maximus nisi sit amet velit sodales fringilla. Vivamus luctus risus eget dui consectetur porttitor. Maecenas ut ultrices orci. Maecenas mollis est eu sodales mollis. Nulla facilisi. Suspendisse eros arcu, elementum sed sem eu, pharetra rhoncus odio. Proin nec tincidunt velit. Cras nisl augue, faucibus sed mauris in, vestibulum mollis nisl. Nam id libero ultrices, consequat ex vitae, convallis nulla.

## 두번째 태그

`Aliquam suscipit fermentum mauris a accumsan. In facilisis, mauris quis pulvinar tempus, turpis sapien sodales nibh, nec feugiat augue est quis nisi.` Fusce eget odio feugiat, luctus quam et, dapibus nulla. Sed ornare lacus non libero lacinia pretium. In eu dui vitae purus euismod feugiat ac ac est. Morbi vitae pretium lorem, non eleifend felis. Nullam at massa feugiat, rutrum elit at, semper lacus. Etiam vel rutrum felis. Nullam quis auctor lorem, et tempor arcu.

### 세번째 태그

Lorem ipsum dolor sit amet, consectetur adipiscing elit. `Proin vestibulum non mi non pulvinar.` Donec tempus risus vel ex fringilla tempor. Vivamus pharetra non mauris quis fermentum. Vestibulum sed maximus elit, sit amet suscipit orci. Morbi at enim at libero dignissim egestas vel ac nisi. Etiam at lectus a arcu sodales consequat. Aliquam consequat ligula sed purus tincidunt, a ultrices nibh dapibus. Phasellus convallis ipsum nec semper ultricies. In facilisis lacus velit, sit amet lacinia velit blandit id. Nullam ut magna erat. Aliquam sit amet dapibus odio, aliquet tempus tortor. Donec in nisi massa.

> 인간은 최선의 선택이 아닌 만족하기를 한다.



```

## 태그 추가 된것 확인하기

![서버확인](https://i.imgur.com/bQH3PtI.png)

이제 각 태그를 클릭해보세요.  
각 태그에 맞는 작성된 글이 분류된 것을 확인하실 수 있습니다.

![글 작성된것 확인](https://i.imgur.com/qNoZb3J.png)

이렇게 예쁘게 글이 작성도 되었구요.

![글 작성된것 확인2](https://i.imgur.com/uIMUXIK.png)

하지만 자세히 보시면 태그에 색깔이 입혀지지 않은태그 tag2, tag3가 추가 된것을 보실 수 있습니다.

그것은 저희가 태그를 test1, tag2, tag3 추가 했기 떄문이죠.

test1은 이미 만들어진 태그이기 때문에 따로 빨간색으로 이미 존재하지만 tag2와 tag3은 저희가 따로 색깔을 입혀야 합니다.

자동으로 랜덤색이 지정됬으면 좋겠다구요?  
모든 강의를 마치면 그것도 하실 수 있을 겁니다.

색깔은 저를 주로 [팔레트](https://flatuicolors.com/)에서 가져와서 씁니다.
![팔레트](https://i.imgur.com/no8nQ3Y.png)

회색 - `#636e72`
검정색 - `#2d3436`

저는 이 두색을 가져왔습니다.

이제 `css->modern-blog.css` 파일로 가주세요.

스크롤을 맨 아래쪽으로 내리시면

주석으로 `--------TAG--------` 되었는걸 보실 수 있습니다.

![태그주석](https://i.imgur.com/bBP6nfP.png)

여기에 다음과 같이 적어주시면 됩니다.

```css
.[주석명]TagLink > code {
  background: [색깔] !important;
}
```

제 상황같은 경우 다음 코드를 추가 해줄 겁니다.

```css
.tag2TagLink > code {
  background: #636e72 !important;
}
.tag3TagLink > code {
  background: #2d3436 !important;
}
```

잘 추가 되었다면 색깔이 바뀐걸 확인할 수 있습니다.

![색깔추가](https://i.imgur.com/KpfOVM6.png)

### 왜 태그형식인 블로그인가?

글을 쓰다보면 주제가 겹치는 경우가 있습니다.

태그형식을 쓰면 글을 두번 쓰는걸 방지할 수 있고 따라서 블로그가 지져분해지는걸 방지할 수 있습니다.

카테고리 형식을 추가적으로 쓰지 않은 이유는 블로그를 볼 때 직관적인것을 헤치므로 추가하지 않았습니다.

## 작성법 이해하기

글 가장 위에는 포스팅할 글에 대한 정보를 작성하고 그 밑에는 markdown처럼 작성하시면 됩니다.

```
title = 글 제목
subtitle = 소제목
author = 저자명
avatar = 나를 대표할 만한 아바타 이미지
image = 글 이미지
tags = 태그 지정
data = 게시날짜
```

다른건 다 잘 이해되는데 avatar & image 부분이 잘 이해 안되는분이 계실겁니다.

그건 바로 `img폴더`를 사용했기 때문인데 왼쪽에 보시면 img폴더가 보이실 겁니다.

![이미지폴더](https://i.imgur.com/bSx8GG3.png)

여기에 우리가 원하는 이미지를 저장해놓고 불러와서 씁니다.

avatar와 image에는 `/img/` 경로부터 시작에 내가 원하는 사진이 있는곳까지의 경로를 적어준 것입니다.

🔥주의! 이미지를 포스팅할 때는 규격에 맞춰서 해주어야 깔끔하게 포스팅 됩니다.  
이미지 규격은 1920x1200 입니다.

이 떄 그렇게 이미지 규격에 맞는 이미지를 어느 세월에 구하냐고 하시는분이 계실텐데 걱정하지 마세요.  
unsplash에서 고퀄이미지를 규격에 맞게 가져올 수 있습니다

### unsplash에서 무료로 고퀄이미지 가져오기

[unsplash](https://unsplash.com/)
unsplash에 들어가서 원하는 이미지를 찾아주세요.

![원하는 이미지](https://i.imgur.com/ncgJSH6.jpg)

원하는 이미지를 클릭한뒤 주소창에 보면 `[사진id]`가 있습니다.

`[사진id]`를 이용해 주소창에 다시 밑에 형식으로 입력해주세요.

`https://source.unsplash.com/[사진id]/[사진가로크기]x[사진세로크기]`

`https://source.unsplash.com/ssiCmbyVKzs/1920x1200`

원하는 규격에 맞혀진 사진이 나온곳에서 마우스 오른쪽버튼을 누르고 다른 이미지 저장을 클릭에서 원하는 위치에 저장합니다.

![나온이미지](https://i.imgur.com/3tW8Fhx.jpg)

저는 img밑에 firework라고 저장 했습니다.

## 포스팅 글 이미지 수정

```
---
title: "#00 테스트 글 작성"
subtitle: "Test Posting"
author: "Athi"
avatar: "/img/authors/athi.png"
image: "/img/firework.jpg"
tags: [test1, tag2, tag3]
date: 2019-06-30 12:12:12
---
```

아까 포스팅 된글에서 image부분을 `firework.jpg`로 수정하면 포스팅된 글의 이미지가 바뀐걸 보실 수 있습니다.

![이미지수정](https://i.imgur.com/MwjGTYZ.png)

## avatar 이미지 수정하기

[아바타 이미지 만들기](https://www.favicon-generator.org/)

![아이콘](https://i.imgur.com/M4ShCkf.png)

이 사이트에서 원하는 이미지를 등록한 뒤 Create Favicon을 누르면

아바타 크기의 이미지가 만들어진다.

나머지는 이미지를 수정한 것처럼 똑가팅 하면 됩니다.

# 나만의 블로그 만들기(서버 배포하기)

이제 거의 다 오셨습니다.

이 챕터만 끝나시면 자동화 도구를 얻으실 수 있습니다.

## 저장소 만들기

![저장소 만들기1](https://i.imgur.com/NittvpN.png)

![저장소 만들기](https://i.imgur.com/rBMi1Nk.png)
🔥주의!

저장소명은 url 주소에서 마지막 부분에 들어갑니다.

신중히 정해주세요.

![blog](https://i.imgur.com/bOdGAGo.png)

이와 비슷한 화면이 나온다면 성공입니다.

## 배포하기 전 commit하기(원고 완성시키기)

### commit하기전 빌드하기(html파일로 변환시키는 작업)

최상위 폴더에서 `jekyll build` 명령어나 `jekyll serve`를 입력 해주세요.

`jekyll serve` 명령어는 실행 후 실행창을 꺼야 합니다.

빌드가 잘 되셨으면 \_site 폴더에 서버를 실행시키기 위한 모든 파일이 생겼습니다.

### commit하기

`_site 폴더`에 들어가서 다음명령어들을 차례대로 입력해주세요.

🔥주의!

최상위 폴더가 아닌 \_site폴더입니다.

```
git init .
git add .
git commit -m "commit"
git remote add origin [원격지 ur]
```

`git init .`

.git 파일을 생성하는 명령어 입니다.

.git 파일은 현재 폴더부터 하위에 있는 폴더들에 있는 모든 파일의 변경사항을 추적(기록)을 시작 합니다.

`git add .`

commit전 단계로 staged 단계로 넘기는 명령어 입니다.

`git commit -m "주석"`

staged에 있는걸 commit 상태로 넘기는 명령어 입니다.

""안에 있는 것은 commit한 것에대한 주석(설명) 입니다.

주석에는 자신이 원하는대로 적으시면 됩니다.

쉽게 애기하면 총 두 번의 수정할 수 있는 기회가 있습니다.

`git add .` 하기전 / `git commit -m "commit"` 하기전

- commit은 웹툰 원고를 그려서 제출해야하는데 웹툰원고를 완성시켜서 완성시킨 원고를 따로 완성시킨 원고 목록에 분류해놓은거라고 할 수 있습니다.

- add는 원고는 다 그렸지만 혹시 모르니 옆에다 두는 것 입니다.

만약 아직도 이해가 되지 않으신다면 Q&A에 남겨주세요.

그림을 동원해서라도 더 자세히 설명해 드리겠습니다.

`git remote add origin [원격지 url]`

원격지 url을 기반으로 원격지 별칭을 origin으로 정하고 추가합니다.

## 배포하기(원고마감 한 것을 출하기)

`git push origin master`

원격지 주소에 \_site에 있는 master(현재파일이 있는 폴더)를 업로드 합니다.

master라는 별칭은 git init . 할 때 자동으로 생겨 납니다.

## 글을 수정하고 블로그에 다시 등록하기

글을 수정하고

```
jekyll build or jekyll serve
git add .
git commit -m "commit"
git push origin master
```

해주면 자동으로 블로그에 업데이트 됩니다.

이로서 자동화도구를 얻으셨습니다.
