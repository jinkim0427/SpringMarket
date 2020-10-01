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
    							<td><input type="text" class="form-control" id="name" placeholder="예: 영문, 숫자"></td>
                            </tr>
                            <tr class="cell-1">       
                                <td>비밀번호</td>
                                <td>:</td>
    							<td><input type="password" class="form-control" id="pwd" placeholder="···"></td>
                            </tr> 
                            <tr class="cell-1">
                            	<td>비밀번호 확인</td>
                            	<td>:</td>
    							<td><input type="password" class="form-control"  id="pwdCheck" placeholder="···"></td>
                            </tr>
                            <tr class="cell-1">
                            	<td>이름</td>
                            	<td>:</td>
    							<td><input type="password" class="form-control"  id="name" placeholder="예 : 홍길동"></td>
                            </tr>
                            <tr class="cell-1">
                            	<td>전화번호</td>
                            	<td>:</td>
    							<td><input type="password" class="form-control"  id="phone" placeholder="예: 010-1234-5678"></td>
                            </tr> 
                            <tr class="cell-1">
                            	<td>이메일</td>
                            	<td>:</td>
    							<td><input type="password" class="form-control"  id="email" placeholder="예: example@ex.com"></td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
		    </div>
			<div class="text-center">
				    <button type="button" class="btn btn-secondary">이전으로</button>
			        <a href="signUp-info-individual.html"><button type="button" class="btn btn-primary">가입하기</button></a>
			</div>
		</div><!-- container-->
	
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>