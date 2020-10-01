<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="이 문서는 쇼핑 페이지가 되는 문서입니다.">
	
	<!-- header.jsp -->
	<%@ include file="../include/header.jsp" %>
	
	<!-- css / default -->
	<link href="${pageContext.request.contextPath}/resources/market/css/default.css" rel="stylesheet">
	
	<!-- css / searchForm -->
	<link href="${pageContext.request.contextPath}/resources/market/css/searchForm.css" rel="stylesheet">
	
	<!-- css / contentHover -->
	<link href="${pageContext.request.contextPath}/resources/market/css/contentHover.css" rel="stylesheet">
	
</head>
<body>
	<div class="bg-dark">	
		<div>
			<h3 class="font-white text-center">OO마트 ##점</h3>
		</div>
		<div class="d-flex justify-content-center h-100 pb-3">
   			<div class="search"> 
   				<input type="text" class="search-input" placeholder="필요한 물품을 검색하세요." name=""> <a href="#" class="search-icon"> <i class="fa fa-search"></i> </a> 
   			</div>
		</div>
	</div>

	<div class="container">

		<div class="card-deck text-center">
			  
			  <div class="card border-danger">
			  	<div class="content"> 
	             	<a href="shopping-detail.html">
	                     <div class="content-overlay"></div> 
	                     <img class="content-image card-img-top" src="resources/market/image/shopping/snack.jpg" height="200">
	                     <div class="content-details fadeIn-bottom">
	                         <h3 class="content-title">과자</h3>
	                         <p class="content-text"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Detail</p>
	                     </div>
	                 </a> 
	             
			    <h5>과자</h5>
			    </div>
			  </div>
			  
			  <div class="card border-warning">
			  	<div class="content"> 
	             	<a href="#">
	                     <div class="content-overlay"></div> 
	                     <img class="content-image card-img-top" src="resources/market/image/shopping/frozen_food.jpg" height="200">
	                     <div class="content-details fadeIn-bottom">
	                         <h3 class="content-title">냉동 식품</h3>
	                         <p class="content-text"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Detail</p>
	                     </div>
	                 </a> 
	             
			    <h5>냉동 식품</h5>
			    </div>
			  </div>
			  
			  <div class="card border-success">
			  	<div class="content"> 
	             	<a href="#">
	                     <div class="content-overlay"></div> 
	                     <img class="content-image card-img-top" src="resources/market/image/shopping/ramen.jpg" height="200">
	                     <div class="content-details fadeIn-bottom">
	                         <h3 class="content-title">라면</h3>
	                         <p class="content-text"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Detail</p>
	                     </div>
	                 </a> 
	             
			    <h5>라면</h5>
			    </div>
			  </div>

			  <div class="card border-info">
			  	<div class="content"> 
	             	<a href="#">
	                     <div class="content-overlay"></div> 
	                     <img class="content-image card-img-top" src="resources/market/image/shopping/lunch_box.jpg" height="200">
	                     <div class="content-details fadeIn-bottom">
	                         <h3 class="content-title">도시락</h3>
	                         <p class="content-text"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Detail</p>
	                     </div>
	                 </a> 
	             
			    <h5>도시락</h5>
			    </div>
			  </div>


	  
	  
		</div>

		<!-- 선-->
		<div class="card-deck text-center pt-4">
			  
			  <div class="card border-danger">
			  	<div class="content"> 
	             	<a href="#">
	                     <div class="content-overlay"></div> 
	                     <img class="content-image card-img-top" src="resources/market/image/shopping/vegetable.jpg" height="200">
	                     <div class="content-details fadeIn-bottom">
	                         <h3 class="content-title">채소</h3>
	                         <p class="content-text"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Detail</p>
	                     </div>
	                 </a> 
	             
			    <h5>채소</h5>
			    </div>
			  </div>
			  
			  <div class="card border-warning">
			  	<div class="content"> 
	             	<a href="#">
	                     <div class="content-overlay"></div> 
	                     <img class="content-image card-img-top" src="resources/market/image/shopping/fruit.jpg" height="200">
	                     <div class="content-details fadeIn-bottom">
	                         <h3 class="content-title">과일</h3>
	                         <p class="content-text"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Detail</p>
	                     </div>
	                 </a> 
	             
			    <h5>과일</h5>
			    </div>
			  </div>
			  
			  <div class="card border-success">
			  	<div class="content"> 
	             	<a href="#">
	                     <div class="content-overlay"></div> 
	                     <img class="content-image card-img-top" src="resources/market/image/shopping/fisheries.jpg" height="200">
	                     <div class="content-details fadeIn-bottom">
	                         <h3 class="content-title">수산</h3>
	                         <p class="content-text"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Detail</p>
	                     </div>
	                 </a> 
	             
			    <h5>수산</h5>
			    </div>
			  </div>

			  <div class="card border-info">
			  	<div class="content"> 
	             	<a href="#">
	                     <div class="content-overlay"></div> 
	                     <img class="content-image card-img-top" src="resources/market/image/shopping/livestock.jpg" height="200">
	                     <div class="content-details fadeIn-bottom">
	                         <h3 class="content-title">축산</h3>
	                         <p class="content-text"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Detail</p>
	                     </div>
	                 </a> 
	             
			    <h5>축산</h5>
			    </div>
			  </div>


	  
	  
		</div>

		<!-- -->

		<!-- 3번째 줄-->
		<div class="card-deck text-center pt-4">
			  
			  <div class="card border-danger">
			  	<div class="content"> 
	             	<a href="#">
	                     <div class="content-overlay"></div> 
	                     <img class="content-image card-img-top" src="resources/market/image/shopping/canned_food.jpg" height="200">
	                     <div class="content-details fadeIn-bottom">
	                         <h3 class="content-title">통조림</h3>
	                         <p class="content-text"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Detail</p>
	                     </div>
	                 </a> 
	             
			    <h5>통조림</h5>
			    </div>
			  </div>
			  
			  <div class="card border-warning">
			  	<div class="content"> 
	             	<a href="#">
	                     <div class="content-overlay"></div> 
	                     <img class="content-image card-img-top" src="resources/market/image/shopping/bread.jpg" height="200">
	                     <div class="content-details fadeIn-bottom">
	                         <h3 class="content-title">빵</h3>
	                         <p class="content-text"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Detail</p>
	                     </div>
	                 </a> 
	             
			    <h5>빵</h5>
			    </div>
			  </div>
			  
			  <div class="card border-success">
			  	<div class="content"> 
	             	<a href="#">
	                     <div class="content-overlay"></div> 
	                     <img class="content-image card-img-top" src="resources/market/image/shopping/household_goods.jpg" height="200">
	                     <div class="content-details fadeIn-bottom">
	                         <h3 class="content-title">생활 용퓸</h3>
	                         <p class="content-text"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Detail</p>
	                     </div>
	                 </a> 
	             
			    <h5>생활 용품</h5>
			    </div>
			  </div>

			  <div class="card border-info">
			  	<div class="content"> 
	             	<a href="#">
	                     <div class="content-overlay"></div> 
	                     <img class="content-image card-img-top" src="resources/market/image/shopping/beverage.jpg" height="200">
	                     <div class="content-details fadeIn-bottom">
	                         <h3 class="content-title">음료</h3>
	                         <p class="content-text"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Detail</p>
	                     </div>
	                 </a> 
	             
			    <h5>음료</h5>
			    </div>
			  </div>


	  		</div><!-- 3번째 줄 -->
	  
		</div>
		<!-- -->
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>