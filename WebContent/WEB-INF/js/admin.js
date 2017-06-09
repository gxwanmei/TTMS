window.onload=function(){
	getAllData();
}

function getAllData() {
	
	var url="/TTMS_v1.0/admin/getAllUser.do";
	$.post(url,{},function(data){
		var str = "";
		$.each(data,function(index,val){
			var type = "管理员";
			var introduce = "略";
			if(val.type==0){
				type = "超级管理员";
				introduce ="对普通管理员和售票员进行更改和删除";
			}else if(val.type==1){
				type = "普通管理员";
				introduce="对演出厅，演出计划，剧目，普通员工等进行增删改查的管理";
			}else if(val.type==2){
				type = "售票员";
				introduce="进行售票业务";
			}
			str += "<div class='show'>" +
			"<img src='/TTMS_v1.0/"+val.u_photo+"' class='picture' data-toggle='modal' data-target='modifyPlay' />" +
			"<a href='/TTMS_v1.0/play/searchById.do?play_id="+val.play_id+"'><div class='informationShow'>" +
			"<p>账号:"+val.username+"</p>" +
			"<p>权限:"+type+"</p>" +
			"<p>简介:"+introduce+"</p>" +
			"<input style='display:none' value='"+val.id+"'/>" +
			"</div></a><div style='position:absolute'>" +
			"<button class='btn btn-danger' onclick='deleteUser("+val.id+")'>删除</button>"+
			"</div></div>";
		})
		
		$("#show").html(str);
	});
}

function deleteUser(id) {
		
		location.href="/TTMS_v1.0/admin/deleteUser.do?id="+id;
}