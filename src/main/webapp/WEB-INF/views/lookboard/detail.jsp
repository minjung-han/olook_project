<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세보기</title>
<!-- 글상세보기에 해당하는 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardDetail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/index/js/scripts.js"></script>
<script src="https://ajax.googleapix.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<!-- textarea에 들어간 공백 <br>로 바꿔서 출력 -->
<%
   pageContext.setAttribute("br","<br/>");
   pageContext.setAttribute("cn","\n");
%>
<script type="text/javascript">
	function resetOk() {
		//document.frmCmt.func.value = 1;   //댓글 추가
/* 		document.frm.cmd.value = '저장';
		document.frm.name.value = '';
		document.frm.content.value='';
		document.frm.password.value='';
		document.frm.content.disabled=false;
 */		//document.frmCmt.name.disabled=false;      
 //댓글 수정하고 다시 올때: <body onload="resetOk()">, 댓글 수정 취소할때 reset 버튼 onclick
	}
	
	function updateCmt(cmtidx,name,content) {  //실제 댓글 수정은 content 컬럼만 , 화면에 값표시 함수
		console.log("cmtidx : " + cmtidx);
		console.log("name : " + name);
		console.log("content : " + content);
		var obj = document.frmCmt;
		obj.look_cmtidx.value=cmtidx;
		obj.look_name.value = name;  	
		//textarea 로 값 표시하기전에 <br>을 개행문자로 바꾸기 
		while(content.indexOf('<br>')!=-1){  //문자열 <br> 가 없을떄 까지 반복
			content = content.replace('<br>','\n');
		}
		obj.look_content.value=content;
		
		document.frmCmt.name.disabled=true;    //disabled 를 설정
	}
	
	function deleteCmt(cmtidx,idx){
		var yn=confirm('댓글을 삭제하시겠습니까?');
		if(yn){
			alert('댓글을 삭제합니다.');  /* cmtidx:댓글 idx , page:현재페이지번호 , mref:메인글 idx */
			location.href='commentdeleteAction?cmtidx='+cmtidx+'&idx='+idx;
		}  //현재 detail.jsp -> commentAction.jsp  -> 처리 -> detailAction.jsp (꼭필요한 파라미터는 메인글 idx, 페이지번호 page)
		   //그러므로 댓글 수정 삭제시에 메인글 idx 와 page를 파라미터로 전달해야한다.
	}
	
	//댓글 수정,삭제 - 데이터 전달
	function delSet(idx) {
		frm2.cmtidx.value=idx;	
		modal.style.display = "block";   //modal 화면에 보이기
	}
	
	//메인글 삭제 확인
	function deleteOk(idx){
		var yn= confirm( '글을 삭제하시겠습니까?');
		
		if(yn){
			alert('글을 삭제합니다.');
			location.href='deleteAction?idx='+idx; //수정필요
		}
	}
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

</style>
</head>
<body onload="resetOk()">  <!-- 문서가 생성될때 실행 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<header class="py-5 bg-light border-bottom mb-4" id="background">
	<div class="container">
		<div class="text-center my-5">
			<br><h1 class="fw-bolder">오룩만의 특별한 여름 맞이 룩북</h1>
			<a class="fw-bolder" href="#" style="color: white;">→ 여름 룩북 보러가기 ←</a>
		</div>
	</div>
</header>
<div class="container body">	
	<div class="col detail-body">
		<div class="card mb-4 body-title">
			<div class="row row-top">
				<div class="col-sm-10">
					<input type="text" name="user_nickname" value="${vo.user_nickname }"
						style="border: none; font-weight: 700; margin-left: 5%;">
					<input type="hidden" value="${vo.user_nickname }" name="user_nickname">
				</div>
				<div class="col-sm-2"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;${bean.loview_cnt }</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<a href=""><img class="card-img-top" style="margin-bottom: 7%;" src="${pageContext.request.contextPath}/image/${bean.look_filename}"></a><br>		
				</div>
				<div class="col-sm-6 col-right">
					<table class="table detail-table">
						<tr>
							<td class="tb-tit"><i class="fas fa-tshirt" aria-hidden="true"></i>상의</td>
							<td class="tb-cont">${bean.look_top }</td>
						</tr>
						<tr>
							<td class="tb-tit">하의</td>
							<td class="tb-cont">${bean.look_bottom }</td>
						</tr>
						<tr>
							<td class="tb-tit">신발</td>
							<td class="tb-cont">${bean.look_shoes }</td>
						</tr>
						<tr>
							<td class="tb-tit">Acc</td>
							<td class="tb-cont">${bean.look_acc }</td>
						</tr>
						<tr>
							<td class="tb-tit">키</td>
							<td class="tb-cont">${bean.look_height }cm</td>
						</tr>
						<tr>
							<td class="tb-tit">몸무게</td>
							<td class="tb-cont">${bean.look_weight }kg</td>
						</tr>
					</table>
					<div class="text_area">
						${fn:replace(bean.look_content, cn, br) }
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col btn-box">
	      <c:choose>
      <c:when test="${loginUser.user_email eq bean.user_email }">
         <a class="btn btn-primary" href="update?idx=${bean.look_idx }">수정</a>
         <input class="btn btn-primary" type="button" onclick="javascript:deleteOk(${bean.look_idx });" value="삭제">
         <a class="btn btn-primary" href="list?page=1">목록</a>
      </c:when>
      <c:when test="${loginUser.user_email eq 'admin@naver.com'}">
         <input class="btn btn-primary" type="button" onclick="javascript:deleteOk(${bean.look_idx });" value="삭제">
         <a class="btn btn-primary" href="list?page=1">목록</a>
      </c:when>
      <c:otherwise>
         <a class="btn btn-primary" href="list?page=1">목록</a>
      </c:otherwise>      
  	 </c:choose>
	</div>
