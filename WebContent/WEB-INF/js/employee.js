function checkEmpName() {
	var reg = /^[\u4e00-\u9fa5]{2,10}$/;
	var emp_name = document.getElementById(emp_name);
	if (!reg.test(emp_name.value)) {
		return false;
	} else {
		return true;
	}
}

function checkEmpNameOnFocus() {
	var emp_name = document.getElementById(emp_name);
	if (!checkEmpName()) {
		alert('请输入真实姓名,10字以内中文!');
		emp_name.focus();
	}
}

function checkEmpTelNum() {
	var reg = /^1[3-8][0-9]{9}$/;
	var emp_tel_num = document.getElementById(emp_tel_num);
	if (!reg.test(emp_tel_num.value)) {
		return false;
	} else {
		return true;
	}
}

function checkEmpTelNumOnFocus() {
	var emp_tel_num = document.getElementById(emp_tel_num);
	if (!checkEmpTelNum()) {
		alert('请输入11位正确手机号码!');
		emp_tel_num.focus();
	}
}

function checkEmpAddr() {
	var reg = /^[\u4e00-\u9fa5]{2,30}$/;
	var emp_addr = document.getElementById(emp_addr);
	if (!reg.test(emp_addr.value)) {
		return false;
	} else {
		return true;
	}
}

function checkEmpAddrOnfocus() {
	var emp_addr = document.getElementById(emp_addr);
	if (!checkEmpAddr()) {
		alert('请输入地址,2到30字!');
		emp_addr.focus();
	}
}

function checkEmpEmail() {
	var reg = /^([a-zA-Z0-9_-])+@[a-zA-Z0-9_-]+((\.[a-z]{2,3}){1,2})$/;
	var emp_email = document.getElementById(emp_email);
	if (!reg.test(emp_email.value)) {
		alert('请输入正确格式Email!');
		return false;
	} else {
		return true;
	}
}

function checkAll() {
	var emp_name = document.getElementById(emp_name);
	var addEmployeeForm = document.getElementById(addEmployeeForm);
	if (!checkEmpName() || !checkEmpTelNum() || !checkEmpAddr()
			|| !checkEmpEmail()) {
		alert('请输入信息');
		emp_name.focus();
	} else {
		addEmployeeForm.submit();
	}
}

function deleteInformation(currentPage,emp_no) {
	var a = confirm('确定删除？');
	var page = currentPage;
	var no = emp_no;
	alert(a);
	if(a){		
		location.href="../employee/delete.do?currentPage="+page+"&emp_no="+no;
	}

	return false;
}

function modifyEmployee(emp_id,emp_no,emp_name,emp_tel_num,emp_addr,emp_email){
	var str = "<div class='addInput'>" +
			"<span>人员ID</span> <input type='text' class='input' name='emp_id' value='"+emp_id+"'></div>" +
					"<div class='addInput'>" +
					"<span>人员编号:</span> <input type='text' class='input' name='emp_no' value='"+emp_no+"'></div>" +
							"<div class='addInput'>" +
							"<span>人员名称</span> " +
							"<input type='text' class='input' name='emp_name'value='"+emp_name+"'></div>" +
							"<div class='addInput'>" +
							"<span>电话号码:</span> " +
							"<input type='text' class='input' name='emp_tel_num'value='"+emp_tel_num+"'></div>" +
							"<div class='addInput'>" +
							"<span>家庭住址:</span>" +
							" <input type='text' class='input' name='emp_addr'value='"+emp_addr+"'></div>" +
							"<div class='addInput'>" +
							"<span>邮箱:</span> " +
							"<input type='text' class='input' name='emp_email'value='"+emp_email+"'></div></div>" +
							"<div class='modal-footer'>" +
							"<div align='center'>" +
							"<button type='submit' class='btn btn-danger'>确定</button><button type='button' class='btn btn-default'data-dismiss='modal'>取消</button></div></div>";
	$("#modifyEmployeeModal").html(str);

}