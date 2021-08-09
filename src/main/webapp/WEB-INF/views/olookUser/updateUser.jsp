<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보수정</title>
<!-- 로그인View에 해당하는 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/updateUser.css">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css" />
<!-- Bootstrap icon -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	showProfile();
});

function showProfile(){
	$("#profile").change(function(){
		if(this.files && this.files[0]){
			var reader = new FileReader;
			reader.onload = function(data){
					$(".select_img img").attr("src",data.target.result)
				}
			reader.readAsDataURL(this.files[0]);
			}
		});
	}

</script>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="form-updateUser">
	<form action="updateUser" method="post" enctype="multipart/form-data" class="text-center">
	<h2>내정보수정</h2>
		<label for="profile" class="btn btn-primary">프로필 사진 바꾸기</label>
		<input type="file" id="profile" name="uploadFile" onchange="showProfile()" accept="image/*" style="display: none;">
		<div class="select_img" style="margin: 20px 0;">
			<img  width="200px" height="200px" style="border-radius: 50%;" src="${pageContext.request.contextPath}/image/${loginUser.user_filename }">
		</div>
		<div class="form-group">
			<label for="user_name" class="src-only">Name</label>
			<input class="form-control" type="text" name="user_name" value="${loginUser.user_name }" readonly>	
	</div>
		<div class="form-group">
			<label for="user_email" class="src-only">E-mail</label>
			<input class="form-control" type="text" name="user_email" value="${loginUser.user_email }" readonly>
		</div>
		<div class="form-group">
			<label for="user_nickname" class="src-only">Nickname</label>
			<input class="form-control" type="text" name="user_nickname" value="${loginUser.user_nickname }" readonly>	
		</div>
		<div class="form-group">
			<label for="user_phone" class="src-only">Phone</label>
			<input class="form-control" type="text" name="user_phone" value="${loginUser.user_phone }">	
		</div>
		<div class="form-group">
			<label for="user_intro" class="src-only">자기소개</label>
			<textarea rows="10" cols="30" name="user_intro">${loginUser.user_intro }</textarea><br>
		</div>
		<div class="update-btn" style="margin-top: 5%;">
			<input type="submit" id="updateSubmit" class="btn btn-lg btn-primary" value="수정하기">
			<input type="button" id="backtoMypage" class="btn btn-lg btn-primary" onclick="location.href='myPage'" value="돌아가기">
		</div>
	</form>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>