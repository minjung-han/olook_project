<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<!-- findId CSS -->
<script src="https://ajax.googleapix.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findId.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.text-center{
	margin-top: 5%;
}
.form-findId {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-findId .form-control {
  position: relative;
  box-sizing: border-box;
  height: auto;
  padding: 10px;
  font-size: 16px;
}
.form-findId .form-control:focus {
  z-index: 2;
}
.form-findId input {
  margin-bottom: 10px;
  border-radius: 0;
}
input[type="submit"]{
	margin-top: 20px;
}
</style>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="text-center">
	<form class="form-findId" action="findID" method="post">
		<h2>Find Id</h2>
		<label for="user_name" class="src-only"></label>
		<input class="form-control" type="text" name="user_name" required="required" placeholder="이름" maxlength="15">
		<label for="user_phone" class="src-only"></label>
		<input class="form-control" type="text" name="user_phone" required="required" placeholder="핸드폰번호(-제외하고 입력)" maxlength="20">
		<input class="btn btn-lg btn-primary btn-block" type="submit" value="아이디찾기">
	</form>
</div>

</body>
</html>