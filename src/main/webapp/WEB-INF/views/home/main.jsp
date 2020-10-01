<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	
		<meta charset="UTF-8">
		<meta name="description" content="이 문서는 메인이 되는 문서입니다.">
		
		<!-- header.jsp -->
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
		
		<!-- css / default -->
		<link href="${pageContext.request.contextPath}/resources/market/css/default.css" rel="stylesheet">
		
	</head>
	<body>

		
	
		<div class="container pt-3">
			<div class="jumbotron main-banner">
				<h1 class="text-center">Spring Market</h1>
				<p class="text-center">Spring Market을 찾아주셔서 감사합니다. 동네 마트 배달 및 주문 사이트입니다.</p>
				<form class="form-inline justify-content-md-center">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="검색어" aria-label="Search" aria-describedby="basic-addon1" width="50">
						<div class="input-group-prepend">
							<span class="input-group-text bg-main" style="border:none;"id="basic-addon1">
								<i class="fa fa-search font-white"></i>
							</span>
						</div>
					</div>
				</form>
				
				
				
			</div>
		</div>

		

	</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
