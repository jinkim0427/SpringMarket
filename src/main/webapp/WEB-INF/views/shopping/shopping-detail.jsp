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
								<h5 class="card-title">${row.pd_name}</h5>
								<a href="#" onclick="createModalForm(${row.pd_number});" data-toggle="modal" data-target="#detailModal"><p class="card-text">${row.pd_price}원<i class="fa fa-shopping-cart"></i></p></a>
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
		<!-- modal생성하는곳-->
			<!-- Modal -->
			<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="detailModalLabel">Spring Market</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <h3 class="text-center">물품 장바구니 담기</h3>
			        <p class="text-center">Add to Cart</p>
			        
			        <table class="table table-modal text-lfet">
		                        
		                        <tbody class="table-modal-body">
		                           
		                           <tr>
		                     			<td>물품명 : </td>
		                     			<td>새우깡 90g</td>
		                           </tr>
		                           <tr>
		                     			<td>가격 : </td>
		                     			<td>1300원</td>
		                           </tr>
		                           <tr>
		                     			<td>남은 개수 : </td>
		                     			<td>5개</td>
		                           </tr>
		                           <tr>
		                     			<td>구매 개수 :</td>
		                     			<td><input id="amount" type="number" min="0" max="100" value="1"></td>
		                           </tr>
		                           
		                        </tbody>
		                    </table>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="button" onclick="addCart()" data-dismiss="modal" class="btn btn-primary addCart">장바구니 담기</button>
			      </div>
			    </div>
			  </div>
			</div>
	</div><!-- container -->
<script type="text/javascript">
	function createModalForm(pd_number){
		//alert(pd_number);
		//제품 이름이랑 가격 남은개수
		//number 태그로 몇개 살껀지 
		$.ajax({
			data : {
				searchKey : pd_number
			},
			url : "${pageContext.request.contextPath}/createAddCartForm.do",		
			success : function(data) {
				//alert(data.mk_name);
				$(".table-modal-body").remove();
				$newTbody = $("<tbody class='table-modal-body'></tbody>")
				$(".table-modal").append($newTbody);
				
				var amountState = (data.pd_amount == 0) ? '매진': data.pd_amount ;

				var $cellsOfRow = $(
						"<tr>" +
						"<td><strong>물품명 : </strong></td>" +
						"<td>" + data.pd_name + "</td>" +
						"</tr>"+
						"<tr>" +
						"<td><strong>물품가격 : </strong></td>" +
						"<td>" + data.pd_price + "</td>" +
						"</tr>"+
						"<tr>" +
						"<td><strong>남은개수 : </strong></td>" +
						"<td>" + amountState + "</td>" +
						"</tr>"+
						"<tr>" +
						"<td><strong>구매개수 : </strong></td>" +
						"<td><input id='amount' type='number' min='0' max='100' value='1'></td>" +
						"<input type='hidden' id='pd_number' value="+ data.pd_number +">"+
						"</tr>"
						
						);
				$(".table-modal-body").append($cellsOfRow);		

			},
			error : function(error){
				alert("오류");
			}
		});
	}
	/* 
	$('#amount').click(function(){
		 //alert("d");
		 var amount = document.getElementById("amount").value;
		 
		 alert(amount);
	}); */
	$(document).on('click','#amount',function(){
		//alert("d");
		//이제 여기서 남은 개수보다 많으면 많다고 오류문구를 넣어줘야함
		var amount = document.getElementById("amount").value;
		var pd_number = document.getElementById("pd_number").value;
		fn_checkAmount(amount,pd_number);
	});
	
	function fn_checkAmount(minusAmount,pd_number){
		$.ajax({
			data : {
				minusAmount : minusAmount,
				searchKey : pd_number
			},
			url : "${pageContext.request.contextPath}/checkProductAmount.do",		
			success : function(data) {
				//여기까지 건듬
				//alert(data.mk_name);
				//alert(data);
				var check = data;
				if(check == 0){
					//매진
					alert("해당 상품은 품절입니다.")
				}else if(check == 1){
					//가능
				}else if(check == 2){
					//불가능
					alert("이 이상 개수를 구매하실 수 없습니다.")
				}
			},
			error : function(error){
				alert("오류");
			}
		});
	}

	function addCart(){
		//물품 장바구니에 등록
		var minusAmount = document.getElementById("amount").value;
		var pd_number = document.getElementById("pd_number").value;

		$.ajax({
			data : {
				minusAmount : minusAmount,
				pd_number : pd_number
			},
			url : "${pageContext.request.contextPath}/addCart.do",		
			success : function(data) {
				//여기까지 건듬
				//alert(data.mk_name);
				//alert(data);
				var check = data;
				if(check == 0){
					//매진
					alert("해당 상품은 품절입니다.")
				}else if(check == 1){
					//가능
					alert("장바구니에 성공적으로 담겼습니다.")
				}else if(check == 2){
					//불가능
					alert("장바구니에 담기에 실패하였습니다 (개수를 확인해주세요).")
				}
				location.reload();
			},
			error : function(error){
				alert("오류");
			}
		});
		
		
	}
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>