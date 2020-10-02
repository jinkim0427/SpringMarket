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
		<h3>판매 회원 가입 (약관 동의)</h3>

		<div class="rounded">
			    <div class="table-responsive table-borderless">
			        <table class="table text-left">
			            <tbody class="table-body">
			            	<tr class="cell-1">           
			                    <td>
                                	<div class="custom-control custom-checkbox">
    									<input type="checkbox" name="jb-checkbox" id="jb-checkbox-0" class="custom-control-input">
    									<label class="custom-control-label" for="jb-checkbox-0">전체 동의</label>
    								</div>
    							</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
		    </div> 

		    <p>필수 동의 항목</p>
		    <div class="rounded">
			    <div class="table-responsive table-borderless">
			        <table class="table text-left">
			            <tbody class="table-body">
			            	

			                <tr class="cell-1">           
			                    <td>
                                	<div class="custom-control custom-checkbox">
    									<input type="checkbox" name="jb-checkbox" id="jb-checkbox-1" class="custom-control-input">
    									<label class="custom-control-label" for="jb-checkbox-1">판매 회원 약관</label>
    								</div>
    							</td>
                            </tr>
                            <tr class="cell-1">           
			                    <td>
                                	<div class="custom-control custom-checkbox">
    									<input type="checkbox" name="jb-checkbox" id="jb-checkbox-2" class="custom-control-input">
    									<label class="custom-control-label" for="jb-checkbox-2">개인 정보 수집</label>
    								</div>
    							</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
		    </div> 

		    
		    <div class="text-center">
			    <a href="javascript:history.back();"><button type="button" class="btn btn-secondary">처음으로</button></a>
		        <a href="#" id="signUpInfo"><button type="button" class="btn btn-primary">동의하고 회원가입</button>	</a>
		        <form id="frm" name ="frm">
		       		<input type="hidden" id="pageName" name="pageName">
		        	<input type="hidden" id="user_acc" value="sales">
		        </form>
		    </div>
		    
	</div><!-- container-->
	
	<script src="<c:url value='/resources/market/js/signUp-term.js'/>"></script>
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>