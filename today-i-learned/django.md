# [study link](https://www.udemy.com/course/django-core/learn/lecture/5943638#content)

# 학습목표 
- [x] 파일 구조파악하기
- [x] best practice main.html 구조화 시키기 
- [x] best practice 파일 만들고 관리하기

## django-admin.py vs manage.py 차이
- django-admin.py을 써서 project를 만들어야지 manage.py가 나온다. 
[근거링크](https://devlog.jwgo.kr/2018/02/07/what-is-the-diff-btw-manage-django-admin/)

## HttpsResonse django 사용하는 이유
- httpsresonse말고도 사용하는방법은 2가지가 더있다. (총3가지이다.)
[설명링크](https://www.udemy.com/course/django-core/learn/lecture/5933212#announcements)
[근거링크](https://devlog.jwgo.kr/2016/11/08/python-jango-why-generic-views/)

## how to use redirect in django
- HttpResponseRedirect('/some/path')
[link](https://www.udemy.com/course/django-core/learn/lecture/5933212?start=629#notes)

## django 마이그레이션이 필요한 이유
- 데이터베이스에 접속해서 직접 생성하고 삭제 관리 하기에 번거롭다, 만약 현재 개발중인 언어로 데이터베이스를 하나의 파일에서 관리 할수있다면 엄청 편하지 않을까 ? 그래서 나온것이 migrate기능이다. 대부분의 언어는 이러한 데이터베이스 마이그레이트 기능이 있다.
- 공식홈페이지에서도 django 에서 데이터베이스 생성 삭제 수정 관리를 용이하게 하기위해 제공한다고 나와있다.
Migrations are Django’s way of propagating changes you make to your models (adding a field, deleting a model, etc.) into your database schema. 
[링크](https://docs.djangoproject.com/en/3.1/topics/migrations/)

- 설명이 잘되어있는 [링크](https://velog.io/@matisse/Django-migrations-%EC%A7%91%EC%A4%91-%ED%83%90%EA%B5%AC)

## django 구조 는 어떻게 이루어져있는가
- 그림참고 urls 이 먼저이고 urls.py에서 views.py를 불러온다.
![Image](https://t1.daumcdn.net/cfile/tistory/2215F53B528EB8F42D)
- [근거링크](https://bcho.tistory.com/820)

## 데이터 바인딩 하는방법 djang에서 
- django에서는 context를 통해서 template폴더안에있는 프론트에 데이터를 연결한다.
[자세한설명](https://www.udemy.com/course/django-core/learn/lecture/5933248?start=155#notes)
[간간한설명](https://bcho.tistory.com/820)

## 데코레이터란 ?
- 쉽게 사용하고, 쉽게 제거할수있는 장점을 기반으로해서, 반복적으로 사용하는것을 미리 만들어서 사용한다, 대표적으로 "로그인 데코레이터" 가 있다.
[설명](https://www.udemy.com/course/django-core/learn/lecture/5933228?start=223#notes)
[한글설명](https://velog.io/@misun9283/django-%EB%A1%9C%EA%B7%B8%EC%9D%B8-%EB%8D%B0%EC%BD%94%EB%A0%88%EC%9D%B4%ED%84%B0)

@login_required(login_url='/login/')

## Login required decorator 란
- 간단하게 로그인한 유저들만 볼수있는 페이지를 구현할수있고, 쉽게 auth를 제거도 할수있다.

## blog.com/1  , blog.com/2 처럼 detail view example
[설명](https://www.udemy.com/course/django-core/learn/lecture/5933226#content)

## block template example 
{% block headerScripts %}
  <!-- custom style 
  <link rel="stylesheet" href="/static/css/main.css" />
  -->
  <link rel="canonical" href="https://keenthemes.com/metronic" />
{% endblock %}

# django 페이지 추가하기
1. urls.py에 추가한다.
    path('google-analytics', views.google_analytics, name='google_analytics'),
2. views.py에 연결한 페이지 함수를 만든다.
    def google_analytics(request):
        if auth.get_user(request).username == "":
            return redirect('/signin')
        return render(request, 'main-google-analytics.html')
3. root 페이지에 block 을 만든다
4. sub page에 동일한 네이밍으로 block을 쓴다.
5. sub page에 extends를 씀으로서 연결고리를 만든다.
6. sub page block안에 작성한다.

## CRUD example
- input page example
[설명](https://www.udemy.com/course/django-core/learn/lecture/5933232#content)
- update page example
[설명](https://www.udemy.com/course/django-core/learn/lecture/5933234#content)
이하생략

## view 구현방법 크게 2가지다 class based view vs function based view
- class based view 는 자주 사용하는것 미리 만들어둔것 (리스크페이지, 서치, 생성)
[설명](https://wayhome25.github.io/django/2017/05/02/CBV/0)

## class based view list - type class based view api 
[링크](https://docs.djangoproject.com/en/3.1/ref/class-based-views/)

## funtion based view 란 ?
- def signup(request): 이런식으로 섰던것을 말한다.

## 왜 urls.py는 2개일까 ? django folder 와 app folder
- 추측하자면, app과, common분리정도 ?

## main.html의 데이터바인딩은 어느파일에서? 
- views.py에서관리하는데 ,없다면 ? 
-> 불러올 값이 없다.  (현 프로젝트)
- {% comment %}  {% endcomment %} 문법은 데이터 바인딩이 아니다.

## 페이지를 추가한다면 ?
- views.py에 추가 urls.py에추가 -끝!

## {% comment %}  {% endcomment %} 이 문법에 대해서 알고싶다
- 템플릿확장이다.
- sub page에 {% extend main.html %} 이렇게 써주면된다.
- root page에는 부분마다 {%block sub-page %} {%endblock sub-page %} 를 해주면된다. 

## classed based view custom은 ?

## visual studio 에서 block syntax fold 하는 방법 
- Install Extentions : Django - Baptiste Darthenay 1,511,152
- No need to restart IDE

## {% load spacetonbsp %} 이란 정적 파일을 불러오는것 
- spacetonbsp.py를 불러오는것 이다.
- [link](https://docs.djangoproject.com/en/3.0/ref/templates/builtins/#load)

## django template 주석처리
- {% comment %} {% endcomment %} - 멀티플 주석
[공식문서](https://docs.djangoproject.com/en/3.0/ref/templates/builtins/)
[간단설명](https://stackoverflow.com/questions/719915/how-to-put-comments-in-django-templates)






# 질문
1. main.html 1만줄 을 나눌수없나 ? 병렬작업이 안된다. 어떻게 나누는게 좋을까 ?
2. templates 한번에어떤것이 root인지 알기가 어렵다, 네이밍을 잘해야하나 폴더를 나눠야하나 ?
- 같은고민 하지만 답은 찾지못함 https://stackoverflow.com/questions/53754158/what-is-the-best-practice-in-structuring-templates-in-your-django-project 
metronic 프론트가 angular 와 react, vuejs버전도 있으니 살펴보면 될듯.
3. 눈빠진다. 1만줄을 어떻게 보나, 스페이스 하나만 눌러도 에러가 나버린다. 
4. css작업은? 병렬작업 어떻게하나 ? 앵귤러 처럼 콤포넌트단위 개발이 딱좋은것같은데 ?
5. 페이지 추가할때 링크가 없는데 에러가안날까 나게하는방법은?
6. 페이지 추가할때 커맨드가있을까, 혼동된다. 
7. 린트 조정하는방법 . ide 빨간불 혼동된다.



# 디버깅

## 디버깅하는방법 - 현재 로그인되어있는지 아닌지 확인하는방법
- httpsReponse를 사용하면 편하다.
- print(request.user)
[설명](https://www.udemy.com/course/django-core/learn/lecture/5933228?start=53#notes)

## 간단한 디버깅 print 로 해보기
- print(id) 이런식으로 해보면 쉽게 알수있다.
[설명](https://www.udemy.com/course/django-core/learn/lecture/5933226?start=543#notes)


# Best Ref
- [best pratice sample](https://www.kite.com/blog/python/django-templates-best-practices/)
- [django 한글](https://wikidocs.net/9623#cbv) 

# Account
Techroad2019@gmail.com / udemy

