<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>비밀번호 변경</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<!-- 로그인View에 해당하는 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/changepwd.css">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css" />
<!-- Bootstarp icon -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	pwdCheck();
});

function pwdCheck() {
	$('.form-control').keyup(function(){
		var user_password =$('#user_password').val();
		var user_password_check =$('#user_password_check').val();
		
		if(user_password == "") {
			$('#pwdCheckWord').text('비밀번호를 입력해주세요');
			$('#pwdCheckWord').css('color', 'red');
			$("#joinSubmit").attr("disabled", true);
		}else {
			$('#pwdCheckWord').text('V');
			$('#pwdCheckWord').css('color', 'green');
			if(user_password == user_password_check) {
				$('#pwdCheckWord').text('V');
				$('#pwdCheckWord').css('color', 'green');
				$('#rePwdCheckWord').text('V');
				$('#rePwdCheckWord').css('color', 'green');
				$("#joinSubmit").attr("disabled", false);
			}else {
				$('#rePwdCheckWord').text('비밀번호가 다릅니다');
				$('#rePwdCheckWord').css('color', 'red');
				$("#joinSubmit").attr("disabled", true);
			}
		}
	});
}
</script>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="text-center">
	<form class="form-changepwd" method="post" action="changePwd" style="width: 740px;">
      <h2 style="margin-bottom: 5%;">Change Password</h2>
      <input type="hidden" name="user_email" class="form-control" value="${userEmail }">
      <label for="user_password" class="src-only"></label>
      <input class="form-control" type="password" style=" display: inline-block; width: 300px; margin-left: 40px; " 
         id="user_password" name="user_password" maxlength="20" placeholder="8~16자 영문,숫자,특수문자" required="required">
      <span id="pwdCheckWord" style="margin-left: 2%;"></span>
      <label for="user_password" class="src-only"></label>
      <input class="form-control" type="password" style="display: inline-block; width: 300px; margin-left: 40px;" id="user_password_check" maxlength="30" placeholder="비밀번호 확인">
      <span id="rePwdCheckWord" style="margin-left: 2%;"></span><br>
      <input type="submit" id="joinSubmit" class="btn btn-lg btn-primary btn-block" maxlength="30" value="비밀번호 변경하기">
   </form>   
</div>

</body>
</html>