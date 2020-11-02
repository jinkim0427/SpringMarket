<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="이 문서는 마이페이지가 되는 문서입니다.">
	
	<!-- header.jsp -->
	<%@ include file="../include/header.jsp" %>
	
	<!-- css / default -->
	<link href="${pageContext.request.contextPath}/resources/market/css/default.css" rel="stylesheet">
	
	<!-- css / table -->
	<link href="${pageContext.request.contextPath}/resources/market/css/table.css" rel="stylesheet">
	
</head>
<style type="text/css">
	/* Chrome, Safari, Edge, Opera */
	/* number tag option*/
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	  	-webkit-appearance: none;
	  	margin: 0;
	}

	/* Firefox */
	input[type=number] {
	  	-moz-appearance: textfield;
	}
	input[type=number]{
		text-align:center;
		width:25px;
	}
</style>
<body>
	<form id="orderForm" name="orderForm" method="post">
		<input type="hidden" name="selectedPickUp">
		<input type="hidden" name="selectedPayment">
		<input type="hidden" name="orderAddress">
	</form>
	
	<div class="container">

		<div class="row">

		<div class="col-md-3">	
			<h2>My Page</h2>
			<p>마이 페이지입니다.</p>

			<ul class="nav nav-pills flex-column" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#menu1">장바구니</a>
				</li>
				<li class="nav-item">
					<a class="nav-link " data-toggle="tab" href="#menu2">전체 주문 내역</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#menu3">내 정보</a>
				</li>
				<!-- <li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#menu4">내가 쓴 댓글</a>
				</li> -->
			</ul>
		</div>
		
		<div class="tab-content col-md-9">
			<div id="menu1" class="tab-pane active"><br>
				<h3>장바구니</h3>
				<p>현재 장바구니에 담긴 상품입니다.</p>
				<!--justify-content-center 테이블 센터 속성 -->
				<div class="d-flex row">
		        <div class="col-md-12">
		            <div class="rounded">
		                <div class="table-responsive table-borderless">
		                <form>
		                    <table class="table text-center table-shoppingCart">
		                        <thead>
		                            <tr>
		                                <th>물품</th>
		                                <th>가격</th>
		                                <th>개수</th>
		                                <th>합계</th>
		                                <th>...</th>
		                            </tr>
		                        </thead>
		                        <tbody class="table-shoppingCart-body">
		                        </tbody>

		                    </table>
		                    </form>
		                </div>
		        </div><!-- round 끝-->
		        <h4 id="totalPrice" class="text-right">상품 총 합계: 원</h4>
		    </div><!-- col 10-->
		    
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
			        <h3 class="text-center">장바구니 상품 삭제</h3>
			        <p class="text-center">drop Product from Cart</p>
			        
					<table class="table table-modal text-lfet">
						<tbody class="table-modal-body">
						</tbody>
					</table>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="button" onclick="deleteProduct()" data-dismiss="modal" class="btn btn-primary">확인</button>
			      </div>
			    </div>
			  </div>
			</div>
			
		    <div class="col-md-6">
		    	<p>제품 받는 방법</p>
		    	<div class="rounded">
				    <div class="table-responsive table-borderless">
				        <table class="table text-left">
				            <tbody class="table-body">
				                <tr class="cell-1">           
				                    <td>
	                                	<div class="custom-control custom-radio">
   									
	    									<input type="radio" name="pickUp-radio" id="jb-radio-1" value="배달" class="custom-control-input" checked>
	    									
	    									<label class="custom-control-label" for="jb-radio-1">집으로 배달</label>
	    								</div>
	    							</td>
	                            </tr>
	                            <tr class="cell-1">       
	                                <td>
	                                	<div class="custom-control custom-radio">
	    									
	    									
	    									<input type="radio" name="pickUp-radio" id="jb-radio-2" value="포장" class="custom-control-input">
	    									<label class="custom-control-label" for="jb-radio-2">마트 방문</label>
	    								</div>
	    							</td>
	                            </tr>        
	                        </tbody>
	                    </table>
	                </div>
			    </div>    
		    </div>
		    <div class="col-md-6">
		    	<p>결제 수단 선택</p>		
		    	<div class="rounded">
				    <div class="table-responsive table-borderless">
				        <table class="table text-left">
				            <tbody class="table-body">
				                <tr class="cell-1">           
				                    <td>
	                                	<div class="custom-control custom-radio">
	    									<input type="radio" name="payment-radio" id="pay-radio-1" value="현금" class="custom-control-input" checked>
	    									<label class="custom-control-label" for="pay-radio-1">현금 결제</label>
	    								</div>
	    							</td>
	                            </tr>
	                            <tr class="cell-1">       
	                                <td>
	                                	<div class="custom-control custom-radio">
	    									<input type="radio" name="payment-radio" id="pay-radio-2" value="카드" class="custom-control-input">
	    									<label class="custom-control-label" for="pay-radio-2">카드 결제</label>
	    								</div>
	    							</td>
	                            </tr>        
	                        </tbody>
	                    </table>
	                </div>
			    </div>    
		    </div>
		    <div class="col-md-12">
		    	<p>배송 정보</p>
		    	<div class="rounded">
				    <div class="table-responsive table-borderless">
				        <table class="table text-left">
				            <tbody class="table-body">
	                            <tr class="cell-1">       
	                                <td>주소</td>
	                                <td>:</td>
	    							<td><input type="text" class="form-control" id="address" placeholder="예: 인천관역시 미추홀구 인하로 100" maxlength="14"></td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
			    </div>
		    </div>
		    <div class="col-md-12">
		    	<p>요청 사항</p>
		    	<div class="rounded">
				    <div class="table-responsive table-borderless">
				        <table class="table text-left">
				            <tbody class="table-body">
				                <tr class="cell-1">               
	    							<td><input type="text" class="form-control" id="name" placeholder="예: 부재시, 전화 또는 문자 주세요. "></td>
	                            </tr>        
	                        </tbody>
	                    </table>
	                </div>
			    </div>
		    </div>
		    <div class="col-md-12 text-center">
		    	<button type="button" id="orderBtn" onclick="fn_orderProduct()" class="btn btn-success pd-3">주문하기</button>
		    </div> 
		    </div><!-- <div class="d-flex row"> -->
		    </div><!-- menu1 끝-->
		
			<div id="menu2" class="tab-pane"><br>
				<h3>주문 내역</h3>
				<!--justify-content-center 테이블 센터 속성 -->
				<div class="d-flex row">
		        <div class="col-md-12">
		            <div class="rounded">
		                <div class="table-responsive table-borderless">
		                    <table class="table text-center">
		                        <thead>
		                            <tr>
		                                <th>날짜</th>
		                                <th>판매자</th>
		                                <th>전화번호</th>
		                                <th>상품/정보</th>
		                                <th>전달/종류</th>
		                                <th>거래여부</th>
		                            </tr>
		                        </thead>
		                        <tbody class="table-body">
		                            <tr class="cell-1">           
		                                <td>20/09/18</td>
		                                <td>홍OO</td>
		                                <td>010-1234-1234</td>
		                                <td><!-- Button trigger modal -->
											<button type="button" class="btn btn-success pt-0 pb-0" data-toggle="modal" data-target="#exampleModal">
											  상세보기
											</button>
										</td>
		                                <td>배달</td>
		                                <td>미완료</td>
		                            </tr>
		                            <tr class="cell-1">          
		                                <td>20/09/17</td>
		                                <td>김OO</td>
		                                <td>010-1111-2233</td>
		                                <td>
		                                	<button type="button" class="btn btn-success pt-0 pb-0" data-toggle="modal" data-target="#exampleModal">
											  상세보기
											</button>
		                                </td>
		                                <td>방문</td>
		                                <td>완료</td>
		                            </tr>
		                            <tr class="cell-1">                        
		                                <td>20/09/17</td>
		                                <td>설OO</td>
		                                <td>010-4567-8910</td>
		                                <td>
		                                	<button type="button" class="btn btn-success pt-0 pb-0" data-toggle="modal" data-target="#exampleModal">
											  상세보기
											</button>
		                                </td>
		                                <td>배달</td>
		                                <td>완료</td>
		                            </tr>
		                            <tr class="cell-1">                   
		                                <td>20/09/16</td>
		                                <td>이OO</td>
		                                <td>010-2234-5678</td>
		                                <td>
		                                	<button type="button" class="btn btn-success pt-0 pb-0" data-toggle="modal" data-target="#exampleModal">
											  상세보기
											</button>
		                                </td>
		                                <td>배달</td>
		                                <td>완료</td>
		                            </tr>
		                        </tbody>
		                    </table>
		                </div>
		            </div>
		        </div>
		    </div>
		    <!-- modal생성하는곳-->
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        ...
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary">Save changes</button>
			      </div>
			    </div>
			  </div>
			</div>
			</div><!--menu2 끝 -->

			<div id="menu3" class="tab-pane"><br>
				<h3>내 정보</h3><br>
				<p>기본정보</p>
				<form id="frm" name="frm" method="POST">
					<!--justify-content-center 테이블 센터 속성 -->
					<div class="d-flex row">
					<div class="col-md-12">
					<div class="rounded">
					    <div class="table-responsive table-borderless">
					        <table class="table text-left">
					            <tbody class="table-body">
					                <tr class="cell-1">           
					                    <td>ID</td>
					                    <td>:</td>
		    							<td>${loginInfo.id }</td>
		                            </tr>
		                            <tr class="cell-1">       
		                                <td>새 비밀번호</td>
		                                <td>:</td>
		    							<td><input type="password" class="form-control" id="signPwd" name="signPwd" placeholder="···"></td>
		                            </tr> 
		                            <tr class="cell-1">
		                            	<td>새 비밀번호 확인</td>
		                            	<td>:</td>
		    							<td><input type="password" class="form-control"  id="signPwdCheck" placeholder="···"></td>
		                            </tr>
		                            <tr class="cell-1">
		                            	<td>이름</td>
		                            	<td>:</td>
		    							<td>${loginInfo.name }</td>
		                            </tr>
		                            <tr class="cell-1">
		                            	<td>전화번호</td>
		                            	<td>:</td>
		    							<td><input type="text" class="form-control"  id="signPhone" name="signPhone" value="${loginInfo.tel }"></td>
		                            </tr> 
		                            <tr class="cell-1">
		                            	<td>이메일</td>
		                            	<td>:</td>
		    							<td><input type="text" class="form-control"  id="signEmail" name="signEmail" value="${loginInfo.email }"></td>
		                            </tr> 
		                        </tbody>
		                    </table>
		                </div>
				    </div>
					</div>
				    <div class="col-md-12">
				    	<p>배송 정보</p>
				    	<div class="rounded">
						    <div class="table-responsive table-borderless">
						        <table class="table text-left">
						            <tbody class="table-body">		             
			                            <tr class="cell-1">       
			                                <td>주소</td>
			                                <td>:</td>
			                                <td><input type="text" class="form-control" id="myAddr" name="myAddr" placeholder="예: 인천광역시 미추홀구 인하로 100" value="${customerInfo.address }" maxlength="14"></td>   							
			                            </tr> 
			                        </tbody>
			                    </table>
			                </div>
					    </div>
				    </div>
				    <div class="col-md-12 text-center">
				    	<button type="button" class="btn btn-success pd-3" id="myInfoUpdate">수정하기</button>
				    </div> 
		    		</div><!-- <div class="d-flex row"> -->
		    </form>
			</div>
			<div id="menu4" class="tab-pane"><br>
				<h3>내가 쓴 댓글</h3>
				<p>개발중 입니다.</p>
			</div>
		</div>
		</div>
		</div>
		
