$(function(){
	$.post("/TTMS_v1.0/sale/get.do",{"play_status":"1"},function(data){
		var str = "";
		$.each(data,function(index,val){
			var type = "喜剧";
			if(val.play_type==1){
				type = "爱情片";
			}else if(val.play_type==2){
				type = "恐怖片";
			}
			str += "<div class='show'>" +
			"<img src='/TTMS_v1.0/"+val.play_image+"' class='picture' data-toggle='modal' data-target='modifyPlay' />" +
			"<a href='/TTMS_v1.0/saleShowSchedule.jsp?play_id="+val.play_id+"'><div class='informationShow'>" +
			"<p>名称:"+val.play_name+"</p>" +
			"<p>类型:"+type+"</p>" +
			"<p>时长:"+val.play_length+"分钟</p>" +
			"<p>导演：哈哈</p>" +
			"<p>主演：哈哈</p>" +
			"</div></a></div>";
		})
		
		$("#show").html(str);
	})
})