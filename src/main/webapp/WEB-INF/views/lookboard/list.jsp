<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>5LOOK 홈페이지</title>
<!-- 홈페이지에 해당하는 CSS -->
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"> </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

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
      if ((fullHeight-screenHeight) <= scrollPosition && !oneTime) { //만약 전체높이-화면높이가 스크롤포지션보다 작아진다면, 그리고 oneTime 변수가 거짓이라면
         removeEventListener('scroll',OnScroll,{passive:true});
         oneTime = true; // oneTime 변수를 true로 변경해주고,
        console.log("count2 : " + count2);
        if(count == ${page.endPage}){
          console.log("끝");
          oneTime = true;
       }else{
          madeBox(); // 컨텐츠를 추가하는 함수를 불러온다.
        count2 = count2 +1;
       console.log("infinite 의 높이 : " + fullHeight);
         console.log("화면크기 : " + screenHeight);
         console.log("스크롤 위치 : " + scrollPosition);
          console.log("count : " + count);
          //oneTime = false;
       }
        count = count + 1;
      }
    }//onsroll
   
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
         oneTime = false; // oneTime을 다시 false로 돌려서 madeBox를 불러올 수 있게 해주기
       } else {
         console.error(xhr.response);
         
       }
     }
   };
   xhr.open('GET', nextURL); // 다음페이지의 정보를 get
   xhr.send();
   xhr.responseType = "document";
   }
   }
YesScroll();
function likecnt(email,idx,nickname){
   location.href = 'likeAction?user_email='+email+'&look_ref='+idx+'&user_nickname='+nickname;
}



//실시간 시계
var clockStart = setInterval(function() {
   var today = new Date();
   var dayList = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']
   var hh = addZero(today.getHours());
   var mm = addZero(today.getMinutes());
   var ss = addZero(today.getSeconds());
   var YY = today.getFullYear();
   var MM = today.getMonth()+1;
   var DD = today.getDate();
   
   var dd = dayList[today.getDay()].toUpperCase();
   document.getElementById('hours').innerText = hh;
   document.getElementById('min').innerText = mm;
   document.getElementById('sec').innerText = ss;
   
   document.getElementById('month').innerText = MM;
   document.getElementById('date').innerText = DD;
   document.getElementById('year').innerText = YY;
   document.getElementById('day').innerText = dd;
   
   function addZero(num) {
      return (num < 10 ? '0'+num : ''+num);
   }
}, 1000)
 
</script>
<style>
#background{
   background-image: url('${pageContext.request.contextPath}/resources/img/summer3.png');
   background-repeat: no-repeat;
   left: 50%;
   top: 50%;
   background-position: 50% 40%;
   color: white;
   height: 450px;
   width: 100%;
}
</style>
</head>
<body>
<!-- Responsive navBar-->
<jsp:include page="../include/header.jsp"></jsp:include>
<header class="py-5 bg-light border-bottom mb-4" id="background">
   <div class="container">
      <div class="text-center my-5">
          <br><br><br><h1 class="fw-bolder">오룩만의 특별한 여름 맞이 룩북</h1>
         <a href="#" style="color: white;">→ 여름 룩북 보러가기 ←</a>
      </div>
   </div>
