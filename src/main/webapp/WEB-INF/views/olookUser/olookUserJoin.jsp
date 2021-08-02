<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5LOOK 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">


$(function(){
	nameCheck();
	nickNameCheck();
	phoneCheck();
	pwdCheck();
	idCheck();
});



function nameCheck() {
	$('#user_name').blur(function(){
		var user_name =$('#user_name').val();
		
		if(user_name == "") {
			$('#nameCheckWord').text('이름를 입력해주세요');
			$('#nameCheckWord').css('color', 'red');
			$("#joinSubmit").attr("disabled", true);
		}else {
			$('#nameCheckWord').text('V');
			$('#nameCheckWord').css('color', 'green');
			$("#joinSubmit").attr("disabled", false);
		}
	});
}

function nickNameCheck() {
	$('#user_nickname').blur(function(){
		var user_nickname =$('#user_nickname').val();
		
		$.ajax({
			url: "nickNameCheck",
			type: 'POST',
			dataType: 'json',
			data: JSON.stringify({user_nickname : user_nickname}),
			contentType: 'application/json',
			mimeType: 'application/json',
			success: function(response) {
				if(response.flag==true){
					if(user_nickname == "") {
						$('#nickNameCheckWord').text('닉네임를 입력해주세요');
						$('#nickNameCheckWord').css('color', 'red');
						$("#joinSubmit").attr("disabled", true);
					}else {
						$('#nickNameCheckWord').text('V');
						$('#nickNameCheckWord').css('color', 'green');
						$("#joinSubmit").attr("disabled", false);
					}
				}else {
					$("#nickNameCheckWord").text("사용중인 닉네임입니다");
					$("#nickNameCheckWord").css("color", "red");
					$("#joinSubmit").attr("disabled", true);
				}
			}
		});
	});
}

function phoneCheck() {
	$('#user_phone').blur(function(){
		var user_phone =$('#user_phone').val();
		
		if(user_phone == "") {
			$('#phoneCheckWord').text('핸드폰 번호를 입력해주세요');
			$('#phoneCheckWord').css('color', 'red');
			$("#joinSubmit").attr("disabled", true);
		}else {
			$('#phoneCheckWord').text('V');
			$('#phoneCheckWord').css('color', 'green');
			$("#joinSubmit").attr("disabled", false);
		}
	});
}

