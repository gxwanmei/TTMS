function checkEmpName() {
	var reg = /^[\u4e00-\u9fa5]{2,10}$/;
	var emp_name = document.getElementById('emp_name');
	if (!reg.test(emp_name.value)) {
		return false;
	} else {
		return true;
	}
}

function checkEmpNameOnFocus() {
	var emp_name = document.getElementById('emp_name');
	if (!checkEmpName()) {
		alert("请输入真实姓名,10字以内中文!");
		emp_name.focus();
	}
}

function checkEmpTelNum() {
	var reg = /^1[3-8][0-9]{9}$/;
	var emp_tel_num = document.getElementById('emp_tel_num');
	if (!reg.test(emp_tel_num.value)) {
		return false;
	} else {
		return true;
	}
}

function checkEmpTelNumOnFocus() {
	var emp_tel_num = document.getElementById('emp_tel_num');
	if (!checkEmpTelNum()) {
		alert("请输入11位正确手机号码!");
		emp_tel_num.focus();
	}
}

function checkEmpAddr() {
	var reg = /^[\u4e00-\u9fa5]{2,30}$/;
	var emp_addr = document.getElementById('emp_addr');
	if (!reg.test(emp_addr.value)) {
		return false;
	} else {
		return true;
	}
}

function checkEmpAddrOnfocus() {
	var emp_addr = document.getElementById('emp_addr');
	if (!checkEmpAddr()) {
		alert("请输入地址,2到30字!");
		emp_addr.focus();
	}
}

function checkEmpEmail() {
	var reg = /^([a-zA-Z0-9_-])+@[a-zA-Z0-9_-]+((\.[a-z]{2,3}){1,2})$/;
	var emp_email = document.getElementById('emp_email');
	if (!reg.test(emp_email.value)) {
		alert("请输入正确格式Email!");
		return false;
	} else {
		return true;
	}
}

function checkAll() {
	var emp_name = document.getElementById('emp_name');
	var addEmployeeForm = document.getElementById('addEmployeeForm');
	if (!checkEmpName() || !checkEmpTelNum() || !checkEmpAddr()
			|| !checkEmpEmail()) {
		alert("请输入信息");
		emp_name.focus();
	} else {
		addEmployeeForm.submit();
	}
}
function deleteInformation() {
	var a = confirm("确定删除？");
	if(a){
		return true;
	}
}