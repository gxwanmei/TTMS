$(function(){
	var url = window.location.href;
	var arr = url.split("?")[1].split("=");
	var play_id = arr[1];	
	$.post("/TTMS_v1.0/sale/getSched.do",{"play.play_id":play_id},function(data){
		var str = "";
		$.each(data,function(index,val){
			str += "<tr><td>"+val.sched_id+"</td>"+
			"<td>"+val.play.play_name+"</td>"+
			"<td>"+val.studio.studio_name+"</td>"+
			"<td>"+val.sched_time+"</td>"+
			"<td>"+val.sched_date+"</td>"+
			"<td>"+val.sched_ticket_price+"</td>"+
			"<td><a href='/TTMS_v1.0/sale.jsp?sched_id="+val.sched_id+"'><button class='btn btn-danger'>售票</button></a></td></tr>";
	})
	$("#showSchedule").html(str);
})
})