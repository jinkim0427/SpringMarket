<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="이 문서는 회원가입 페이지가 되는 문서입니다.">
	
	<!-- header.jsp -->
	<%@ include file="../include/header.jsp" %>
	
	<!-- css / default -->
	<link href="${pageContext.request.contextPath}/resources/market/css/default.css" rel="stylesheet">
	
	<!-- css / table -->
	<link href="${pageContext.request.contextPath}/resources/market/css/table.css" rel="stylesheet">
	
</head>
<body>
	<div class="container col-md-6 pt-4">
			<h3> 회원 가입 (정보 입력)</h3>
			
			<form id="frm" name="frm" method="POST">
			<div class="rounded">
			    <div class="table-responsive table-borderless">
			        <table class="table text-left">
			            <tbody class="table-body">
			                <tr class="cell-1">           
			                    <td>ID</td>
			                    <td>:</td>
    							<td><input type="text" class="form-control" id="signId" name="signId" placeholder="예: 영문, 숫자"></td>
                            </tr>
                            <tr class="cell-1">       
                                <td>비밀번호</td>
                                <td>:</td>
    							<td><input type="password" class="form-control" id="signPwd" name="signPwd" placeholder="···"></td>
                            </tr> 
                            <tr class="cell-1">
                            	<td>비밀번호 확인</td>
                            	<td>:</td>
    							<td><input type="password" class="form-control"  id="signPwdCheck" placeholder="···"></td>
                            </tr>
                            <tr class="cell-1">
                            	<td>이름</td>
                            	<td>:</td>
    							<td><input type="text" class="form-control"  id="signName" name="signName" placeholder="예 : 홍길동"></td>
                            </tr>
                            <tr class="cell-1">
                            	<td>전화번호</td>
                            	<td>:</td>
    							<td><input type="text" class="form-control"  id="signPhone" name="signPhone" placeholder="예: 010-1234-5678"></td>
                            </tr> 
                            <tr class="cell-1">
                            	<td>이메일</td>
                            	<td>:</td>
    							<td><input type="text" class="form-control"  id="signEmail" name="signEmail" placeholder="예: example@ex.com"></td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
		    </div>
		    	<input type="hidden" id="signAcc" name="signAcc" value=${signAcc }>
		    </form>
			<div class="text-center">
					<a href="javascript:history.back();"><button type="button" class="btn btn-secondary">이전으로</button></a>
					<a href="#" id="signIdCheck"><button type="button" class="btn btn-success">아이디확인</button></a>
			        <a href="#" id="signUpUser"><button type="button" class="btn btn-primary">가입하기</button></a>
			        <!--  <a href="signUp-info-individual.html"><button type="button" class="btn btn-primary">가입하기</button></a> -->
			</div>
		</div><!-- container-->
		
		<script type="text/javascript">
			$(document).ready(function() {
				
				$("#signUpUser").unbind("click").click(function(e) {
					e.preventDefault();
					fn_signUpUser();
				});
				
				$("#signIdCheck").unbind("click").click(function(e) {
					e.preventDefault();
					fn_signIdCheck();
				});
				
			});
			 
			function fn_signUpUser() {
				if($("#signId").val().length < 1) alert("아이디를 입력해주세요.");
				else if(!$("#signId").attr("disabled")) alert("아이디를 중복여부를 확인해주세요.");
				else if($("#signPwd").val().length < 1) alert("비밀번호를 입력해주세요.");
				else if($("#signPwdCheck").val().length < 1) alert("비밀번호확인을 입력해주세요.");
				else if($("#signPwd").val() != $("#signPwdCheck").val()) alert("비밀번호가 다릅니다.");
				else if($("#signName").val().length < 1) alert("이름을 입력해주세요.");
				else if($("#signPhone").val().length < 1) alert("전화번호를 입력해주세요.");
				else if($("#signEmail").val().length < 1) alert("이메일 입력해주세요.");	
				else {
					$("#signId").attr("disabled", false);
					fn_pageSubmit("insertUserData","frm");
				}
			}
			
			function fn_signIdCheck() {
				var userId = $("#signId").val();
				var userData = {"id": userId}
				$.ajax({
					async : false,
				    type : "POST", 
				    url : "${pageContext.request.contextPath}/checkUserID.do", 
				    data : userData,
				    dataType : "json",
				    error : function(error) { alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다."); },
				    success : function(result) { 
				    	if (result == 0) {
				     		$("#signId").attr("disabled", true);
				     		alert("사용이 가능한 아이디입니다.");
				    	}
				    	else if (result == 1) alert("이미 존재하는 아이디입니다. \n다른 아이디를 사용해주세요.");
				    	else alert("에러가 발생하였습니다.");
				    }
				 });
			}
		</script>
	
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>