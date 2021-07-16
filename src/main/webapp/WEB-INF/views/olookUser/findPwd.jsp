<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<!-- 비밀번호 찾기 CSS -->
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"> </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findPwd.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

//인증 타이머 변수
var timer = null;
var isRunning = false;

$(function(){
	sendEmailWithTimer();
	idCheck();
});

function sendEmailWithTimer() {
	$("#emailCodeSend").on('click',function(e){
		var user_email =$('#olookJoinEmail').val();
		$.ajax({
			url: "olookEmailCheck",
			type: 'POST',
			dataType: 'json',
			data: JSON.stringify({user_email : user_email}),
			contentType: 'application/json',
			mimeType: 'application/json',
			success: function(response) {
				if(response.flag==true){
					alert('이메일을 확인하세요');
				}
			}
		});
		
		var display = $('#codeTimer');
	  	var leftSec = 180; // 남은 시간
	  	
	    // 이미 타이머가 작동중이면 중지
	    if (isRunning){
	    	clearInterval(timer);
	    	display.html("");
	    	startTimer(leftSec, display);
	    }else{
	    	startTimer(leftSec, display);
	    }
	});
}
    
function startTimer(count, display) {
	var minutes, seconds;
    timer = setInterval(function () {
    	minutes = parseInt(count / 60, 10);
    	seconds = parseInt(count % 60, 10);
     
    	minutes = minutes < 10 ? "0" + minutes : minutes;
    	seconds = seconds < 10 ? "0" + seconds : seconds;
    	
    	display.html(minutes + ":" + seconds);
     
    	// 타이머 끝
    	if (--count < 0) {
    		clearInterval(timer);
    		alert("시간초과");
    		display.html("시간초과");
    		//$('.btn_chk').attr("disabled","disabled");
    		isRunning = false;
        }
    }, 1000);
    isRunning = true;
}

function olookAuthKeyCheck(){
	var cookies = document.cookie;
	var user_email =$('#olookJoinEmail').val();
	var authKey =$('#olookAuthKey').val();
		
	if(cookies.indexOf('authKey') == -1) {
		alert('인증 유효시간이 지났습니다');
	}else{
		var cookieName = 'authKey' + '=';
		var start = cookies.indexOf(cookieName);
		var cookie_authKey = '';
		if(start != -1){
			start += cookieName.length;
			var end = cookies.indexOf(';', start);
				if(end == -1) {
					end = cookies.length;
				}
			cookie_authKey = cookies.substring(start, end);
		}
		if(cookie_authKey == authKey) {
			alert('인증 성공');
			location.href = 'changePwd?userEmail='+user_email;
		}else {
			alert('인증 실패');
		}
	}
}

function idCheck() {
	$("#olookJoinEmail").keyup(function() {
		var user_email =$('#olookJoinEmail').val();
		$.ajax({
			url: "idCheck",
			type: 'POST',
			dataType: 'json',
			data: JSON.stringify({user_email : user_email}),
			contentType: 'application/json',
			mimeType: 'application/json',
			success: function(response) {
				if(response.flag==true){
					$("#emailCheckWord").text("가입되어있는 이메일이 아닙니다");
					$("#emailCheckWord").css("color", "red");
					$("#emailCodeSend").attr("disabled", true);
					$("#authKeyCheck").attr("disabled", true);
				}else {
					if(user_email == "") {
						$('#emailCheckWord').text('이메일를 입력해주세요');
						$('#emailCheckWord').css('color', 'red');
						$("#emailCodeSend").attr("disabled", true);
						$("#authKeyCheck").attr("disabled", true);
					}else if(user_email.indexOf('@') == -1){
						$('#emailCheckWord').text('이메일 형식이 아닙니다');
						$('#emailCheckWord').css('color', 'red');
						$("#emailCodeSend").attr("disabled", true);
						$("#authKeyCheck").attr("disabled", true);
					}else {
						$('#emailCheckWord').text('V');
						$('#emailCheckWord').css('color', 'green');
						$("#emailCodeSend").attr("disabled", false);
						$("#authKeyCheck").attr("disabled", false);
					}
				}
			}
		});
	});
}

</script>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="text-center">
   <form class="form-findpwd" method="post" style="width: 940px;">
      <div class="title"><h2>Find Password</h2></div>
      <label for="user_email" class="src-only"></label>
      <input class="form-control" style="display: inline-block; width: 200px;" type="email" name="olookJoinEmail" id="olookJoinEmail" maxlength="35" placeholder="이메일" required="required">
      <span id="emailCheckWord"></span>
      <input class="btn btn-lg btn-primary btn-block" type="button" value="인증메일 전송" id="emailCodeSend">
      <br><label for="olookAuthKey" class="src-only"></label>
      <input class="form-control" style="display: inline-block; width: 200px;" type="text" name="olookAuthKey" id="olookAuthKey" maxlength="30" placeholder="인증코드" required="required">
      <span id="codeTimer"></span>
      <input class="btn btn-lg btn-primary btn-block" type="button" value="인증코드 확인" id="authKeyCheck" onclick="olookAuthKeyCheck()">
   </form>
</div>

</body>
</html>