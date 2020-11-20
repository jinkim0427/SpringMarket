<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.util.Random' %>
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
	
	<!-- sendForm -->
	
</head>
<body>
	<form id="shoppingForm" name="shoppingForm" method="post">
		<input type="hidden" name="selectedCategory">
	</form>
		
	<div class="bg-dark">	
		<div>
			<h3 class="font-white text-center">${mk_info.mk_name}</h3>
			
			
		</div>
		<div id="chatDiv" class="text-center">
			<form name="usersForm">
				<input type="hidden" id="roomId" name="roomId"/>
				<input type="hidden" id="username" name="username"/>
			</form>
			<div id="users">
				<!-- 이곳에 판매자의 대화 가능여부에 따라 채팅 버튼이 생김 -->
			</div>
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
	             	<a href="javascript:fn_shoppingDetail(1);">
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
	             	<a href="javascript:fn_shoppingDetail(2);">
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
	             	<a href="javascript:fn_shoppingDetail(3);">
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
	             	<a href="javascript:fn_shoppingDetail(4);">
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
	             	<a href="javascript:fn_shoppingDetail(5);">
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
	             	<a href="javascript:fn_shoppingDetail(6);">
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
	             	<a href="javascript:fn_shoppingDetail(7);">
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
	             	<a href="javascript:fn_shoppingDetail(8);">
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
	             	<a href="javascript:fn_shoppingDetail(9);">
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
	             	<a href="javascript:fn_shoppingDetail(10);">
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
	             	<a href="javascript:fn_shoppingDetail(11);">
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
	             	<a href="javascript:fn_shoppingDetail(12);">
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
	<script type="text/javascript">
		var webSocket = null;
		$(document).ready(function() {
			var url = 'ws://' + window.location.host + '${pageContext.request.contextPath}/usersServerEndpoint/'+'${salesId}';
			webSocket = connection(url);
			var connectionType;
			
			webSocket.onopen = function(){ processOpen(); }; //websocket.opopen 이 실행됨과 동시에 함수가 실행되는건가?
			// websocket.onopen 이 실행이 되고 난후에 function processOpen()함수가 실행되는게 아니라
			// 지금 webSocket.onopen onmessage onerror 모든 것을 거치고 난후에 실행됨
			// function() 매개변수가 없기 때문에 바로 실행
			webSocket.onmessage = function(message) { processMessage(message); };
			// onmessage 함수가 실행되려면 function()안에 매개변수가 있어야 한다는 것을 명시함
			
			//alert('JSP 실행 webSocket.onopen');
			webSocket.onerror = function(message) { processError(message); };
			
		});
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
			//alert('JSP 실행 processOpen');
			//connectionType 과 username 의 값을 JSON 형식으로 연결된 소켓을 통해 서버에 전달하게 된다.
			connectionType = "firstConnection"; 
			username = "${UserVO.id}";
			webSocket.send(JSON.stringify({ "connectionType" : connectionType, "username" : username }));
			//연결된 웹 소켓의 send()함수로 전달되면 서버에서는 
			//@OnMessage 로 되어있는 어노테이션의 함수를 실행시킨다.
			
		}
			
		//server에서 메시지가 넘어왔을때 session.getBasicRemote().sendText(buildJsonUserData(getUsers()));
		//여기서 message는 채팅에 활용되는 유저들이 작성한 메시지가 아닌 
		//서버에서 클라이언트로 보내는 유저들의 정보를 메시지라고 함
		function processMessage(message) {
			var jsonData = JSON.parse(message.data);
			
			if (jsonData.allUsers != null) {
				//다른 사용자 접속 시
				//이부분도 수정 해야함 해당 마켓의 주인이 있는지 없는지만 알 수 있도록
				displayUsers(jsonData.allUsers);
			} 
			
			if (jsonData.disconnectedUser != null) {
				//다른 사용자가 접속을 끊을 때,
				$("#"+jsonData.disconnectedUser).remove(); //해당 ID의 태그를 지운다.
			}
			
			//다른 사용자와 대화하고자 시도할 때, 채팅창을 팝업
			if (jsonData.enterChatId != null) {
				var roomId = jsonData.enterChatId;
				$("#roomId").val(roomId); //서버에서 랜덤값을 생성해서 보내줌
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
			
			var form = $("form[name=usersForm]"); //form 생성
			form.attr("target", target);
			form.attr("action", url);
			form.attr("method", "post");
			form.submit(); //action 값으로 컨트롤러에 보냄
		}

		function displayUsers(userList) {
			var username;
			
			$("#users").remove();
			$newUsers = $(`<div id="users"></div>`)
			$("#chatDiv").append($newUsers);
			
			
			for (var i=0; i<userList.length; i++) {
				if("${salesId}"==userList[i]) {
					//username = userList[i];//or 안뜨게 변경하기
					$newDiv = $(`<button type="button" onclick="chatStart()" class="btn btn-success pt-0 pb-0 mb-2 text-center" data-toggle='modal' data-target='#detailModal'>판매자와 상담하기 <i class='fa fa-comment'></i></button>`);
					$("#users").append($newDiv);
				} else{
					//username = userList[i];
				}
				//$.newTr = $("<tr id="+userList[i]+" onclick='trClick(this)'><td>"+username+"</td></tr>");
			}
			
			//append
			//$("#users").last().append($.newTr);
			
		}
		
		//다른 사용자 선택 시, 선택한 사용자 값을 서버에 전달
		// (현재 사용안함)
		function trClick(selectedTr) {
			if (selectedTr.id != null) {
					connectionType = "chatConnection";
					webSocket.send(JSON.stringify({ "connectionType" : connectionType, "connectingUser" : selectedTr.id }));
					//selectedTr.id 이부분을 마켓 유저의 name으로 설정
				}
		}

		//임시로 사용중 trClick 대신
		function chatStart() {
			connectionType = "chatConnection";
			connId = "${salesId}";
			webSocket.send(JSON.stringify({ "connectionType" : connectionType, "connectingUser" : connId }));
			
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
		
		function fn_shoppingDetail(category){
			//alert(category);
			document.shoppingForm.selectedCategory.value = category;
			document.shoppingForm.action = "<c:url value='/shoppingDetail.do'/>";
			document.shoppingForm.submit();
		}
	</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>