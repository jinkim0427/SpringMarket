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
			<div class="market-name">
				<h3 class="font-white text-center mk-name">현재 선택된 기본 마트 : ${mk_name}</h3>
			</div>
			<div class="d-flex justify-content-center h-100 pb-3">
	   			<div class="search"> 
	   				<input type="text" id="searchAddress" class="search-input" oninput="searchMarket()" placeholder="마트명 or 지역명을 검색하세요." name=""> <a href="#" class="search-icon" > <i class="fa fa-search"></i> </a> 
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
		                    <table class="table table-market text-center">
		                        <thead>
		                            <tr>
		                                
		                                <th>점포명</th>
		                                <th>주소</th>
		                                <th>상세보기</th>
		                                <th>약도확인</th>
		                                <th>...</th>
		                                
		                            </tr>
		                        </thead>
		                        <tbody class="table-body">
		                            
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
			        
			        <table class="table table-modal text-lfet">
		                        
		                        <tbody class="table-modal-body">
		                           
		                        </tbody>
		                    </table>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <!-- <button type="button" class="btn btn-primary">지도 보기</button> -->
			      </div>
			    </div>
			  </div>
			</div>
			
		<!-- modal 2생성하는곳-->
			<!-- Modal -->
			<div class="modal fade" id="detailModal2" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
			  <div class="modal-dialog" style="width : 100 %; max-width : 850px;" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="detailModalLabel">Spring Market</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-map-body">
			        <h3 class="text-center">상세 약도 정보</h3>
			        <p class="text-center">detail map info</p>
			        <div id="map" style="width:100%;height:350px;"></div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button onclick="fn_relayout()" type="button" class="btn btn-primary">지도 보기</button>
			      </div>
			    </div>
			  </div>
			</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${appkey}&libraries=services"></script>
		
<script type="text/javascript">
function searchMarket() {
	var mk_address = $('#searchAddress').val();
	//alert(mk_address);
	$.ajax({
		data : {
			searchKeyword : mk_address
		},
		url : "${pageContext.request.contextPath}/searchMarket.do",
		success : function(data) {
			$(".table-body").remove();
			$newTbody = $("<tbody class='table-body'></tbody>")
			$(".table-market").append($newTbody);
			for(var i in data){
				//alert(data[i].mk_name);
				
				var $cellsOfRow = $("<tr class='cell-1'>" +
						"<td>" + data[i].mk_name + "</td>" +
						"<td>" + data[i].mk_address + "</td>" +
						"<td>" + 
						"<button type='button' onclick='detailMarket(" + data[i].mk_number + ")' class='btn btn-warning pt-0 pb-0' data-toggle='modal' data-target='#detailModal'>" +
						"상세보기" +
						"</button>" + 
						"</td>" +
						"<td>" +
						"<button type='button' onclick='mapInfoMarket(" + data[i].mk_number + ")' class='btn btn-success pt-0 pb-0' data-toggle='modal' data-target='#detailModal2'>" +
						"약도보기" +
						"</button>" +
						"</td>" +
						"<td>" +
						"<a class='btn btn-primary pt-0 pb-0' onclick='choiceMarket(" + data[i].mk_number + ")'>" +
						"<input type='hidden' id='mk_number' value=" + data[i].mk_number + ">" +
						"기본 마트 지정" + 
						"</a>" +
						"</td>" +
						"</tr>");
				$(".table-body").append($cellsOfRow);
			}
		},
		error : function(error){
			alert("오류");
		}
	});
}
function choiceMarket(mk_number){
	//var mk_address = $('#searchAddress').val();
	//alert(mk_number);
	var mk_number = mk_number;
	$.ajax({
		data : {
			searchKey : mk_number
		},
		url : "${pageContext.request.contextPath}/choiceMarket.do",			
		success : function(data) {
			//alert(data.mk_name);
			$(".mk-name").remove();
			$newTbody = $("<h3 class='font-white text-center mk-name'>현재 등록된 마트 : " + data.mk_name + "</h3>")
			$(".market-name").append($newTbody);
		},
		error : function(error){
			alert("오류");
		}
	});
}
function detailMarket(mk_number){
	//alert(mk_number);
	$.ajax({
		data : {
			searchKey : mk_number
		},
		url : "${pageContext.request.contextPath}/detailMarket.do",		

		
		
   	 
		success : function(data) {
			//alert(data.mk_name);
			$(".table-modal-body").remove();
			$newTbody = $("<tbody class='table-modal-body'></tbody>")
			$(".table-modal").append($newTbody);
			var state = (data.mk_state>0) ? '오픈':'오픈준비중';
			var delivery = (data.mk_delivery>0) ? '배달가능':'배달불가능';
			var $cellsOfRow = $(
					"<tr>" +
					"<td><strong>마트명 : </strong></td>" +
					"<td>" + data.mk_name + "</td>" +
					"</tr>" +
					"<tr>" +
					"<td><strong>주소 : </strong></td>" +
					"<td>" + data.mk_address + "</td>" +
					"</tr>" +
					"<tr>" +
					"<td><strong>전화번호 : </strong></td>" +
					"<td>" + data.mk_tel + "</td>" +
					"</tr>" +
					"<tr>" +
					"<td><strong>영업 : </strong></td>" +
					"<td>" + state + "</td>" +
					"</tr>" +
					"<tr>" +
					"<td><strong>배달 : </strong></td>" +
					"<td>" + delivery + "</td>" +
					"</tr>" +
					"<tr>" +
					"<td><strong>마트 소개 : </strong></td>" +
					"<td>" + data.mk_intro + "</td>" +
					"</tr>"
					);
			$(".table-modal-body").append($cellsOfRow);
			
		},
		error : function(error){
			alert("오류");
		}
	});
}
</script>
<script>
var map;

