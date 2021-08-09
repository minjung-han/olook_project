<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fnt" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<!-- 홈페이지에 해당하는 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- 나눔고딕 폰트 적용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Myeongjo&family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"> </script>
<script src="https://ajax.googleapix.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">


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
			<a class="p-2 text-muted" href="#">Q & A</a>
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
			<c:choose>
				<c:when test="${loginUser.user_filename == '' }">
					<i class="fa fa-user-circle fa-3x"></i>
				</c:when>
				<c:otherwise>
					<img src="${pageContext.request.contextPath}/image/p-${loginUser.user_filename }" class="img-thumbnail">
				</c:otherwise>
			</c:choose>
			<span class="mypage-text" style="font-size: 22px;"><b>${loginUser.user_nickname }</b>님 환영합니다</span>
			<p class="mypage-text mb-0">${loginUser.user_email }<br>
				${loginUser.user_intro}<br>
			</p>
			<br><a class="mypage-text" href="updateUser">프로필 수정</a>
			<br><a class="mypage-text" href="changePwd">비밀번호 변경</a>
			<br><br><a class="mypage-text" href="deleteUser?user_email=${loginUser.user_email }">회원탈퇴</a>
		</div>
	</div>
	<div class="col-sm-6" style="display: inline-block;">
		<span>0</span><br>		
		<span>게시물</span>			
	</div>
	<div class="list">
		<form action="list" method="post">
			<div class="card-one">
				<c:forEach items="${Lookboard }" varStatus="vo">
					${vo.look_date }
					<a href='detail?user_email=${user_email }'><img src="${pageContext.request.contextPath}/image/p-${vo.look_filename}"></a>
					${vo.look_content }
				</c:forEach>
			</div>
		</form>
	</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>