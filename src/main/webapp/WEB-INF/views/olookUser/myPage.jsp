<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<!-- 홈페이지에 해당하는 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<!-- 나눔고딕 폰트 적용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Myeongjo&family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">
<style type="text/css">

</style>
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"> </script>
<script src="https://ajax.googleapix.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
let count = 1; //
let count2 = 2; //끝페이지를 맞추기위한변수 
console.log("test");
   var fullContent = document.getElementsByClassName('infinite'); // 전체를 둘러싼 컨텐츠 정보획득
function YesScroll() {
   
   const screenHeight = screen.height; // 화면 크기
   let oneTime = false; // 일회용 글로벌 변수
   document.addEventListener('scroll',OnScroll,{passive:true}) // 스크롤 이벤트함수정의
    function OnScroll () { //스크롤 이벤트 함수
      

    const fullHeight = fullContent[0].clientHeight; // infinite 클래스의 높이
   
    const scrollPosition = pageYOffset; // 스크롤 위치
      
      //(fullHeight-screenHeight) <= scrollPosition && !oneTime
      if ((fullHeight-screenHeight) <= scrollPosition && !oneTime) { // 만약 전체높이-화면높이가 스크롤포지션보다 작아진다면, 그리고 oneTime 변수가 거짓이라면
        oneTime = true; // oneTime 변수를 true로 변경해주고,
        console.log("count2 : " + count2);
        if(count == ${page.endPage}){
          console.log("끝");
          oneTiem = true;
       }else{
        oneTime = false;
        madeBox(); // 컨텐츠를 추가하는 함수를 불러온다.
        count2 = count2 +1;
       }
      
    console.log("infinite 의 높이 : " + fullHeight);
      console.log("화면크기 : " + screenHeight);
      console.log("스크롤 위치 : " + scrollPosition);
       console.log("count : " + count);
        
        count = count + 1;
      
      }
    }
    }

function madeBox(){
var pagination = document.getElementsByClassName('pagination');
const fullContent = document.getElementsByClassName('infinite');

const nextURL = "?page="+count2;
console.log("다음페이지" + nextURL);
   const xhr = new XMLHttpRequest();
   xhr.onreadystatechange = function() { 
     if (xhr.readyState === xhr.DONE) { 
       if (xhr.status === 200 || xhr.status === 201) {
         const data = xhr.response; // 다음페이지의 정보
         const addList = data.getElementsByClassName('list'); // 다음페이지에서 list아이템을 획득
         fullContent[0].appendChild(addList[0]); // infinite에 list를 더해주기
         //oneTime = false; // oneTime을 다시 false로 돌려서 madeBox를 불러올 수 있게 해주기
       } else {
         console.error(xhr.response);
         
       }
     }
   };
   xhr.open('GET', nextURL); // 다음페이지의 정보를 get
   xhr.send();
   xhr.responseType = "document";
   }
YesScroll();
function likecnt(email,idx,nickname){
   location.href = 'likeAction?user_email='+email+'&look_ref='+idx+'&user_nickname='+nickname;
}
</script>
</head>
<body>
<!-- Responsive navBar-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- Heading Row-->
<div class="container mypage">
	<header class="blog-header py-3">
		<div class="row flex-nowrap justify-content-between align-items-center">
			<div class="col-4 pt-1">
				<a class="text-muted">My Post</a>
			</div>
			<div class="col-4 text-center">
				<h2>My Page</h2>
			</div>
			<div class="col-4 d-flex justify-content-end align-items-center">
					<form action = "list">
						<a class="text-muted" href="#">
	                        <select class="selectpicker form-control" name="field" style="margin-bottom:3%; width:75px; display: inline-block;">
	                           <option value="C" <c:if test = "${field='C'}">selected</c:if>>내용</option>
	                           <option value="N" <c:if test = "${field='N'}">selected</c:if>>작성자</option>
	                        </select>
	                        <input type="text"  class="form-control" name = "findText"
	                           value = "${findText}" placeholder="검색할 단어 입력" 
	                           aria-describedby="button-search" style="margin-bottom:3%; width: 175px; display: inline-block;" />
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" 
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="mx-3">
								<circle cx="10.5" cy="10.5" r="7.5"></circle>
								<line x1="21" y1="21" x2="15.8" y2="15.8"></line>
							</svg>
						</a>
                     </form>
				<a class="btn btn-sm btn-outline-secondary" href="logout">Logout</a>
			</div>
		</div>
	</header>

	<div class="nav-scroller py-1 mb-2">
		<nav class="nav d-flex justify-content-between">
			<!-- 비어있는 a태그는 위치 맞추는 용도 -->
			<a class="p-2 text-muted"></a>
			<a class="p-2 text-muted"></a>
			<a class="p-2 text-muted"></a>
			<a class="p-2 text-muted" href="#">자유게시판</a>
			<a class="p-2 text-muted"></a>
			<a class="p-2 text-muted" href="#">Q&A</a>
			<a class="p-2 text-muted"></a>
			<a class="p-2 text-muted" href="#">Today's BestLook</a>
			<a class="p-2 text-muted"></a>
			<a class="p-2 text-muted" href="${pageContext.request.contextPath}/lookboard/insert?page=1">글쓰기</a>
			<a class="p-2 text-muted"></a>
			<a class="p-2 text-muted"></a>
			<a class="p-2 text-muted"></a>
		</nav>
	</div>
	<div class="jumbotron p-3 p-md-5 text-white rounded bg-dark">
		<div class="col-md-6 px-0">
			<span class="mypage-text" style="font-size: 22px;"><b>${loginUser.user_nickname }</b>님 환영합니다</span>
			<br><a class="mypage-text" href="olookEmailCheck">비밀번호 변경</a>
			<br><a class="mypage-text" href="updateUser">내 정보수정</a>
			<p class="mypage-text mb-0">${loginUser.user_intro}</p>
			<br><br><a class="mypage-text" href="deleteUser">회원탈퇴</a>
		</div>
	</div>
	<div class="list">
		<form action="list" method="post">
			<div class="card-one">
				<c:forEach items="${list }" var="list">
					${list.look_idx }
					${list.look_date }
					<img src="${pageContext.request.contextPath}/image/t-${list.look_filename}">
					${list.look_content }
				</c:forEach>
			</div>
		</form>
	</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>