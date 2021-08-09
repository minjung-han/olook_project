<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
if('${message2}' != "no"){
	alert('${message2}');
	console.log("${pageContext.request.contextPath}");
	location.href='${pageContext.request.contextPath}/olookUser/olookUserPage';
}else{
	alert('${message}');
	if ('${flag}' == 'false') {
		history.back();
	}else {
		location.href='${pageContext.request.contextPath}'
	} 
}
</script>