function pwdCheck() {
	$('.int').keyup(function(){
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

function idCheck() {
	$("#user_email").blur(function() {
		var user_email =$('#user_email').val();
		$.ajax({
			url: "idCheck",
			type: 'POST',
			dataType: 'json',
			data: JSON.stringify({user_email : user_email}),
			contentType: 'application/json',
			mimeType: 'application/json',
			success: function(response) {
				if(response.flag==false){
					$("#emailCheckWord").text("사용중인 아이디입니다");
					$("#emailCheckWord").css("color", "red");
					$("#joinSubmit").attr("disabled", true);
				}
			}
		});
	});
}

</script>
<style type="text/css">
.navbar-brand img{
	width: 100px;
	height: auto;
}
#background{
	background-image: url('${pageContext.request.contextPath}/resources/img/summer3.png');
	background-repeat: no-repeat;
	left: 50%;
	top: 50%;
	background-position: 50% 40%;
	color: white;
	height: 300px;
	width: 100%;
}
#content{
	width: 750px;
	margin: 0 auto;
	padding: 3%;
}
label{
	cursor: pointer;
}
.join-body{
	display: flex;
	justify-content: center;
}
.row_group{
	overflow: hidden;
	width: 100%;
	margin-top: 20px;
}
.row_group.join_row{
	margin-bottom: 24px;	
}
.join_title{
	margin: 19px 0 19px 8px;
	font-size: 17px;
	font-weight: 700;
}
.ps_box{
	position: relative;
	width: 40%;
	height: 51px;
	border: 1px solid #dadada;
	padding: 10px 110px 10px 14px;
	background: #fff;
	vertical-align: top;
}
.int{
	position: relative;
	width: 40%;
	height: 29px;
	padding-right: 25px;
	border: none;
	background: #fff;
	box-sizing: border-box;
	z-index: 10;
}
.id_box input{
	width: 250px;
}

.pwd{
	margin-top: 34px;
}
.ps_box.pwd_box, .ps_box.pwd_check{
	padding-right: 40px;
	width: 100%;
}
.name_box{
	width: 100%;
	padding-right: 14px;
	box-sizing: border-box;	
}
.nickname{
	padding-right: 14px;
	box-sizing: border-box; 
	margin-bottom: 14px;
}
.join_mobile{
	width: 100%;
	position: relative;
	margin-top: 10px;
	padding: 0 125px 0 0;
}
.join_mobile.mobile{
	padding: 10px 15px 10px 14px;
	vertical-align: top;
}
.ps_box.profile{
	width: 20%;
}
.ps_box.intro{
	width: 100%;
	height: 390px;
}
.join-btn{
	display: flex;
	justify-content: center;
	padding: 2%;
}
</style>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<header class="py-5 bg-light border-bottom mb-4" id="background">
	<div class="container">
		<div class="text-center my-5">
			<br><h1 class="fw-bolder">오룩만의 특별한 여름 맞이 룩북</h1>
			<a class="fw-bolder" href="#" style="color: white;">→ 여름 룩북 보러가기 ←</a>
		</div>
	</div>
</header>
<form method="post" action="olookUserJoin" enctype="multipart/form-data">
	<div class="container">
		<div id="content">
			<div class="join_content">
				<div class="row_group">
					<div class="join_row">
					 	<h3 class="join_title">
					 		<label for="user_email">아이디</label>
					 	</h3>
					 	<span class="ps_box.id_box">
					 		<c:choose>
					 			<c:when test="${kEmail != null}">
									<input type="email" name="user_email" class="int" id="user_email" value="${kEmail }"
										required="required" readonly="readonly">
									<span id="emailCheckWord"></span>
								</c:when>
								<c:otherwise>
									<input type="email" name="user_email" class="int" id="user_email" value="${userEmail }"
										required="required" readonly="readonly">
								</c:otherwise>
							</c:choose>
					 	</span>
					</div>
				</div>
				<div class="join_row">
					<h3 class="join_title pwd">
						<label for="user_password">비밀번호</label>
					</h3>
					<span class="ps_box pwd_box">
						<input type="password" id="user_password" class="int" name="user_password" maxlength="20"
							placeholder="8~16자 영문,숫자,특수문자" required="required">
						<span id="pwdCheckWord"></span>
					</span>
					<h3 class="join_title">
						<label for="user_password_check">비밀번호 재확인</label>
					</h3>
					<span class="ps_box pwd_check">
						<input type="password" id="user_password_check" class="int" maxlength="20" placeholder="비밀번호 확인">
						<span id="rePwdCheckWord"></span>
					</span>
				</div>
				<div class="row_group">
					<div class="join_row">
						<h3 class="join_title">
							<label for="user_name">이름</label>
						</h3>
						<span class="ps_box name_box">
							<input type="text" name="user_name" class="int" id="user_name" maxlength="15" placeholder="이름"
								required="required">
							<span id="nameCheckWord"></span>
						</span>
					</div>
					<div class="join_row nickname">
						<h3 class="join_title">
							<label for="user_nickname">닉네임</label>
						</h3>
						<span class="ps_box nickname">
							<input type="text" name="user_nickname" class="int" id="user_nickname" maxlength="20" placeholder="닉네임"
								required="required" value=${kNickName }>
							<span id="nickNameCheckWord"></span>
						</span>
					</div>
				</div>
				<div class="join_row join_mobile">
					<h3 class="join_title">
						<label for="user_phone">휴대전화</label>
					</h3>
					<span class="ps_box mobile">
						<input type="text" name="user_phone" style="width: 180px;" class="int" id="user_phone" maxlength="20" placeholder="-제외 번호 입력"
                     required="required">
						<span id="phoneCheckWord"></span>
					</span>
				</div>
				<div class="join_row join_profile">
					<h3 class="join_title">
						<label for="uploadFile">프로필 이미지</label>
					</h3>
					<span class="ps_box profile">
						<input type="file" name="uploadFile" id="uploadFile" placeholder="프로필 이미지">
					</span>
				</div>
				<div class="join_row intro">
					<h3 class="join_title">
						<label for="intro">자기소개</label>
					</h3>
						<textarea class="ps_box intro" rows="15" cols="80" name="intro" id="intro" maxlength="500"></textarea>
				</div>
			</div>
		</div>
		<div class="join-btn">
			<input class="btn btn-primary" type="submit" id="joinSubmit" value="가입하기">
		</div>
	</div>
</form>

<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>