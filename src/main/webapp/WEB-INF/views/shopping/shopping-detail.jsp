<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="이 문서는 쇼핑 디테일 페이지가 되는 문서입니다.">
	
	<!-- header.jsp -->
	<%@ include file="../include/header.jsp" %>
	
	<!-- css / default -->
	<link href="${pageContext.request.contextPath}/resources/market/css/default.css" rel="stylesheet">
	
	<!-- css / searchForm -->
	<link href="${pageContext.request.contextPath}/resources/market/css/searchForm.css" rel="stylesheet">
	
	<!-- css / aniPoster -->
	<link href="${pageContext.request.contextPath}/resources/market/css/aniPoster.css" rel="stylesheet">
	
</head>
<body>
	<div class="bg-dark">

			
			<div>
				<h3 class="font-white text-center">${mk_info.mk_name}</h3>
			</div>
			<div class="d-flex justify-content-center h-100 pb-3">
    			<div class="search"> 
    				<input type="text" class="search-input" placeholder="필요한 물품을 검색하세요." name=""> <a href="#" class="search-icon"> <i class="fa fa-search"></i> </a> 
    			</div>
			</div>
		</div>

	<div class="container">
		<h3 class="pt-4">카테고리 > ${ko_category}</h3>

		<c:choose>
		
			<c:when test="${fn:length(productList) > 0 }">
			<div class="row row-cols-1 row-cols-md-4 text-center pt-2">
				<c:forEach items="${productList}" var="row">
						
					<div class="col mb-3">
						<div class="card h-100 border-secondary">
							<img src="${row.pd_img}" class="card-img-top poster" alt="..." height="200">
							<div class="card-body">
								<h5 class="card-title">${row.pd_name} ${row.pd_weight}g</h5>
								<a href="#"><p class="card-text">${row.pd_price}원<i class="fa fa-shopping-cart"></i></p></a>
								<p>남은 개수 : ${row.pd_amount}</p>
					    	</div>	
						</div>	
					</div>
						
				</c:forEach>
			</div><!-- class row -->
			</c:when>
			<c:otherwise>
				<h4>등록된 물품이 없습니다.</h4>
			</c:otherwise>
			
		</c:choose>

	</div><!-- container -->

</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>