function mapInfoMarket(mk_number){
	//alert(mk_number);
	var map_lat;
	var map_lon;
	$.ajax({
		data : {
			mk_number : mk_number
		},
		url : "${pageContext.request.contextPath}/map/selectMapInfo.do",		

		success : function(data) {
			$("#map").remove();
			$("#map-adress").remove();
			$newTbody = $(`<div id="map" style="width:100%;height:350px;"></div>`)
			$(".modal-map-body").append($newTbody);
			
			
			if(data.mp_number == null){
				map_lat = 37.566826004661;
				map_lon = 126.978652258309;
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				
			    mapOption = {
			        center: new kakao.maps.LatLng(map_lat, map_lon), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
				
			    //지도 생성
				map = new kakao.maps.Map(mapContainer, mapOption);

				coords = new kakao.maps.LatLng(map_lat, map_lon);
				var marker = new kakao.maps.Marker({
					map: map,
					position: coords
				});
				
				var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;height:15px;text-align:center;">'+'dd'+'</div>'
		        });
		        infowindow.open(map, marker);
		        fn_relayout();//map.relayout();
		        
			}else{
				
				//alert(data.mp_address);
				//alert(data.mp_number);
				map_lat = data.mp_lat;
				map_lon = data.mp_lon;
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				
			    mapOption = {
			        center: new kakao.maps.LatLng(map_lat, map_lon), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
				
			    
			    //지도 생성
				map = new kakao.maps.Map(mapContainer, mapOption);

				coords = new kakao.maps.LatLng(data.mp_lat, data.mp_lon);
				var marker = new kakao.maps.Marker({
					map: map,
					position: coords
				});
				
				var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;height:15px;text-align:center;">'+'마켓'+'</div>'
		        });
		        infowindow.open(map, marker);
		        $newTbodys = $("<p id='map-adress'>위치 : " + data.mp_address + "</p>")
				$(".modal-map-body").append($newTbodys);
		        fn_relayout();
			}
			
			
		},
		error : function(error){
			alert("오류");
		}
	});
	
	//setTimeout(function(){ map.relayout(); }, 0);
}

function fn_relayout(){
	//map.relayout();
	setTimeout(function(){ map.relayout(); }, 200);
	setTimeout(function(){ map.setCenter(coords); }, 200);
	//map.setCenter(coords);
}
</script>
	
	</body>
</html>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>