</header>
<!-- Heading Row-->
<div class="infinite">
<div class = "list">
   <div class="container">
      <div class="row">
         <div class="col-lg-8">
               <c:if test="${page.currentPage == 1}">
             <div class="card mb-4">
               <div id="myCarousel" class="carousel slide" data-ride="carousel" style="overflow: hidden;">
                  <div class="carousel-indicators">
                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                  </div>
                     <div class="carousel-inner">
                     
                     <div class="carousel-item active">
                        <iframe class="card-img-top" width="560" height="415" src="https://www.youtube.com/embed/u7IYmlDIFv0" 
                        title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write;
                         encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                     </div>
                     <div class="carousel-item">
                        <iframe class="card-img-top" width="560" height="415" 
                           src="https://www.youtube.com/embed/e8ztD5tOoDU"  title="YouTube video player" 
                            frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media;
                           gyroscope; picture-in-picture" allowfullscreen >
                        </iframe>
                     </div>
                     <div class="carousel-item">
                        <iframe class="card-img-top" width="560" height="415" 
                           src="https://www.youtube.com/embed/Fal7Gqc_hjY" title="YouTube video player" 
                           frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media;
                            gyroscope; picture-in-picture" allowfullscreen>
                        </iframe>                        
                     </div>
                     
                  </div>
                  <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                     <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                     <span class="sr-only">Previous</span>
                  </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                     <span class="carousel-control-next-icon" aria-hidden="true"></span>
                     <span class="sr-only">Next</span>
                  </button>
               </div>               
            </div>
            <div class="home-menu">
               <c:if test="${loginUser!=null }">
                  <a class="btn btn-primary" style="margin-right: 85%;" href="insert?page=1">
                     글쓰기<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                    </a>
               </c:if>
               <!-- home 버튼인데 굳이 없어도 될 것 같음
               <a class="btn btn-primary" href="${pageContext.request.contextPath }">
                       홈<i class="fa fa-home" aria-hidden="true"></i>
                    </a> -->
            </div>
            </c:if>
            <div class="row">
            <%-- <c:forEach var = "vo" items="${list}">
                        <script>
                        	like(${vo.look_idx},${loginUser.user_email});
                        </script>            
            </c:forEach> --%>
                   <c:forEach var="vo" items="${list}">
                  <div class="list">
                         <div class="card-one">
                        <a href="detail?idx=${vo.look_idx}&page=1">
                        <img style = "width : auto; height : auto;" class="card-img-top" src="${pageContext.request.contextPath}/image/t-${vo.look_filename}"/></a>
                           <div style="margin-top: 3%; margin-left: 2%;">${vo.user_nickname}</div>
                        <div class="card-body bottom">
                        <c:if test = "${vo.look_like_email == '1'}">
                           <a class="btn btn-primary btn-sm" href="javascript:likecnt('${loginUser.user_email}','${vo.look_idx}','${loginUser.user_nickname}')"><i class="fa fa-heart" aria-hidden="true"></i>  ${vo.look_like}</a> <!-- 색칠하트  -->                                               
                        </c:if>
                        
                        <c:if test = "${vo.look_like_email == '0'}">
                           <a class="btn btn-primary btn-sm" href="javascript:likecnt('${loginUser.user_email}','${vo.look_idx}','${loginUser.user_nickname}')"><i class="fa fa-heart-o" aria-hidden="true"></i>  ${vo.look_like}</a>
                        </c:if>
                           <a class="btn btn-primary btn-sm" href="#!"><i class="fa fa-commenting-o" aria-hidden="true"></i>  ${vo.look_cmt}</a>
                           <a class="btn btn-primary btn-sm" href="#!"><i class="fa fa-eye" aria-hidden="true"></i>  ${vo.loview_cnt}</a>
                           <p class="card-text">${vo.look_content}</p>
                           <div class="small text-muted"></div>
                        </div>
                     </div>
               <div class="col-lg-4"></div>
            </div>
                  </c:forEach>
               <div class="pagination">
                  <a class="nextPage" id="nextPage2" href="?page=${page.currentPage+1}"></a>
               </div>
            </div>
         </div>
         <!-- Search widget-->
         <div class="col-lg-4">
            <c:if test="${page.currentPage == 1}">
            <div class="card mb-4">
               <div class="card-header">Search</div>
               <div class="card-body">
                  <div class="input-group">
                     <form action = "list">
                        <select class="selectpicker form-control" name="field" style="margin-bottom:3%; width:75px; display: inline-block;">
                           <option value="C" <c:if test = "${field='C'}">selected</c:if>>내용</option>
                           <option value="N" <c:if test = "${field='N'}">selected</c:if>>작성자</option>
                        </select>
                        <input type="text"  class="form-control" name = "findText"
                           value = "${findText}" placeholder="검색할 단어 입력" 
                           aria-describedby="button-search" style="margin-bottom:3%; width: 175px; display: inline-block;" />
                        <button type="submit" class="btn btn-lg btn-primary btn-block" style="height: 40px; padding-bottom:15px;" id="button-search" >Go!</button>
                     </form>
                  </div>
               </div>
               
            </div>
            <div class="card mb-4">
            
               <div class="card-header">Time Widget</div>
               <div class="card-body">
                  <div class="clock">
                     <div class="time_box">
                        <span class="txt_lg" id="hours"></span>
                        <span class="mark02">:</span>
                        <span class="txt_lg" id="min"></span>
                        <span class="mark02">.</span>
                        <span class="txt_sm" id="sec"></span>
                     </div>
                     <div class="date_box">
                        <span id="month"></span>
                        <span class="point">.</span>
                        <span id="date"></span>
                        <span class="point">.</span>
                        <span id="year"></span>
                        <span id="day"></span>
                     </div>
                  </div>
               </div>
            
            </div>
            </c:if>
         </div>
      </div>
      <!-- Categories widget-->
      <!-- 나중에 카테고리도 추가할거면 주석 해제하기
      <div class="card mb-4">
         <div class="card-header">Categories</div>
          <div class="card-body">
            <div class="row">
               <div class="col-sm-6">
                  <ul class="list-unstyled mb-0">
                      <li><a href="#!">여름 룩북</a></li>
                     <li><a href="#!">ootd</a></li>
                     <li><a href="#!">브랜드관</a></li>
                  </ul>
               </div>
               <div class="col-sm-6">
                  <ul class="list-unstyled mb-0">
                     <li><a href="#!">자유게시판</a></li>
                     <li><a href="#!">중고거래</a></li>
                  </ul>
               </div>
            </div>
         </div>
      </div> -->
   </div>
   </div>
</div>
<!-- list class -->
<!--infinite class  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="../include/footer.jsp"></jsp:include>

<!-- Javascript -->

</body>
</html>