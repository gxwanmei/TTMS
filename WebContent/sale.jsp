<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>售票</title>
<script src="/TTMS_v1.0/js/jquery.min.js"></script>
<link rel="stylesheet" href="/TTMS_v1.0/css/sale.css">
<script src="/TTMS_v1.0/js/sale.js"></script>

</head>
<body>
	<jsp:include page="saleHeader.jsp"></jsp:include>
	<div class="contanier">
		<div id="tital"></div>
		<div align="right">
			<img src='/TTMS_v1.0/img/seat1.jpg'><span>已售</span> &nbsp;<img
				src='/TTMS_v1.0/img/seat2.jpg'><span>未售</span><img src='/TTMS_v1.0/img/seat3.jpg'><span>不可售</span>
		</div>
		<div class="col-lg-12">
			<div class="seat col-xs-6">
				<table id = "displaySeatsTable">
					
				</table>
			</div>
			<div class="col-xs-4 col-xs-offset-2" style="margin-top: 100px">
			<div id="imgDiv">
				<div class="imgs  col-xs-12">
				</div>
			</div>
			<div align="center">
				<button class="btn btn-info" id="saleYes" data-toggle="modal" data-target="#saleTicket">确定</button>
			</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="saleTicket" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" align="center">
						<h4 class="modal-title" id="modalLabel">售票</h4>
					</div>
						<div class="modal-body" align="center" id="addStudio">
							<div class="addInput">
								<span>单价：</span><span id="itemPrice"></span>
							</div>
							<div class="addInput">
								<span>票数：</span><span id="itemCount"></span>
							</div>
							<div class="addInput">
								<span>总价：</span><span id="totalPrice"></span>
							</div>
						</div>
							<div class="modal-footer">
							<div align="center">
								<button class="btn btn-danger" data-dismiss="modal" id="modifyTicketStatus">确定</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
							</div>
						</div>
				</div>
			</div>
		</div>
</body>
</html>