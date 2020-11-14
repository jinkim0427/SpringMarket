<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="이 문서는 회원가입이 되는 문서입니다.">
	
	<!-- header.jsp -->
	<%@ include file="../include/header.jsp" %>
	
	<!-- css / default -->
	<link href="${pageContext.request.contextPath}/resources/market/css/default.css" rel="stylesheet">
	
<title>Insert title here</title>
</head>
<body>
	<div class="container pt-4">
	
		<div class="row text-center">
		  <div class="col-sm-6 mb-10">
		    <div class="card border-warning">
	
		      <div class="card-body">
		        <h2 class="card-title">개인 회원</h2>
		        <p>Individual member</p>
		       	<p> Spring Market을 통해 다양한 해택을 만나보세요.</p>    
		        <a href="#" class="btn btn-warning" id="signUpIndividual">가입하기</a>
		      </div>
		    </div>
		  </div>
		  <div class="col-sm-6">
		    <div class="card border-success">
		      <div class="card-body">
		        <h2 class="card-title">판매 회원</h2>
		        <p>Sales member</p>
		        <p> Spring Market에서 온라인 상품등록을 도와드리겠습니다.</p>
		        <a href="#" class="btn btn-success" id="signUpSales">가입하기</a>
		      </div>
		    </div>
		  </div>
		</div>
	
	</div><!-- container-->
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#signUpIndividual").unbind("click").click(function(e){
				e.preventDefault();
				fn_moveToSignUpTermIndividual();
			});
			$("#signUpSales").unbind("click").click(function(e){
				e.preventDefault();
				fn_moveToSignTermUpSales();
			});
			
		});
		function fn_moveToSignUpTermIndividual() {
			window.location.href = "<c:url value='/signUpTermIndividual.do'/>";
		}
		function fn_moveToSignTermUpSales() {
			window.location.href = "<c:url value='/signUpTermSales.do'/>";
		}
	</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>