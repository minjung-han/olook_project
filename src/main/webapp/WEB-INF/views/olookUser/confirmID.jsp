<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signin.css">
<style type="text/css">
.confirm{
	margin-bottom: 25%;	
}
.used-email{
	margin-bottom: 5%;
}
</style>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>

<div class="text-center confirm">
	<div class="form-signin">
		<label class="used-email" for="user_email" style="font-size: 20px;">가입되어 있는 이메일</label>
		<div class="form-control">${findUser.user_email }</div>
	</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>