<script type="text/javascript">
	window.onload = function(){
		//alert("t");
		$.ajax({
			
			url : "${pageContext.request.contextPath}/getShoppingCartList.do",		
			success : function(data) {
				//alert(data);
				$(".table-shoppingCart-body").remove();
				$newTbody = $("<tbody class='table-shoppingCart-body'></tbody>")
				$(".table-shoppingCart").append($newTbody);
				var totalPrice = 0;
				for (var i in data){
					//alert(data[i].pd_name);
					
					var sumPrice = parseInt(data[i].pd_price) * parseInt(data[i].sc_amount); 
					totalPrice = parseInt(totalPrice) + parseInt(sumPrice);
					var $cellsOfRow = $(
							"<tr class='cell-1' id=tr"+data[i].pd_number+">" +
							"<td id='pd_name" + data[i].pd_number + "'>" + data[i].pd_name + "</td>" +
							"<td id='price" + data[i].pd_number + "'>" + data[i].pd_price + "</td>" +
							"<td>" +
							"<a href='#' onclick='minusProductAmount(" + data[i].pd_number + ")'><i class='fa fa-minus'></i></a>" +
							"<input id='product" + data[i].pd_number + "' type='number' min='0' max='100' value=" + data[i].sc_amount + ">" +
							"<a href='#' onclick='plusProductAmount(" + data[i].pd_number + ")'><i class='fa fa-plus'></i></a>" +
							"</td>" +
							"<td id='subPrice" + data[i].pd_number + "'>" + sumPrice + "원</td>" +
							"<td><a href='#' data-toggle='modal' data-target='#detailModal' onclick='deleteModalForm(" + data[i].pd_number + ")'><i class='fa fa-trash'></i></a></td>" +
							"</tr>"
							);
					$(".table-shoppingCart-body").append($cellsOfRow);		

					
				}
				document.getElementById("totalPrice").innerHTML = "상품 총 합계 : " + totalPrice + " 원";
				
			},
			error : function(error){
				alert("오류");
			}
		});
		
		$("#myInfoUpdate").unbind("click").click(function(e){
			e.preventDefault();
			if($("#myAddr").val().length > 0) {
				fn_updateMyInfo($("#myAddr").val());
			}
			
		});
	};
	
	function minusProductAmount(pd_number){
		$.ajax({
			data : {
				pd_number : pd_number
			},
			url : "${pageContext.request.contextPath}/updateMinusProductAmount.do",		
			success : function(data) {
				//alert(data);
				if(data == 0){
					alert("품절입니다.");
				}else if(data==1){
					var pd_amount = document.getElementById("product"+pd_number).value;
					var result = parseInt(pd_amount)-parseInt('1')
					document.getElementById("product"+pd_number).value = result;
					var price = document.getElementById("price"+pd_number).innerHTML;
					var subPrice = parseInt(result) * parseInt(price);
					document.getElementById("subPrice"+pd_number).innerHTML = subPrice+"원";

					var totalPrice = document.getElementById("totalPrice").innerHTML;
					totalPrice = totalPrice.replace(/[^0-9]/g,"");
					totalPrice = parseInt(totalPrice) - parseInt(price);
					document.getElementById("totalPrice").innerHTML = "상품 총 합계 : " + totalPrice + " 원";
				}else if(data==2){
					alert("더 이상 줄일 수 없습니다.");
				}
			},
			error : function(error){
				alert("오류");
			}
		});
	}

	function plusProductAmount(pd_number){
		$.ajax({
			data : {
				pd_number : pd_number
			},
			url : "${pageContext.request.contextPath}/updatePlusProductAmount.do",		
			success : function(data) {
				//alert(data);
				if(data == 0){
					alert("해당 상품의 재고가 더 이상 없습니다.");
				}else if(data==1){
					var pd_amount = document.getElementById("product"+pd_number).value;
					var result = parseInt(pd_amount)+parseInt('1')
					document.getElementById("product"+pd_number).value = result;
					var price = document.getElementById("price"+pd_number).innerHTML;
					var subPrice = parseInt(result) * parseInt(price);
					document.getElementById("subPrice"+pd_number).innerHTML = subPrice+"원";

					var totalPrice = document.getElementById("totalPrice").innerHTML;
					totalPrice = totalPrice.replace(/[^0-9]/g,"");
					totalPrice = parseInt(totalPrice) + parseInt(price);
					document.getElementById("totalPrice").innerHTML = "상품 총 합계 : " + totalPrice + " 원";
				}
			},
			error : function(error){
				alert("오류");
			}
		});
	}

	function deleteModalForm(pd_number){
		//alert(pd_number);
		//fn_popupForDelete();
		$(".table-modal-body").remove();
		$newTbody = $("<tbody class='table-modal-body'></tbody>")
		$(".table-modal").append($newTbody);

		var pd_name = document.getElementById("pd_name"+pd_number).innerHTML;
		var $cellsOfRow = $(
				"<tr>" +
				"<td><strong>[상품명 : " + pd_name + "]</strong> 선택하신 상품을 삭제하시겠습니까?</td>" +
				"<input type='hidden' id='deletePD' value="+ pd_number +">"+
				"</tr>"
				);
		$(".table-modal-body").append($cellsOfRow);
	}

	function deleteProduct(){
		
		var pd_number = document.getElementById("deletePD").value;
		var totalPrice = document.getElementById("totalPrice").innerHTML;
		totalPrice = totalPrice.replace(/[^0-9]/g,"");
		var subPrice = document.getElementById("subPrice"+pd_number).innerHTML;
		subPrice = subPrice.replace(/[^0-9]/g,"");
		totalPrice = parseInt(totalPrice) - parseInt(subPrice);
		document.getElementById("totalPrice").innerHTML = "상품 총 합계 : " + totalPrice + " 원";
		$("#tr"+pd_number+"").remove();

		deleteProductDB(pd_number);
		//총 합계 금액 만들어주고 삭제되기
		//db에서도  삭제하기
	}

	function deleteProductDB(pd_number){
		$.ajax({
			data : {
				pd_number : pd_number
			},
			url : "${pageContext.request.contextPath}/deleteShoppingCartProduct.do",		
			error : function(error){
				alert("오류");
			}
		});
	}

	function fn_orderProduct(){
		//alert($('input[name=jb-radio]').val());
		//유저가 모든 form을 채웟다는 전제 조건 1.주문 하시겠습니까? 2. 물품이 장바구니에 있는지 Check 는 나중에 개발할 것
		var pickUp = document.querySelector('input[name="pickUp-radio"]:checked').value;
		var payment = document.querySelector('input[name="payment-radio"]:checked').value;
		var address = document.getElementById("address").value;
		document.orderForm.selectedPickUp.value = pickUp;
		document.orderForm.selectedPayment.value = payment;
		document.orderForm.orderAddress.value = address;
		document.orderForm.action = "<c:url value='/orderProduct.do'/>";
		document.orderForm.submit();
	}
	
	function fn_updateMyInfo(address){
		$.ajax({
			data : {
				address : address
			},
			url : "${pageContext.request.contextPath}/updateMyInfo.do",		
			success : function(data) {
				alert("수정하였습니다.");
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