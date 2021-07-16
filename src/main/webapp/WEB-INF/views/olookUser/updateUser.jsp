<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보수정</title>
<!-- 로그인View에 해당하는 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/updateUser.css">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css" />
<!-- Bootstarp icon -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<form action="updateUser" method="post" class="text-center">
<div class="form-updateUser">
		<h2>내정보수정</h2>
		<label for="user_email" class="src-only">E-mail</label>
		<input class="form-control" type="text" name="user_email" value="${loginUser.user_email }" readonly="readonly">
		<label for="user_nickname" class="src-only">Nickname</label>
		<input class="form-control" type="text" name="user_nickname" value="${loginUser.user_nickname }" readonly="readonly">	
		<label for="user_phone" class="src-only">Phone</label>
		<input class="form-control" type="text" name="user_phone">	
		<label for="user_intro" class="src-only">자기소개</label>
</div>
<div class="ps-box intro">
		<textarea rows="20" cols="80">${loginUser.user_intro }</textarea><br>
		<input type="submit" id="updateSubmit" class="btn btn-lg btn-primary" value="수정하기">
</div>
</form>
<jsp:include page="../include/footer.jsp"></jsp:include>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>