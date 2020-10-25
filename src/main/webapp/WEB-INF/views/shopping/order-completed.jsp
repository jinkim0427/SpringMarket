<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="이 문서는 주문완료가 되는 문서입니다.">
	
	<!-- header.jsp -->
	<%@ include file="../include/header.jsp" %>
	
	<!-- css / default -->
	<link href="${pageContext.request.contextPath}/resources/market/css/default.css" rel="stylesheet">
	
	<!-- css / searchForm -->
	<link href="${pageContext.request.contextPath}/resources/market/css/searchForm.css" rel="stylesheet">
	
	<!-- css / table -->
	<link href="${pageContext.request.contextPath}/resources/market/css/table.css" rel="stylesheet">
	
	<style type="text/css">
		.jumbotron{
			text-shadow: none;
			color: black;
		}
	</style>
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
		<div class="container pt-3">
			<h2 class="pt-4">주문 완료</h2>
			<div class="jumbotron text-center mb-0 pb-2">
				<h2>Spring Market을 이용해 주셔서 감사합니다.</h2>
				<p class="lead">주문 상세 내역과 배송 정보는 마이페이지를 통해 확인하실 수 있습니다.</p>
				
				<div class="rounded col-md-6 ml-auto mr-auto">
					    <div class="table-responsive table-borderless">
					        <table class="table text-left">
					            <tbody class="table-body">
					                <tr class="cell-1">           
					                    <td>결제 금액 : </td>
		    							<td>150000원</td>
		                            </tr>
		                            <tr class="cell-1">       
		                                <td>결제 방식 : </td>
		    							<td>현금</td>
		                            </tr> 
		                            <tr class="cell-1">
		                            	<td>마트 이름 : </td>
		    							<td>행복 마트</td>
		                            </tr>
		                            
		                        </tbody>
		                    </table>
		                </div>
				    </div>
				    <p><a class="btn btn-warning" href="#" role="button">확인</a></p>
			</div>
			
		    
		</div>
	
      
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>