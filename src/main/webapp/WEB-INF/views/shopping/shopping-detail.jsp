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
				<h3 class="font-white text-center">OO마트 ##점</h3>
			</div>
			<div class="d-flex justify-content-center h-100 pb-3">
    			<div class="search"> 
    				<input type="text" class="search-input" placeholder="필요한 물품을 검색하세요." name=""> <a href="#" class="search-icon"> <i class="fa fa-search"></i> </a> 
    			</div>
			</div>
		</div>

		<!-- modal생성하는곳-->
		<!-- Login Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Spring Market</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<h3 class="text-center">로그인</h3>
		      	<p class="text-center">Log in</p>
		        <strong>아이디</strong>
		        <input type="text" class="form-control" placeholder="ID">
		        <strong>비밀번호</strong>
		        <input type="password" class="form-control" placeholder="password">
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary">로그인</button>
		      </div>
		    </div>
		  </div>
		</div>

		<!-- nav 끝-->

		<div class="container">
			<h3 class="pt-4">카테고리 > 과자</h3>

			<div class="row row-cols-1 row-cols-md-4 text-center pt-2">
				<div class="col mb-3">
					<div class="card h-100 border-secondary">
						<img src="resources/market/image/snack/새우깡.jpg" class="card-img-top poster" alt="..." height="200"><div class="card-body">
					      <h5 class="card-title">새우깡 90g</h5>
					      <a href="#"><p class="card-text">1500원<i class="fa fa-shopping-cart"></i></p></a>
				    	</div>	
					</div>	
				</div>
				<div class="col mb-3">
					<div class="card h-100 border-secondary">
						<img src="resources/market/image/snack/감자깡.jpg" class="card-img-top poster" alt="..." height="200"><div class="card-body">
					      <h5 class="card-title">감자깡 90g</h5>
					      <a href="#"><p class="card-text">1200원<i class="fa fa-shopping-cart"></i></p></a>
				    	</div>	
					</div>	
				</div>
				<div class="col mb-3">
					<div class="card h-100 border-secondary">
						<img src="resources/market/image/snack/고구마깡.jpg" class="card-img-top poster" alt="..." height="200"><div class="card-body">
					      <h5 class="card-title">고구마깡 90g</h5>
					      <a href="#"><p class="card-text">1400원<i class="fa fa-shopping-cart"></i></p></a>
				    	</div>	
					</div>	
				</div>
				<div class="col mb-3">
					<div class="card h-100 border-secondary">
						<img src="resources/market/image/snack/포카칩.jpg" class="card-img-top poster" alt="..." height="200"><div class="card-body">
					      <h5 class="card-title">포카칩 90g</h5>
					      <a href="#"><p class="card-text">1300원<i class="fa fa-shopping-cart"></i></p></a>
				    	</div>	
					</div>	
				</div>
				<div class="col mb-3">
					<div class="card h-100 border-secondary">
						<img src="resources/market/image/snack/포테토칩.jpg" class="card-img-top poster" alt="..." height="200"><div class="card-body">
					      <h5 class="card-title">포테토칩 90g</h5>
					      <a href="#"><p class="card-text">1400원<i class="fa fa-shopping-cart"></i></p></a>
				    	</div>	
					</div>	
				</div>
				<div class="col mb-3">
					<div class="card h-100 border-secondary">
						<img src="resources/market/image/snack/허니버터칩.jpg" class="card-img-top poster" alt="..." height="200"><div class="card-body">
					      <h5 class="card-title">허니버터칩 90g</h5>
					      <a href="#"><p class="card-text">1600원<i class="fa fa-shopping-cart"></i></p></a>
				    	</div>	
					</div>	
				</div>
			</div>
			
			
		</div>

			<!-- -->	
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>