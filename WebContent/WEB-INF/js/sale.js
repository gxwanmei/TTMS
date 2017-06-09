$(function(){
	var url = window.location.href;
	var arr = url.split("?")[1].split("=");
	var sched_id = arr[1];
	$.post("/TTMS_v1.0/sale/getTicket.do",{"schedule.sched_id":sched_id},function(data){
		var row = data[data.length-1].seat.seat_row;
		var colum = data[data.length-1].seat.seat_colum;
		var ticketPrice =  data[0].ticket_price;
		var x = 0;
		var tr = "";
			for(var j = 0; j < row; j++){
				tr += "<tr>"
				for(var k = 0; k < colum; k++){
					var jRow = j+1;
					var kColum = k+1;
					if(data[x].seat.seat_status === "1"){
						tr+="<td><img src='/TTMS_v1.0/img/seat3.jpg' style='margin:20px' row='"+jRow+"' colum='"+kColum+"' id='s"+data[x].ticket_id+"' status='1' class='seatImage'></td>";
					}
					else{
						tr+="<td><img src='/TTMS_v1.0/img/seat2.jpg' style='margin:20px' row='"+jRow+"' colum='"+kColum+"' id='s"+data[x].ticket_id+"' status='0' class='seatImage'></td>";
					}
					x++;	
				}
				tr+="</tr>";
			}
			$("#displaySeatsTable").html(tr);
			var count = 0;
			$(".seatImage").click(function(){
				var ticket_id1 = $(this).attr("id");
				var ticket_id = ticket_id1.split("s")[1];
				if($(this).attr("status") === "1"){
					return false;
				}
				else if($(this).attr("status") === "0"){
					$(this).attr("status","2");
					$(this).attr('src','/TTMS_v1.0/img/seat1.jpg'); 
					var str = "<div class='img-wrap  col-xs-5'><button id='"+ticket_id+"' class='img btn btn-default'>"+$(this).attr("row")+"行"+$(this).attr("colum")+"列   </button>"
					+ "<span class='img-close-icon'></span></div>";
					$(".imgs").append(str);
					count+=1;
				}
				else{
					$(this).attr("status","0");
					$(this).attr('src','/TTMS_v1.0/img/seat2.jpg'); 
					$("#"+ticket_id).parent().remove();
					count-=1;
				}
				if(count >= 6){
					alert("最多可选6张");
					return false;
				}
				
				$(".img-close-icon").click(function(){	
					var ticket_id = $(this).parent().find("button").attr("id");
					$("#s"+ticket_id).attr("status","0");
					$("#s"+ticket_id).attr('src','/TTMS_v1.0/img/seat2.jpg'); 
					$(this).parent().hide();
				})
			})
			
			$("#saleYes").click(function(){
				 $("#itemPrice").text(ticketPrice);
				 $("#itemCount").text(count);
				 var totalPrice = count*ticketPrice;
				 $("#totalPrice").text(totalPrice);
	
			})		
			
			$("#modifyTicketStatus").click(function(){
				var array = [];
				var tags=document.getElementsByTagName("div");
				for(var i = 0 ; i < tags.length; i++){
					if(tags[i].getAttribute("class") === "img-wrap  col-xs-5"){
						array.push({"ticket_id":tags[i].firstChild.getAttribute("id")});
					}
				}
				/*$.post("/TTMS_v1.0/sale/updateTicket.do",{},function(data)
				{
					alert(data);
				})*/
			})
		})
})