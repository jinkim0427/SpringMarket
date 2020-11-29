<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.util.Random' %>    
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
					<a class="nav-link" data-toggle="tab" href="#menu3">상품 재고 관리</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#menu4">마트 정보</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#menu5">내 정보</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#menu6">상담하기<i class="fa fa-comment"></i></a>
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
		                    <table class="table table-order text-center">
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
		                        <tbody class="table-order-body">
		                        </tbody>
		                    </table>
		                </div>
		            </div>
		        </div>
		    </div>

		    <!-- modal생성하는곳-->
		    <%@ include file="order-info-modal.jsp" %>
			</div><!--menu1 끝 -->


			<div id="menu2" class="tab-pane"><br>
				<h3>상품 등록</h3>
				<p>판매하실 상품들을 등록하세요.</p>
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
		                                <td>상품명</td>
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
				<h3>상품 재고 관리</h3>
				<p>상품 재고를 관리합니다.</p>
				<div class="d-flex row">
				<div class="col-md-3 text-right">
					<select class="custom-select" id="listCategory">
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
				</div>
				<div class="col-md-9 text-right">
				    <button type="button" class="btn btn-success pd-3" id="listButton">수정하기</button>
				</div>
				<br></br>
		        <div class="col-md-12">
		            <div class="rounded">
		                <div class="table-responsive table-borderless">
		                    <table class="table table-product text-center">
		                        <thead>
		                            <tr>
		                                <th style="width: 50%;">상품 명</th>
		                                <th>가격</th>
		                                <th>재고 수량</th>
		                                <th>삭제</th>
		                            </tr>
		                        </thead>
		                        <tbody class="table-product-body">               
		                        </tbody>
		                    </table>
		                </div>
		            </div>
		        </div>
		    </div>
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
						
			<div id="menu6" class="tab-pane"><br>
				<h3>상담 하기</h3>
				<p>현재 마트를 이용하고 있는 고객들의 목록입니다.</p>
				<form name="usersForm">
					<div class="d-flex row">
				        <div class="col-md-12">
				        	<div class="rounded">
				                <div class="table-responsive table-borderless">
				                    
										
											<input type="hidden" id="roomId" name="roomId"/>
											<input type="hidden" id="username" name="username"/>
										<br/>
										<!-- List -->
										<table class="table text-center" id="users" name="users" cellspacing='0'><!-- cellspacing='0' is important, must stay -->
									    	<tr><th>사용중인 회원</th></tr><!-- Table Header -->
									    	<tr><td>이용하고 있는 고객이 없습니다.</td></tr>
									    </table>
										
									
				                </div>
				            </div>
						</div>
			    	</div>	
		    	</form>
				
			            
			        
			</div>
			
		</div><!-- <div class="tab-content col-md-9"> -->
		</div>
		</div>
		
		
		<script>
		//chat 팝업창을 여러개 띄우기 위함	
		var webSocket = null;
		$(document).ready(function() {
			var url = 'ws://' + window.location.host + '${pageContext.request.contextPath}/usersServerEndpoint/'+'${UserVO.id}';
			webSocket = connection(url);
			var connectionType;
			
			webSocket.onopen = function(){ processOpen(); };
			webSocket.onmessage = function(message) { processMessage(message); };
			webSocket.onerror = function(message) { processError(message); };
			
		});
		//var webSocket = new WebSocket('ws://' + window.location.host + '/egov-messenger/usersServerEndpoint');
		
		
		function connection(url) {
			var webSocket = null;
			if ('WebSocket' in window) {
				webSocket = new WebSocket(url);
			} else if ('MozWebSocket' in window) {
				webSocket = new MozWebSocket(url);
			} else {
				Console.log('Error: WebSocket is not supported by this browser.');
	            return null;
			}
			return webSocket;
		}
		
		function processOpen() {
			connectionType = "firstConnection";
			username = "${UserVO.id}";
			webSocket.send(JSON.stringify({ "connectionType" : connectionType, "username" : username }));
		}
			
		//server에서 메시지가 넘어왔을때
		function processMessage(message) {
			var jsonData = JSON.parse(message.data);
			
			if (jsonData.allUsers != null) {
				//다른 사용자 접속 시,
				displayUsers(jsonData.allUsers);
			} 
			
			if (jsonData.disconnectedUser != null) {
				//다른 사용자가 접속을 끊을 때,
				$("#"+jsonData.disconnectedUser).remove();
			}
			
			//다른 사용자와 대화하고자 시도할 때, 채팅창을 팝업
			if (jsonData.enterChatId != null) {
				var roomId = jsonData.enterChatId;
				$("#roomId").val(roomId);
				$("#username").val(jsonData.username);
				openPopup(roomId);
			}
		}
		
		function openPopup(roomId) {
			var popOptions = "width= 360, height= 500, resizable=no, status= no, scrollbar= no"; 
			var targetTitle = random(roomId); //두명의 사용자가 다른 팝업으로 뜨기 위해서 targetTitle을 랜덤으로 만들어준다.
			popupPost("<c:url value='/msg/websocketMessengePopup.do'/>", targetTitle, popOptions);
		}
		
		function popupPost(url, target, option) {
			window.open("", target, option);
			
			var form = $("form[name=usersForm]");
			form.attr("target", target);
			form.attr("action", url);
			form.attr("method", "post");
			form.submit();
		}
		
		
		function displayUsers(userList) {
			var username;
			$("#users tr:not(:first)").remove();
			for (var i=0; i<userList.length; i++) {
				if("${UserVO.id}"!=userList[i]) {
					username = userList[i];
					
					$.newTr = $("<tr class='cell-1' id="+userList[i]+" onclick='trClick(this)'><td>"+username+"</td></tr>");
					$("#users").last().append($.newTr);
				} else{
					//username = userList[i];
				}
				
				//append
				
			}
		}
		
		//다른 사용자 선택 시, 선택한 사용자 값을 서버에 전달
		function trClick(selectedTr) {
			if (selectedTr.id != null) {
					connectionType = "chatConnection";
					webSocket.send(JSON.stringify({ "connectionType" : connectionType, "connectingUser" : selectedTr.id }));
				}
		}
		
		function random(roomId) {
			<%
				String rUid = "";
			
				for(int i=0; i<8; i++) {
					rUid += (char)((new Random().nextDouble()*26)+97);
				}
			%>
			return roomId+"."+"<%=rUid%>";
		}
		
		function processError(message) {
			messagesTextArea.value += "error...\n";
		}
	
		window.onbeforeunload = function() {
			webSocket.close();
		};
	</script>
		
	<script type="text/javascript">
		$(function() {
			$("input:checkbox[id='marketState']").prop("checked", ${marketInfo.mk_state});
			$("input:checkbox[id='marketDelivery']").prop("checked", ${marketInfo.mk_delivery});
			var category = 0;
			fn_selectMarketOrder();

			$("#productInfoButton").unbind("click").click(function(e){
				e.preventDefault();
				if(fn_checkProductInfo()) fn_insertProductInfo();
			});
			
			$("#listCategory").change(function(){
				category = $(this).val();
				fn_selectProductList(category);
			});
			
			$(document).on("click","a[name='deleteProduct']",function(){ 
				var pd_number = $(this).parent().find("input[name='productNumber']").val();
			    fn_deleteProduct(pd_number);
			    fn_selectProductList(category);  
			});
			
			$("#listButton").unbind("click").click(function(e){
				fn_updateProduct();
			});
			
			$("#marketInfoButton").unbind("click").click(function(e){
				e.preventDefault();
				if(fn_checkMarketInfo()) fn_updateMarketInfo();
			});
			
		});
		
		function fn_selectMarketOrder(){
			$.ajax({
				data : {
					mk_number : $("#frmMarket #marketNumber").val()
				},
				url : "${pageContext.request.contextPath}/selectMarketOrder.do",		
				success : function(data) {
					$(".table-order-body").remove();
					$newTbody = $('<tbody class="table-order-body"></tbody>')
					$(".table-order").append($newTbody);
					for(var i in data){
						var od_status = fn_returnStatus(data[i].OD_STATUS, data[i].OD_NUMBER);
						var $cellsOfRow = $("<tr class='cell-1'>" +
								"<td>" + data[i].OD_TIME + "</td>" +
								"<td>" + data[i].NAME + "</td>" +
								"<td>" + data[i].TEL + "</td>" +
								"<td><button type='button' class='btn btn-info pt-0 pb-0' onClick='fn_selectOrderInfo(" + 
										data[i].OD_NUMBER + ")' data-toggle='modal' data-target='#orderInfoModal'>상세보기</button></td>" +
								"<td>" + data[i].OD_PICKUP + "</td>" +
								od_status +
								"</tr>");
						$(".table-order-body").append($cellsOfRow);
					}
				},
				error : function(error){
					alert("정보를 불러오는데 실패하였습니다.");
				}
			});
		}
		
		function fn_returnStatus(od_status, od_number){
			var str = "";
			if(od_status == "준비중") str = "<td><button type='button' class='btn btn-warning pt-0 pb-0' onClick='fn_updateOrderStatus(" + od_number + ",\"" + od_status + "\")'> " + od_status + "</button></td>";
			else if(od_status == "포장완료") str = "<td><button type='button' class='btn btn-success pt-0 pb-0'onClick='fn_updateOrderStatus(" + od_number + ",\"" + od_status + "\")'> " + od_status + "</button></td>";
			else if(od_status == "거래완료") str = "<td>" + od_status + "</td>" ;
			return str;
		}
		
		function fn_updateOrderStatus(od_number, od_status){
			$.ajax({
				data : {
					od_number : od_number,
					od_status : od_status
				},
				url : "${pageContext.request.contextPath}/updateOrderStatus.do",		
				success : function(data) {
					fn_selectMarketOrder();
				},
				error : function(error){
					alert("정보를 불러오는데 실패하였습니다.");
				}
			});
		}

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
				type : "POST",
				url : "${pageContext.request.contextPath}/insertProductInfo.do",		
				success : function(data) {
					alert("등록되었습니다.");
				},
				error : function(error){
					alert("오류");
				}
			});
		}
		
		function fn_selectProductList(category){
			$.ajax({
				data : {
					mk_number : $("#frmMarket #marketNumber").val(),
					pd_category : category
				},
				url : "${pageContext.request.contextPath}/selectProductList.do",		
				success : function(data) {
					$(".table-product-body").remove();
					$newTbody = $('<tbody class="table-product-body"></tbody>')
					$(".table-product").append($newTbody);
					for(var i in data){
						var $cellsOfRow = $("<tr class='cell-1'>" +
								"<td>" + data[i].pd_name + "</td>" +
								"<td>" + data[i].pd_price + "</td>" +
								"<td><input type='number' name='productAmount' style='width:50px;' min='0' max='100' value=" + data[i].pd_amount + "></td>" +
								"<td><a href='#' name='deleteProduct'><i class='fa fa-trash'></i></a>" +
								"<input type='hidden' name='productNumber' value='" + data[i].pd_number + "'></td>" +
								"</tr>");
						$(".table-product-body").append($cellsOfRow);
					}
				},
				error : function(error){
					alert("카테고리를 선택해주세요.");
				}
			});
		}
		
		function fn_deleteProduct(obj){
			$.ajax({
				data : {
					pd_number : obj
				},
				url : "${pageContext.request.contextPath}/deleteProduct.do",
				async : false,
				success : function(data) {
					alert("삭제되었습니다.");
				},
				error : function(error){
					alert("오류");
				}
			});
		}
		
		function fn_updateProduct() {
			var pd_amount = []
			var pd_number = []
			
			$("input[name='productAmount']").each(function(){
				pd_amount.push($(this).val());
            });
			$("input[name='productNumber']").each(function(){
				pd_number.push($(this).val());
            });
			
			$.ajax({
				type : "POST",
				dataType : "json",
				data : {
					pd_amount : pd_amount, 
					pd_number : pd_number
				},
				url : "${pageContext.request.contextPath}/updateProduct.do",
				success : function(data) {
					if(data) alert("수정하였습니다.");
					else alert("상품이 없습니다.");
				},
				error : function(error) {
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
		<script src="<c:url value='/resources/market/js/selectOrderInfo.js'/>"></script>
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>