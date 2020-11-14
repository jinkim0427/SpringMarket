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

	<div class="container">

		<div class="row">

		<div class="col-md-3">	
			<h2>My Page</h2>
			<p>마이 페이지입니다.</p>

			<ul class="nav nav-pills flex-column" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#menu1">고객 주문 현황</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#menu2">상품 등록</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#menu3">물품 재고 관리</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#menu4">마트 정보</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#menu5">내 정보</a>
				</li>
			</ul>
		</div>

		<div class="tab-content col-md-9">
			<div id="menu1" class="tab-pane active"><br>
				<h3>고객 주문 현황</h3>
				<!--justify-content-center 테이블 센터 속성 -->
				<div class="d-flex row">
		        <div class="col-md-12">
		            <div class="rounded">
		                <div class="table-responsive table-borderless">
		                    <table class="table text-center">
		                        <thead>
		                            <tr>
		                               
		                                <th>날짜</th>
		                                <th>구매자</th>
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
		    


			</div><!--menu1 끝 -->

			<div id="menu2" class="tab-pane"><br>
				<h3>상품 등록</h3>
				<p>판매하실 물품들을 등록하세요.</p>
				<form id="frmProduct" name="frmProduct" method="POST">
					<!--justify-content-center 테이블 센터 속성 -->
					<div class="d-flex row">
			        <div class="col-md-12">
			            <div class="rounded">
					    <div class="table-responsive table-borderless">
					        <table class="table text-left">
					            <tbody class="table-body">
					                <tr class="cell-1">           
					                    <td>카테고리</td>
					                    <td>:</td>
		    							<td>
		    								<select class="custom-select" id="productCategory">
											    <option selected>Choose...</option>
											    <option value="1">과자</option>
											    <option value="2">냉동식품</option>
											    <option value="3">라면</option>
											    <option value="4">도시락</option>
											    <option value="5">채소</option>
											    <option value="6">과일</option>
											    <option value="7">수산</option>
											    <option value="8">축산</option>
											    <option value="9">통조림</option>
											    <option value="10">빵</option>
											    <option value="11">생활용품</option>
											    <option value="12">음료</option>
											</select>
		    							</td>
		                            </tr>
		                            <tr class="cell-1">       
		                                <td>물품명</td>
		                                <td>:</td>
		    							<td><input type="text" class="form-control" id="productName" placeholder="예: (농심)새우깡	∴(회사)제품명" maxlength="14"></td>
		                            </tr> 
		                            <tr class="cell-1">
		                            	<td>개수</td>
		                            	<td>:</td>
		    							<td><input type="text" class="form-control"  id="productAmount" placeholder="예: 90			∴(단위 생략)"></td>
		                            </tr>
		                            <tr class="cell-1">
		                            	<td>판매금액</td>
		                            	<td>:</td>
		    							<td><input type="text" class="form-control"  id="productPrice" placeholder="예: 1500			∴(콤마,원 생략)"></td>
		                            </tr>
		                            <tr class="cell-1">
		                            	<td>상품이미지</td>
		                            	<td>:</td>
		    							<td><input type="text" class="form-control"  id="productImg"></td>
		                            </tr>
		                        </tbody>
		                    </table>
		                </div>
				    </div><!-- round 끝-->
			    	</div><!-- col 10-->
				    <div class="col-md-12 text-center">
				    	<button type="button" class="btn btn-success pd-3" id="productInfoButton">등록하기</button>
				    </div>
				    <input type="hidden" id="marketNumber" name="marketNumber" value="${marketInfo.mk_number}">
	    			</div><!-- <div class="d-flex row"> -->
		    	</form>
			</div><!-- menu2 끝-->

			<div id="menu3" class="tab-pane"><br>
				<h3>물품 재고 관리</h3>
				<p>개발중 입니다.</p>
			</div>
			
			<div id="menu4" class="tab-pane"><br>
				<h3>마트 정보</h3>
				<p>마트 기본 정보입니다.</p>
				<form id="frmMarket" name="frmMarket" method="POST">
					<!--justify-content-center 테이블 센터 속성 -->
					<div class="d-flex row">
					<div class="col-md-12">
					<div class="rounded">
					    <div class="table-responsive table-borderless">
					        <table class="table text-left">
					            <tbody class="table-body">
					                <tr class="cell-1">           
					                    <td>마트 이름</td>
					                    <td>:</td>
		    							<td><input type="text" class="form-control"  id="marketName" name="marketName" value="${marketInfo.mk_name }"></td>
		                            </tr>
		                            <tr class="cell-1">       
		                                <td>마트 주소</td>
		                                <td>:</td>
		    							<td><input type="text" class="form-control"  id="marketAddress" name="marketAddress" value="${marketInfo.mk_address }"></td>
		                            </tr> 
		                            <tr class="cell-1">
		                            	<td>마트 전화번호</td>
		                            	<td>:</td>
		    							<td><input type="text" class="form-control"  id="marketTel" name="marketTel" value="${marketInfo.mk_tel }"></td>
		                            </tr>
		                            <tr class="cell-1">
		                            	<td>마트 소개</td>
		                            	<td>:</td>
		    							<td><input type="text" class="form-control"  id="marketIntro" name="marketIntro" value="${marketInfo.mk_intro }"></td>
		                            </tr>
		                            <tr class="cell-1">           
					                    <td>
		                                	<div class="custom-control custom-checkbox">
		    									<input type="checkbox" name="marketState" id="marketState" class="custom-control-input" value="${marketInfo.mk_state }"> 
		    									<label class="custom-control-label" for="marketState">영업 시작 </label>
		    								</div>
		    							</td>
		    							<td></td>
		    							<td>
		                                	<div class="custom-control custom-checkbox">
		    									<input type="checkbox" name="marketDelivery" id="marketDelivery" class="custom-control-input" value="${marketInfo.mk_delivery }">
		    									<label class="custom-control-label" for="marketDelivery">배달 가능</label>
		    								</div>
		    							</td>
		                            </tr>
		                        </tbody>
		                    </table>
		                </div>
				    </div>
					</div>
				    
				    <div class="col-md-12 text-center">
				    	<button type="button" class="btn btn-success pd-3" id="marketInfoButton">
						    <c:if test="${empty marketInfo}">
						    	등록하기
					      	</c:if>
					      	<c:if test="${not empty marketInfo}">
						    	수정하기
					      	</c:if>
				      	</button>
				    </div> 
				    <input type="hidden" id="marketNumber" name="marketNumber" value="${marketInfo.mk_number}">
				    <input type="hidden" id="sellerNumber" name="sellerNumber" value="${sellerInfo.seller_number}">
		    		</div><!-- <div class="d-flex row"> -->
		    </form>
				
			</div>
			
			<div id="menu5" class="tab-pane"><br>
				<h3>내 정보</h3>
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
				    
				    <div class="col-md-12 text-center">
				    	<button type="button" class="btn btn-success pd-3">수정하기</button>
				    </div> 
		    		</div><!-- <div class="d-flex row"> -->
		    </form>
			</div>
		</div>
		</div>
		</div>
		
		<script type="text/javascript">
		$(function() {
			$("input:checkbox[id='marketState']").prop("checked", ${marketInfo.mk_state});
			$("input:checkbox[id='marketDelivery']").prop("checked", ${marketInfo.mk_delivery});
			
			$("#marketInfoButton").unbind("click").click(function(e){
				e.preventDefault();
				if(fn_checkMarketInfo()) fn_updateMarketInfo();
			});
			
			$("#productInfoButton").unbind("click").click(function(e){
				e.preventDefault();
				if(fn_checkProductInfo()) fn_insertProductInfo();
			});
		});
		
		function fn_checkProductInfo(){
			if($("#marketNumber").val() == "") alert("마트정보를 입력해주세요.");
			else if($("#productCategory").val() == "Choose...") alert("카테고리를 선택해주세요.");
			else if($("#productName").val().length < 1) alert("이름을 입력해주세요.");
			else if($("#productAmount").val().length < 1) alert("개수를 입력해주세요.");
			else if($("#productPrice").val().length < 1) alert("가격을 입력해주세요.");
			else return true;
			return false;
		}
		
		function fn_insertProductInfo(){
			$.ajax({
				data : {
					mk_number : $("#frmProduct #marketNumber").val(),
					pd_category: $("#frmProduct #productCategory").val(),
					pd_name : $("#frmProduct #productName").val(),
					pd_amount : $("#frmProduct #productAmount").val(),
					pd_price : $("#frmProduct #productPrice").val(),
					pd_img : $("#frmProduct #productImg").val()
				},
				url : "${pageContext.request.contextPath}/insertProductInfo.do",		
				success : function(data) {
					alert("등록되었습니다.");
				},
				error : function(error){
					alert("오류");
				}
			});
		}
	
		function fn_checkMarketInfo(){
			if($("#marketName").val().length < 1) alert("이름을 입력해주세요.");
			else if($("#marketAddress").val().length < 1) alert("주소를 입력해주세요.");
			else if($("#marketTel").val().length < 1) alert("전화번호를 입력해주세요.");
			else if($("#marketIntro").val().length < 1) alert("소개를 입력해주세요.");
			else return true;
			return false;
		}
		
		function fn_updateMarketInfo(){
			$.ajax({
				data : {
					mk_number : $("#frmMarket #marketNumber").val(),
					seller_number : $("#frmMarket #sellerNumber").val(),
					mk_name : $("#frmMarket #marketName").val(),
					mk_address : $("#frmMarket #marketAddress").val(),
					mk_tel : $("#frmMarket #marketTel").val(),
					mk_intro : $("#frmMarket #marketIntro").val(),
					mk_state : $("#frmMarket #marketState").prop("checked"),
					mk_delivery : $("#frmMarket #marketDelivery").prop("checked")
				},
				url : "${pageContext.request.contextPath}/updateMarketInfo.do",		
				success : function(data) {
					alert("완료하였습니다.");
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