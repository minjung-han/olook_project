<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
<script src="https://ajax.googleapix.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<style type="text/css">
.navbar-brand img{
	width: 100px;
	height: auto;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }">
			<img class="navbar-brand-img" alt="olook" id="olook_logo" 
				src="${pageContext.request.contextPath }/resources/img/로고9.png"/>
		</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
				data-bs-target="#navbarSupportedContent" data-target="#collapsibleNavbar"
				aria-controls="navbarSupportedContent" aria-expanded="false" 
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent" id="collapseibleNavbar">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }">Home</a></li>
						<c:choose>
							<c:when test="${loginUser==null }">
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/olookUser/olookUserPage">Join | Login</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/olookUser/myPage">Mypage</a></li>
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/olookUser/logout">Logout</a></li>
								<!-- <div class="btn-group">
									<button class="btn btn-secondary dropdown-toggle" onclick="location.href='${pageContext.request.contextPath }/olookUser/myPage'"
										type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<i class="fa fa-user-circle fa-2x"></i>
									</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<span class="dropdown-item">${loginUser.user_nickname }님, 환영합니다</span>
										<span class="dropdown-item">${loginUser.user_email }</span>
										<a class="dropdown-item" type="button" href="${pageContext.request.contextPath }/olookUser/myPage">마이페이지</a>
									</div>
								</div> -->
							</c:otherwise>
						</c:choose>
					<!-- 	아직 구현 안한 게시판 목록
						<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
				 말머리 완성 했을 때 클릭시 말머리 해당 게시판으로 이동
						<li class="nav-item dropdown"><a class="nav-link" id="navbardrop" 
							data-toggle="dropdown" href="#">자유게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="#">중고나라</a></li> -->	
					</ul>
				</div>
				<!-- 				
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">자유게시판</a>
					<a class="dropdown-item" href="#">Q&A</a>
				</div> -->
				
			</div>
		</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>