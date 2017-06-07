function addPlay() {
	var str = "<div id='addInputDiv' class='col-lg-4 col-xs-offset-1'>"
			+ "<div class='addInput'>"
			+ "<span>剧目类型:</span>"
			+ "<select>"
			+ "<option>爱情片</option>"
			+ "<option>恐怖片</option>"
			+ "</select>"
			+ "</div>"
			+ "<div class='addInput'>"
			+ "<span>剧目名称:</span> "
			+ "<input type='text' class='input' placeholder='请输入剧目名称'>"
			+ "</div>"
			+ "<div class='addInput'>"
			+ "<span>基本信息:</span> <input type='text' placeholder='请输入基本信息'>"
			+ "</div>"
			+ "<div class='addInput'>"
			+ "<span>剧目时长:</span> <input type='text' placeholder='请输入剧目时长'>"
			+ "</div>"
			+ "<div class='addInput'>"
			+ "<span>剧目票价:</span> <input type='text' placeholder='请输入剧目票价'>"
			+ "</div>"
			+ "<div class='addInput'>"
			+ "<span>剧目状态:</span> <select>"
			+ " <option>已上映</option>"
			+ "<option>未上映</option>"
			+ "</select>"
			+ "</div></div>"
			+ "</div>"
			+ "<div class='col-lg-4 col-xs-offset-3'>"
			+ "<a href='#'><img src='/TTMS_v1.0/img/init.jpg'"
			+ "style='width: 155px; height: 200px;' data-toggle='modal' data-target='#playImage'/></a></div>"
			+ "<div class='col-lg-5 col-xs-offset-5' style='margin-top:100px'>"
			+ "<button class='btn btn-danger' style='margin-right:100px'>确定</button>"
			+ "<button class='btn btn-default'>取消</button></div>";
	$("#myTabContent").html(str);
}

window.onload=function(){
	getAllData();
}

function getDataByName() {
	
	var val = $("#searchAll").val();
	var url="/TTMS_v1.0/play/getAllData.do";
	var args= {"play_name":val};
	$.post(url,args,function(data){
		var str = "";
		$.each(data,function(index,val){
			var type = "喜剧";
			if(val.play_type==1){
				type = "爱情片";
			}else if(val.play_type==2){
				type = "恐怖片";
			}
			
			str += "<div class='show'><img src='/TTMS_v1.0/"+val.play_image+"' class='picture' data-toggle='modal' data-target='modifyPlay' />" +
			"<a href='/TTMS_v1.0/play/searchById.do?play_id="+val.play_id+"'><div class='informationShow'>" +
			"<p>名称:"+val.play_name+"</p>" +
			"<p>类型:"+type+"</p>" +
			"<p>时长:"+val.play_length+"分钟</p>" +
			"<p>导演：哈哈</p>" +
			"<p>主演：哈哈</p>" +
			"<input style='display:none' value='"+val.play_id+"'/>" +
			"</div></a><div style='position:absolute'><button class='btn btn-danger' onclick='deletePlay("+val+")'>删除</button>"+
			"</div></div>";
		})
		
		$("#show").html(str);
	});
}

function getAllData() {
	var val = $("#searchAll").val();
	var url="/TTMS_v1.0/play/getAllData.do";
	var args= {"play_name":""};
	$.post(url,args,function(data){
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
			"<a href='/TTMS_v1.0/play/searchById.do?play_id="+val.play_id+"'><div class='informationShow'>" +
			"<p>名称:"+val.play_name+"</p>" +
			"<p>类型:"+type+"</p>" +
			"<p>时长:"+val.play_length+"分钟</p>" +
			"<p>导演：哈哈</p>" +
			"<p>主演：哈哈</p>" +
			"<input style='display:none' value='"+val.play_id+"'/>" +
			"</div></a><div style='position:absolute'>" +
			"<button class='btn btn-danger' onclick='deletePlay("+val.play_id+")'>删除</button>"+
			"</div></div>";
		})
		
		$("#show").html(str);
	});
}

function deletePlay(play_id) {
	
		location.href="/TTMS_v1.0/play/deletePlay.do?play_id="+play_id;
}

function changImg(e){  
        for (var i = 0; i < e.target.files.length; i++) {  
            var file = e.target.files.item(i);  
            if (!(/^image\/.*$/i.test(file.type))) {  
                continue; //不是图片 就跳出这一次循环  
            }  
            //实例化FileReader API  
            var freader = new FileReader();  
            freader.readAsDataURL(file);  
            freader.onload = function(e) {  
                $("#myImg").attr("src",e.target.result);  
            };
        }
	
}