<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="이 문서는 매장 찾기 페이지가 되는 문서입니다.">
		
		<!-- header.jsp -->
		<%@ include file="../include/header.jsp" %>
		
		<!-- css / default -->
		<link href="${pageContext.request.contextPath}/resources/market/css/default.css" rel="stylesheet">
		
		<!-- css / table -->
		<link href="${pageContext.request.contextPath}/resources/market/css/table.css" rel="stylesheet">
		
		<!-- css / searchForm -->
		<link href="${pageContext.request.contextPath}/resources/market/css/searchForm.css" rel="stylesheet">
		
	</head>
	<body>
		
		<div class="bg-dark">
			<div>
				<h3 class="font-white text-center">현재 등록된 마트 : OO마트 ##점</h3>
			</div>
			<div class="d-flex justify-content-center h-100 pb-3">
	   			<div class="search"> 
	   				<input type="text" class="search-input" placeholder="마트명 or 지역명을 검색하세요." name=""> <a href="#" class="search-icon"> <i class="fa fa-search"></i> </a> 
	   			</div>
			</div>
		</div>
	
	
		<div class="container pt-4">
			<h2>매장 찾기</h2>
			<p>검색된 매장 결과입니다.</p>
			<div class="d-flex row">
		        <div class="col-md-12">
		            <div class="rounded">
		                <div class="table-responsive table-borderless">
		                    <table class="table text-center">
		                        <thead>
		                            <tr>
		                                
		                                <th>점포명</th>
		                                <th>주소</th>
		                                <th>전화번호</th>
		                                <th>상세보기</th>
		                                <th>...</th>
		                                
		                            </tr>
		                        </thead>
		                        <tbody class="table-body">
		                            <tr class="cell-1">
		                                <td>oo마트 ##점</td>
		                                <td>인천시 미추홀구</td>
		                                <td>010-1234-1234</td>
		                                <td><!-- Button trigger modal -->
											<button type="button" class="btn btn-warning pt-0 pb-0" data-toggle="modal" data-target="#detailModal">
											  상세보기
											</button>
										</td>
		                                <td><!-- Button trigger modal -->
											<button type="button" class="btn btn-success pt-0 pb-0">
											  기본상점등록
											</button>
										</td>
		                            </tr>
		                            <tr class="cell-1">
		                                <td>%%마트 @@점</td>
		                                <td>인천시 미추홀구</td>
		                                <td>010-1234-1234</td>
		                                <td><!-- Button trigger modal -->
											<button type="button" class="btn btn-warning pt-0 pb-0" data-toggle="modal" data-target="#detailModal">
											  상세보기
											</button>
										</td>
		                                <td><!-- Button trigger modal -->
											<button type="button" class="btn btn-success pt-0 pb-0">
											  기본상점등록
											</button>
										</td>
		                            </tr>
		                            <tr class="cell-1">
		                                <td>&&마트 $$점</td>
		                                <td>인천시 미추홀구</td>
		                                <td>010-1234-1234</td>
		                                <td><!-- Button trigger modal -->
											<button type="button" class="btn btn-warning pt-0 pb-0" data-toggle="modal" data-target="#detailModal">
											  상세보기
											</button>
										</td>
		                                <td><!-- Button trigger modal -->
											<button type="button" class="btn btn-success pt-0 pb-0">
											  기본상점등록
											</button>
										</td>
		                            </tr>
		                            <tr class="cell-1">
		                                <td>**마트 ^^점</td>
		                                <td>인천시 미추홀구</td>
		                                <td>010-1234-1234</td>
		                                <td><!-- Button trigger modal -->
											<button type="button" class="btn btn-warning pt-0 pb-0" data-toggle="modal" data-target="#detailModal">
											  상세보기
											</button>
										</td>
		                                <td><!-- Button trigger modal -->
											<button type="button" class="btn btn-success pt-0 pb-0">
											  기본상점등록
											</button>
										</td>
		                            </tr>
		                            <tr class="cell-1">
		                                <td>%%마트 @@점</td>
		                                <td>인천시 미추홀구</td>
		                                <td>010-1234-1234</td>
		                                <td><!-- Button trigger modal -->
											<button type="button" class="btn btn-warning pt-0 pb-0" data-toggle="modal" data-target="#detailModal">
											  상세보기
											</button>
										</td>
		                                <td><!-- Button trigger modal -->
											<button type="button" class="btn btn-success pt-0 pb-0">
											  기본상점등록
											</button>
										</td>
		                            </tr>
		                        </tbody>
		                    </table>
	
		                </div>
		            </div>
		        </div>
		    </div>
	
	
		</div>
	
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
			        <h3 class="text-center">상세 매장 정보</h3>
			        <p class="text-center">detail info</p>
			        
			        <table class="table text-lfet">
		                        
		                        <tbody class="table-body">
		                            <tr class="cell-1">
		                                <td><strong>마트명 : </strong></td>
		                                <td>oo마트 ##점</td>
		                            </tr>
		                            <tr class="cell-1">
		                                <td><strong>주소 : </strong></td>
		                                <td>인천시 미추홀구</td>
		                            </tr>
		                            <tr class="cell-1">
		                                <td><strong>전화번호 : </strong></td>
		                                <td>010-2124-2719</td>
		                            </tr>
		                            <tr class="cell-1">
		                                <td><strong>마트소개 : </strong></td>
		                                <td>저희 마트를 찾아주셔서 갑사합니다.</td>
		                            </tr>
		                            
		                        </tbody>
		                    </table>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary">지도 보기</button>
			      </div>
			    </div>
			  </div>
			</div>

	</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>