<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
	<title>Spring Market</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- bootstrap css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">
	
	<!--아이콘 CDN-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	

</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark sticky-top bg-dark ">
	<p class="font-color pr-2"><i class="fa fa-truck" aria-hidden="true"></i></p>
	<a class="navbar-brand" href="#" id="home">Spring Market</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarCollapse">
		<ul class="navbar-nav mr-auto">
	    	<li class="nav-item">
	    		<a class="nav-link" href="#" id="findMarket">매장찾기</a>
	    	</li>
	    	<li class="nav-item">
	        	<a class="nav-link" href="#" id="shopping">장보기</a>
	      	</li>
	    </ul>
	
	    <ul class="navbar-nav ml-auto">
	    	<c:if test="${empty loginInfo}">
		    	<li class="nav-item">
		        	<a class="nav-link" data-toggle="modal" data-target="#loginModal">로그인</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link" href="#" id="signUp">회원가입</a>
		      	</li>
	      	</c:if>
	      	<c:if test="${not empty loginInfo}">
		    	<li class="nav-item">
		        	<a class="nav-link" href="#" id="logout">로그아웃</a>
		      	</li>
		      	<li class="nav-item">
		      		<a class="nav-link">${loginInfo.name }님</a>
		      	</li>
	      	</c:if>
	      	<button class="btn btn-outline-secondary btn-sm removecaret" id="myPage">
			    	<p class="font-color"><i class="fa fa-user" aria-hidden="true"></i></p>
			</button>
	    </ul>
				
	
	</div>
	</nav>
	
	
	<!-- modal생성하는곳-->
	<!-- Login Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="loginModalLabel">Spring Market</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<form id="frmLogin" name="frmLogin" method="POST">
		      	<h3 class="text-center">로그인</h3>
		      	<p class="text-center">Log in</p>
		        <strong>아이디</strong>
		        <input type="text" class="form-control" placeholder="ID" id="loginId" name="loginId">
		        <strong>비밀번호</strong>
		        <input type="password" class="form-control" placeholder="password" id="loginPwd" name="loginPwd">
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" id="login">로그인</button>
	      </div>
	    </div>
	  </div>
	</div>
	<script src="<c:url value='/resources/jquery/jquery-3.3.1.min.js'/>"></script>
	<script src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#home").unbind("click").click(function(e){
				e.preventDefault();
				fn_pageMove("home");
			});
			$("#findMarket").unbind("click").click(function(e){
				e.preventDefault();
				fn_pageMove("findMarket");
			});
			$("#shopping").unbind("click").click(function(e){
				e.preventDefault();
				fn_pageMove("shopping");
			});
			// TestKaKao
			$("#testKaKao").unbind("click").click(function(e){
				e.preventDefault();
				fn_pageMove("testKaKao");
			});
			$("#signUp").unbind("click").click(function(e){
				e.preventDefault();
				fn_pageMove("signUp");
			});
			$("#myPage").unbind("click").click(function(e){
				e.preventDefault();
				fn_pageMove("myPage");
			});
			$("#login").unbind("click").click(function(e){
				e.preventDefault();
				if($("#loginId").val().length < 1) alert("아이디를 입력해주세요.");
				else if($("#loginPwd").val().length < 1) alert("비밀번호를 입력해주세요.");
				else fn_pageSubmit("loginUser","frmLogin");
			});
			$("#logout").unbind("click").click(function(e){
				e.preventDefault();
				fn_pageMove("logoutUser");
			});
		}); 

		function fn_pageMove(pageName) {
			window.location.href = "<c:url value='/"+pageName+".do'/>";
		}
		function fn_pageSubmit(pageName, form) {            
            $("#"+form).attr("action",pageName+".do");
            $("#"+form).submit();
		}
		
	</script>
</body>
</html>