</div>
 <!-- 메인글 출력 끝 -->

 <!-- 댓글 시작 --> 
<form action="commentAction?idx=${bean.look_idx}" method="post" name="frmCmt">
<div class="container">
	<div class="row">
		<div class="col"></div>
			<table>
			</table>
	</div>
</div> 
<!-- 댓글은 전부주석 -->
<input type="hidden" name="look_ref" value="${bean.look_idx}">  <!-- 메인글의 idx -->
<input type="hidden" name="look_cmtidx" value = "0">
 
 <table style="width:60%;margin: auto;">
 	<tr><td colspan="4"><%-- 댓글 갯수 : ${bean.commentCount }     
 		<input type="button" onclick="window.location.reload()" value="새로고침" class="btn-small">--%>
 	</td>
 	</tr>
 	<tr><td colspan="4"><hr></td></tr>
 	<!-- 댓글 입력 -->
 	<tr>
 		<td width="25%" >작성자</td><td width="25%">
 		<input type="text" name="look_name" class="input1" value = "${loginUser.user_nickname }" readonly="readonly"></td>
 	</tr>
 	<tr>
 		<td colspan="3">  <!-- 크기조절불가 : style="resize: none;" -->
 			<textarea rows="5" cols="80" name="look_content"  style="resize: none;" placeholder="댓글을 작성하세요." class="input1"></textarea>
 		</td>
 		<td width="15%" style="text-align: left;">
 			<input type="submit" value="저장" class="btn btn-primary">
 			<input type="reset" value="취소" class="btn btn-primary" onclick="resetOk()">
 		</td>
 	</tr>
 	<tr><td colspan="4"><hr></td></tr>
 	<!-- 댓글 출력  -->
 	<c:forEach var="cmt" items="${cmtlist}">
 	<%-- <input type="hidden" name="look_cmtidx" value = "${cmt.look_cmtidx}"> --%>
 		<c:set var="cr" value="${cr}"/>   <!-- 개행문자 저장한 애트리뷰트 가져오기 -->
 		<c:set var="content" value="${fn:replace(cmt.look_content,cr,'<br>')}" />   <!--개행문자를 <br>로 바꾸기  -->
 		<tr>
 			<td colspan="4" style="text-align: left;">
 	<div id="comment">
 			<div>
			 <span class="name">${cmt.look_name}         </span><span>${cmt.look_date}</span>				
 			 <span class="now">
 			 </span>
		<span style="float: right;">  <!-- span은 부모영역의 오른쪽으로 정렬  -->
		<c:set value="${pageContext.request.contextPath}/resources/image" var="image" />
   			<!--삭제부분  -->
			<c:choose>
		      <c:when test="${loginUser.user_nickname eq cmt.look_name }">
		         <a href="javascript:deleteCmt('${cmt.look_cmtidx}','${bean.look_idx}')" style="cursor: pointer;text-decoration: none;">
               삭제<%-- <img src="${image}/delete.png" alt="삭제" style="width:20px;"> --%>
            </a>
              <!-- 수정부분 -->
            <a href="javascript:updateCmt('${cmt.look_cmtidx}','${cmt.look_name}','${cmt.look_content}')" style="cursor: pointer;text-decoration: none;">
               수정<%-- <img src="${image}/pencil.jpg" alt="수정" style="width:20px;"> --%>
            </a>
		      </c:when>
		      <c:when test="${loginUser.user_email eq 'admin@naver.com'}">
		         <a href="javascript:deleteCmt('${cmt.look_cmtidx}','${bean.look_idx}')" style="cursor: pointer;text-decoration: none;">
               삭제<%-- <img src="${image}/delete.png" alt="삭제" style="width:20px;"> --%>
            	</a>
		      </c:when>
		  	 </c:choose>
 			 </span>
 			 </div>
 			 <div style="padding-top: 10px;">  <!-- 댓글 내용 -->
 			 	<pre>${cmt.look_content}<br></pre> 
 			 	
 			 </div>
 			</div>
 			</td>
 		</tr>
 	</c:forEach> 
 </table>
 </form>
</body>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>
