<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8>
<title>동아리 커뮤니티</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 글쓰기에 해당하는 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/InsertBoard.css">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css" />
<script src="${pageContext.request.contextPath}/resources/index/js/scripts.js"></script>
<script src="https://ajax.googleapix.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
function post_data() {
	//var subject = frm1.subject.value;  //유효성 검사
	frm1.submit();
}

//textarea에 들어간 공백 <br>로 바꿔서 출력
var content = request.getParameter("look_content");
content = look_content.replace("\r\n","<br>");

</script>
<style type="text/css">
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
.image_container{
	height : auto; 
	width : auto;
}
</style>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<header class="py-5 bg-light border-bottom mb-4" id="background">
	<div class="container">
		<div class="text-center my-5">
 			<h1 class="fw-bolder">오룩만의 특별한 여름 맞이 룩북</h1>
			<a href="#" style="color: white;">→ 여름 룩북 보러가기 ←</a>
		</div>
	</div>
</header>
<div class="SpecialMenu">
	<ul class="menu_list">
		<li class="item"><a href="list?page=${page}" class="link_special">전체글보기</a></li>
		<li class="item"><a href="#"></a></li>
		<li class="item"><a href="#"></a></li>
	</ul>
</div>
<form name="frm1" method="post" action="insert" enctype="multipart/form-data">
<div class="WritingHeader">
	<h2 class="title"><b>Daily Look</b></h2>
	<div class="save_area">
		<input class="btn btn-primary save" type="submit" value="저장">
		<input class="btn btn-primary reset" type="reset" value="다시쓰기">
	</div>
</div>
<div class="container">
	<div id="content">
		<div class="row body">
	 		<div class="col-sm-8">
	 			<h3 class="insert_title">${loginUser.user_nickname }&nbsp;
               	 (&nbsp;${loginUser.user_email})
					<input type="hidden" value="${loginUser.user_nickname}"  name="user_nickname">
					<input type="hidden" value="${loginUser.user_email}"  name="user_email">
                </h3>
	 		</div>
	 		<div class="col-sm-4">
	 			<input type="file" id = "image" accept="image/*" onchange="setThumbnail(event);" name="uploadFile"/>
	 			<script> function setThumbnail(event) { 
	 				var reader = new FileReader();
	 				reader.onload = function(event) { 
	 					var img = document.createElement("img"); 
	 					img.setAttribute("src", event.target.result); 
	 					document.querySelector("div#image_container").appendChild(img); 
	 					}; 
	 					reader.readAsDataURL(event.target.files[0]); 
	 					} 
	 			</script>
	 		</div>
	 		<div id = "image_container" class ="image_container"></div>
 		</div>
		<div class="insert_content">
			<div class="row_group">
				<div class="insert_row">
					<h3 class="insert_title">
						<label for="look_top">상의</label>
					</h3>
					<span class="ps_box top">
						<input class="string" type="text" name="look_top">
					</span>
				</div>
				<div class="insert_row">
					<h3 class="insert_title">
						<label for="look_bottom">하의</label>
					</h3>
					<span class="ps_box bottom">
						<input class="string" type="text" name="look_bottom">
					</span>
				</div>
				<div class="insert_row">
					<h3 class="insert_title">
						<label for="look_shoes">신발</label>
					</h3>
					<span class="ps_box shoes">
						<input class="string" type="text" name="look_shoes">
					</span>
				</div>
				<div class="insert_row">
					<h3 class="insert_title">
						<label for="look_acc">Acc</label>
					</h3>
					<span class="ps_box acc">
						<input class="string" type="text" name="look_acc">
					</span>
				</div>
				<div class="insert_row">
					<h3 class="insert_title">
						<label for="look_height">키</label>
					</h3>
					<span class="ps_box height">
						<input class="string" type="text" name="look_height">
					</span>
				</div>
				<div class="insert_row">
					<h3 class="insert_title">
						<label for="look_weight">몸무게</label>
					</h3>
					<span class="ps_box weight">
						<input class="string" type="text" name="look_weight">
					</span>
				</div>
				<div class="insert_row">
					<h3 class="insert_title">
						<label>자기소개</label>
					</h3>
				 	<textarea  rows="20" cols="80" class="ps_box intro"
				 		name="look_content" placeholder="상세 정보 및 소개를 입력하세요"></textarea>
				</div>
			</div>
	 	</div>		
	</div>
</div>
</form>

<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>