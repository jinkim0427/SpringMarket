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
		                    <table class="table text-center">
		                        <thead>
		                            <tr>
		                                <th>물품</th>
		                                <th>개수</th>
		                                <th>합계</th>
		                                <th>...</th>
		                                
		                            </tr>
		                        </thead>
		                        <tbody class="table-body">
		                            <tr class="cell-1">
		                                
		                                <td>(농심)새우깡 90g</td>
		                                <td>
		                                	<a href="#" ><i class="fa fa-minus"></i></a>
		                                 	<input type="number" min="0" max="100" value="3">
		                                 	<!-- 나중에 이부분 이용해서 max치 불러와서 적용하고 js에서 주문하기전에 넘겻는지 확인 -->
		                                 	<a href="#"><i class="fa fa-plus"></i></a>
		                             	</td>
		                                <td>3900원</td>
		                                <td><i class="fa fa-trash"></i></td>

		                            </tr>
		                            <tr class="cell-1">
		                                
		                                <td>(농심)신라면 120g</td>
		                                <td>
		                                	<a href="#" ><i class="fa fa-minus"></i></a>
		                                 	<input type="number" min="0" max="100" value="2">
		                                 	<a href="#"><i class="fa fa-plus"></i></a>
		                                </td>
		                                <td>1100원</td>
		                                <td><i class="fa fa-trash"></i></td>
		                               
		                            </tr>
		                            <tr class="cell-1">
		                                
		                                <td>(롯데)칠성사이다 190ml x 30캔</td>
		                                <td>
		                                	<a href="#" ><i class="fa fa-minus"></i></a>
		                                 	<input type="number" min="0" max="100" value="1">
		                                 	<a href="#"><i class="fa fa-plus"></i></a>
		                                </td>
		                                <td>13000원</td>
		                                <td><i class="fa fa-trash"></i></td>
		                                
		                            </tr>
		                            <tr class="cell-1">
		                                
		                                <td>(미닛 메이드)오렌지 쥬스 1.5L x 4</td>
		                                <td>
		                                	<a href="#" ><i class="fa fa-minus"></i></a>
		                                 	<input type="number" min="0" max="100" value="2">
		                                 	<a href="#"><i class="fa fa-plus"></i></a>
		                                </td>
		                                <td>12000원</td>
		                                <td><i class="fa fa-trash"></i></td>
		                               
		                            </tr>
		                        </tbody>
		                    </table>
		                </div>
		        </div><!-- round 끝-->
		        <h4 class="text-right">상품 총 합계: 30000원</h4>
		    </div><!-- col 10-->

		    <div class="col-md-6">
		    	<p>제품 받는 방법</p>
		    	<div class="rounded">
				    <div class="table-responsive table-borderless">
				        <table class="table text-left">
				            <tbody class="table-body">
				                <tr class="cell-1">           
				                    <td>
	                                	<div class="custom-control custom-radio">
	    									<input type="radio" name="jb-radio" id="jb-radio-1" class="custom-control-input" checked>
	    									<label class="custom-control-label" for="jb-radio-1">집으로 배달</label>
	    								</div>
	    							</td>
	                            </tr>
	                            <tr class="cell-1">       
	                                <td>
	                                	<div class="custom-control custom-radio">
	    									<input type="radio" name="jb-radio" id="jb-radio-2" class="custom-control-input">
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
	    									<input type="radio" name="pay-radio" id="pay-radio-1" class="custom-control-input" checked>
	    									<label class="custom-control-label" for="pay-radio-1">현금 결제</label>
	    								</div>
	    							</td>
	                            </tr>
	                            <tr class="cell-1">       
	                                <td>
	                                	<div class="custom-control custom-radio">
	    									<input type="radio" name="pay-radio" id="pay-radio-2" class="custom-control-input">
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
				                    <td>받는분</td>
				                    <td>:</td>
	    							<td><input type="text" class="form-control" id="name" placeholder="예: 홍길동"></td>
	                            </tr>
	                            <tr class="cell-1">       
	                                <td>주소</td>
	                                <td>:</td>
	    							<td><input type="text" class="form-control" id="addr" placeholder="예: 인천관역시 미추홀구 인하로 100" maxlength="14"></td>
	                            </tr> 
	                            <tr class="cell-1">
	                            	<td>연락처</td>
	                            	<td>:</td>
	    							<td><input type="text" class="form-control"  id="phone" placeholder="예: 010-1234-5678"></td>
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
		    	<button type="button" class="btn btn-success pd-3">주문하기</button>
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
			    							<td><input type="text" class="form-control" id="addr" placeholder="예: 인천관역시 미추홀구 인하로 100" maxlength="14"></td>
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
			<div id="menu4" class="tab-pane"><br>
				<h3>내가 쓴 댓글</h3>
				<p>개발중 입니다.</p>
			</div>
		</div>
		</div>
		</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>