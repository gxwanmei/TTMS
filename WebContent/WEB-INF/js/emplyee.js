function checkEmpName()
{
    var reg=/^[\u4e00-\u9fa5]{2,10}$/;
    var emp_name=document.getElementById('emp_name');
    if(!reg.test(emp_name.value))
    {
        alert("请输入真实姓名,10字以内中文!");
        emp_name.focus();
        return false;
    }
    else
    {
        return true;
    }
}
function checkEmpTelNum()
{
    var reg=/^1[3-8][0-9]{9}$/;
    var emp_tel_num=document.getElementById('emp_tel_num');
    if(!reg.test(emp_tel_num.value))
    {
        alert("请输入11位正确手机号码!");
        emp_tel_num.focus();
        return false;
    }
    else
    {
        return true;
    }
}
function checkEmpAddr()
{
    var reg=/^.{2,30}$/;
    var emp_addr=document.getElementById('emp_addr');
    if(!reg.test(emp_addr.value))
    {
        alert("请输入地址,2到30字!");
        emp_addr.focus();
        return false;
    }
    else
    {
        return true;
    }
}
function checkEmpEmail()
{
    var reg=/^([a-zA-Z0-9_-])+@[a-zA-Z0-9_-]+((\.[a-z]{2,3}){1,2})$/;
    var emp_email=document.getElementById('emp_email');
    if(!reg.test(emp_email.value))
    {
        alert("请输入正确格式Email!");
        emp_email.focus();
        return false;
    }
    else
    {
        return true;
    }
}
function checkAll()
{
    if(!checkEmpName() || !checkEmpTelNum() || !checkEmpAddr() || !checkEmpEmail())
        return false;
    else
        return true;
}
function deleteInformation(Emp_id){
    //var a = confirm("确定删除？");
//	document.getElementById("id").value=Emp_id;
//	document.form.action="../ServletFour";
//	document.form.submit();
}