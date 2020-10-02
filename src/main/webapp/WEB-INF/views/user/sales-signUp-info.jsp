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
			<h3>판매 회원 가입 (정보 입력)</h3>

			<div class="rounded">
			    <div class="table-responsive table-borderless">
			        <table class="table text-left">
			            <tbody class="table-body">
			                <tr class="cell-1">           
			                    <td>ID</td>
			                    <td>:</td>
    							<td><input type="text" class="form-control" id="sign_id" placeholder="예: 영문, 숫자"></td>
                            </tr>
                            <tr class="cell-1">       
                                <td>비밀번호</td>
                                <td>:</td>
    							<td><input type="password" class="form-control" id="sign_pwd" placeholder="···"></td>
                            </tr> 
                            <tr class="cell-1">
                            	<td>비밀번호 확인</td>
                            	<td>:</td>
    							<td><input type="password" class="form-control"  id="sign_pwdCheck" placeholder="···"></td>
                            </tr>
                            <tr class="cell-1">
                            	<td>이름</td>
                            	<td>:</td>
    							<td><input type="text" class="form-control"  id="sign_name" placeholder="예 : 홍길동"></td>
                            </tr>
                            <tr class="cell-1">
                            	<td>전화번호</td>
                            	<td>:</td>
    							<td><input type="text" class="form-control"  id="sign_phone" placeholder="예: 010-1234-5678"></td>
                            </tr> 
                            <tr class="cell-1">
                            	<td>이메일</td>
                            	<td>:</td>
    							<td><input type="text" class="form-control"  id="sign_email" placeholder="예: example@ex.com"></td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
		    </div>
			<div class="text-center">
				    <a href="javascript:history.back();"><button type="button" class="btn btn-secondary">이전으로</button></a>
				    <a href="#" id="salesSignUp"><button type="button" class="btn btn-primary">가입하기</button></a>
			        <!-- <a href="signUp-info-individual.html"><button type="button" class="btn btn-primary">가입하기</button></a> -->
			</div>
		</div><!-- container-->
		
		<script type="text/javascript">
			$(document).ready(function() {
				$("#salesSignUp").unbind("click").click(function(e) {
					e.preventDefault();
					fn_salesSignUp();
				});
			});
			 
			function fn_salesSignUp() {
				if($("#sign_id").val().length < 1) alert("아이디를 입력해주세요.");
				else if($("#sign_pwd").val().length < 1) alert("비밀번호를 입력해주세요.");
				else if($("#sign_pwdCheck").val().length < 1) alert("비밀번호확인을 입력해주세요.");
				else if($("#sign_pwd").val() != $("#sign_pwdCheck").val()) alert("비밀번호가 다릅니다.");
				else if($("#sign_name").val().length < 1) alert("이름을 입력해주세요.");
				else if($("#sign_phone").val().length < 1) alert("전화번호를 입력해주세요.");
				else if($("#sign_email").val().length < 1) alert("이메일 입력해주세요.");
				else alert("전체 입력 완료");
			}
		</script>
	
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>