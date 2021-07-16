<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>5LOOK 회원가입/로그인</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css" />
<!-- Bootstarp icon -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 로그인View에 해당하는 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signin.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="text-center">
<form class="form-signin" action="olookUserLogin" method="post">
	<h1>Please Sign In</h1>
	<label for="user_email" class="src-only"></label>
	<input class="form-control" type="email" name="user_email" required="required" placeholder="아이디(이메일형식)" maxlength="35" required autofocus>		
	<label for="user_password" class="src-only"></label>
	<input class="form-control" type="password" name="user_password" required="required" placeholder="비밀번호" maxlength="30">
	<div class="checkbox mb-3">
		<label>
			<input type="checkbox" value="remember-me">Remember me
		</label>
	</div>
	<input class="btn btn-lg btn-primary btn-block" style="margin-top: 10%; width: 180px;" type="submit" value="로그인">
</form>
</div>
<div id="kakao_id_login" style="text-align: center;">
	<a href="${kakao_url}">
		<img src="${pageContext.request.contextPath}/resources/img/kakao_login_medium_narrow.png" />
	</a>
</div>
<div class="card-mb-4" style="margin-top: 5%;">
	<div class="card-body user-join">
		<a href="olookEmailCheck">회원가입</a><b>&nbsp;|&nbsp;</b>
		<a href="findID">아이디 찾기</a><b>&nbsp;|&nbsp;</b> 
		<a href="findPwd">비밀번호 찾기</a>
	</div>
</div>
</body>
</html>