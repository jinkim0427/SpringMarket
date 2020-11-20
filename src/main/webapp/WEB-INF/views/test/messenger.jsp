<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- header.jsp -->
	<%@ include file="../include/header.jsp" %>
	
	<!-- button.css -->
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/msg/css/button.css"/>
		
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#connectMsgBtn').click(function() {
				var form = $("form[name=msgForm]");
				form.attr("action", "<c:url value='/msg/websocketMessengerMain.do'/>");
				form.attr("method", "post");
				form.submit();
			});		
		});
	</script>
</head>
<body>
<form name="msgForm" id="msgForm" action="<c:url value='  '/>" method="post">
	<c:if test="${UserVO!= null}">
		${UserVO.name}님, 메신저에 접속합니다.
		<input type="button" id="connectMsgBtn" name="connectMsgBtn" value="연결버튼"/>
	</c:if>
	<c:if test="${UserVO==null}">
		로그인 후 이용해주시기 바랍니다.
	</c:if>
</form>
</body>
</html>