<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- update에 해당하는 CSS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/updateBoard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
//textarea에 들어간 공백 <br>로 바꿔서 출력
var content = request.getParameter("look_content");
content = look_content.replace("\r\n","<br>");

</script>
<style>
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
<form name="frm1" method="post" action="updateAction?look_idx=${bean.look_idx}">
	<div class="WritingHeader">
		<h2 class="title">Daily Look 글쓰기</h2>
		<div class="save_area">
			<input class="btn btn-primary save" type="submit" value="수정완료">
			<input class="btn btn-primary reset" type="reset" value="다시쓰기">
			<input class="btn btn-primary list" type="button" value="목록"
				onclick="location.href='list?page=${page}'">
		</div>
	</div>
	<div class="container">
		<div id="content">
			<div class="row row_title">
				<div class="col-sm-6">
					작성자 : ${bean.user_email}
				</div>
				<div class="col-sm-5">
					<i class="fa fa-eye" aria-hidden="true"></i>${bean.loview_cnt}
				</div>
			</div>
			<div class="row">
				<div class="col-sm-5">
					<img style = "width : 100%;" src="${pageContext.request.contextPath}/image/t-${bean.look_filename}">
				</div>
				<div class="col-sm-7 update_content">
					<div class="row_group">
						<div class="update_row">
							<h3 class="update_title">
								<label for="look_top">상의</label>
							</h3>
							<span class="ps_box">
								<input type ="text" value="${bean.look_top}" name="look_top">
							</span>
						</div>
						<div class="update_row">
							<h3 class="update_title">
								<label for="look_bottom">하의</label>
							</h3>
							<span class="ps_box">
								<input type ="text" value="${bean.look_bottom }" name="look_bottom">
							</span>
						</div>
						<div class="update_row">
							<h3 class="update_title">
								<label for="look_shoes">신발</label>
							</h3>
							<span class="ps_box">
								<input type ="text" value="${bean.look_shoes }" name="look_shoes">
							</span>
						</div>
						<div class="update_row">
							<h3 class="update_title">
								<label for="look_acc">Acc</label>
							</h3>
							<span class="ps_box">
								<input type ="text" value="${bean.look_acc }" name = "look_acc">
							</span>
						</div>
						<div class="update_row">
							<h3 class="update_title">
								<label for="look_height">키</label>
							</h3>
							<span class="ps_box">
								<input type ="text" value="${bean.look_height }" name = "look_height">
							</span>
						</div>
						<div class="update_row">
							<h3 class="update_title">
								<label for="look_weight">몸무게</label>
							</h3>
							<span class="ps_box">
								<input type ="text" value="${bean.look_weight }" name = "look_weight">
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col update_row update-intro">
				<h3 class="update_title intro-title">
					<label>자기소개</label>
					<textarea rows="20" cols="80" class="ps_box intro" name="look_content" placeholder="${bean.look_content }" name ="look_content">
					</textarea>
				</h3>
			</div>
		</div>
	</div>
</form>
 <%-- <pre>${bean.content }</pre></div></td> 5번주석--%>   <!-- 엔터,탭,기호 등 텍스트 그대로 출력할 때 사용 -->

<jsp:include page="../include/footer.jsp"></jsp:include>
 </body>
</html>