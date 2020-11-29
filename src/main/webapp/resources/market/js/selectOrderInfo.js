function fn_selectOrderInfo(od_number) {
			$.ajax({
				data : {
					od_number : od_number
				},
				url : "selectOrderInfo.do",		
				success : function(data) {
					$(".table-order-info-body").remove();
					$newTbody = $('<tbody class="table-order-info-body"></tbody>')
					$(".table-order-info").append($newTbody);
					for(var i in data){
						var $cellsOfRow = $("<tr class='cell-1'>" +
								"<td>" + data[i].PD_NAME + "</td>" +
								"<td>" + data[i].OP_AMOUNT + "</td>" +
								"<td>" + data[i].OP_AMOUNT * data[i].PD_PRICE + "</td>" +
								"</tr>");
						$(".table-order-info-body").append($cellsOfRow);
					}
					
					$(".table-order-info-foot").remove();
					$newTfoot = $('<tfoot class="table-order-info-foot"></tfoot>')
					$(".table-order-info").append($newTfoot);
					var $cellsOfRowLast = $("<tr><th>합계</th><th></th><th>"+data[0].OD_TOTALPAY+"원</th>");
					$(".table-order-info-foot").append($cellsOfRowLast);
				},
				error : function(error){
					alert("정보를 불러오는데 실패하였습니다.");
				}
			});
		}