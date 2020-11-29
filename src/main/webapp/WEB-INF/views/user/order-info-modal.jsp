<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div class="modal fade" id="orderInfoModal" tabindex="-1" role="dialog" aria-labelledby="orderInfoModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="orderInfoModalLabel">주문 상세 보기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-order-info text-center">
                     <thead>
                         <tr>
                             <th>상품명</th>
                             <th>개수</th>
                             <th>가격</th>
                         </tr>
                     </thead>
                     <tbody class="table-order-info-body">
                     </tbody>
                     <tfoot class="table-order-info-foot">
                     </tfoot>
                 </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>