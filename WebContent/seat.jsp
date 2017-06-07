<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>剧院管理系统主页</title>
<link rel="stylesheet" href="/TTMS_v1.0/css/seat.css">
<script src="/TTMS_v1.0/js/seat.js"></script>
<script src="/TTMS_v1.0/js/jquery.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		$.ajaxSetup({
			  async: false
			  });
		var url = window.location.href;
		var arr = url.split("?");
		var array = arr[arr.length-1].split("&");
		var studio_id = array[0].split("=")[1];
		var studio_size = array[1].split("=")[1];
		$.post("/TTMS_v1.0/studio/creat.do",{"studio_id":studio_id,"studio_size":studio_size},function(data){
			var studioName = data[0].studio.studio_name;
			var row;
			var colum;
			for(var i = 0; i < data.length; i++){
				var val = data[i];
				if(val.studio.studio_size === "default"){
					row = 6;
					colum = 9;
				}
				else if(val.studio.studio_size === "small"){
					row = 5;
					colum = 8;
				}
				else{
					row = 7;
					colum = 10;
				}
			}
			
			var tr = "";
			var x = 0;
				for(var j = 0; j < row; j++){
					tr += "<tr>"
					for(var k = 0; k < colum; k++){
						var jRow = j+1;
						var kColum = k+1;
						if(data[x].seat_status === "1"){
							tr+="<td><img src='/TTMS_v1.0/img/seat2.jpg' style='margin:25px' row='"+jRow+"' colum='"+kColum+"' status='1' class='seatImage'></td>";
						}
						else{
							tr+="<td><img src='/TTMS_v1.0/img/seat1.jpg' style='margin:25px' row='"+jRow+"' colum='"+kColum+"' status='0' class='seatImage'></td>";
						}
						x++;	
					}
					tr+="</tr>";
				}
			$("#displayStudioName").html("<h4>"+studioName+"</h4>")
			$("#displaySeatsTable").html(tr);
			$(".seatImage").click(function(){
				var imageThis = $(this);
				var seatRow = imageThis.attr("row");
				var seatColum = imageThis.attr("colum");
				var seatStatus = imageThis.attr("status");
				$("#displayTableRow").html(seatRow);
				$("#displayTableColum").html(seatColum);
				
				if(seatStatus === "1"){
					$("#displayTableStatus").val('1');
				}
				else{
					$("#displayTableStatus").val('0');
				}
				$("#displayTableStatus").change(function(){
					var seatRow = $("#displayTableRow").text();
					var seatColum = $("#displayTableColum").text();
					var seatStatus = $(this).val();
					$.post("/TTMS_v1.0/studio/updateSeat.do",{"seat_row":seatRow,"seat_colum":seatColum,"seat_status":seatStatus,"studio.studio_id":studio_id},function(data){
						if(data==1)
						{	
							//if(seatStatus === "0"){
								//var str = "<img src='/TTMS_v1.0/img/seat1.jpg' style='margin:25px' row='"+seatRow+"' colum='"+seatColum+"' status='"+seatStatus+"' class='seatImage'>";
								//imageThis.parent().html(str);
							//}else{
								//var str = "<img src='/TTMS_v1.0/img/seat2.jpg' style='margin:25px' row='"+seatRow+"' colum='"+seatColum+"' status='"+seatStatus+"' class='seatImage'>";
								//imageThis.parent().html(str);
							//}
							 location.reload();
						}
						else
						{
							alert("修改失败");
						}	
					})
				})
			})
		})
		
	}
</script>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="contanier">
		<div align="right">
			<img src="/TTMS_v1.0/img/seat1.jpg"><span>可选座位</span> &nbsp;<img
				src="/TTMS_v1.0/img/seat2.jpg"><span>不可选座位</span>
		</div>
		<div class="col-lg-12">
			<div class="seat col-xs-7" align="right">
				<table id = "displaySeatsTable">
					
						<c:forEach items="${seats}" var="seat" varStatus="x">
							<tr>
								<td><img src="/TTMS_v1.0/img/seat1.jpg" style="margin:25px" onClick=""></td>
							</tr>
						</c:forEach>
				</table>
			</div>
			<div class="col-xs-3 col-xs-offset-2" style="margin-top: 100px">
				<div class="table-responsive" align="right">
					<div align="center" id="displayStudioName">
					</div>
					<table class="table">
							<tr>
								<td>所在行</td>
								<td id="displayTableRow">0</td>
							</tr>
							<tr>
								<td>所在列</td>
								<td id="displayTableColum">0</td>
							</tr>
								<tr>
								<td>状态</td>
								<td><select style="width:70px" id="displayTableStatus"><option value="0">可选</option><option value="1">不可选</option></select></td>
							</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>