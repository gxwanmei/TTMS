function checkName(){
 var reg=/^[\u4e00-\u9fa5]{2,10}$/;
    var name=document.getElementById('name');
    if(!reg.test(name.value))
    {
        alert("请输入10字以内中文!");
        name.focus();
        return false;
    }
    else
    {
        return true;
    }
}
function checkStartTime(){
    var reg=/^(([1-9]{1})|([0-1][0-9])|([1-2][0-3])):([0-5][0-9])$/;
    var time=document.getElementById('startTime');
    if(!reg.test(time.value))
    {
        alert("请输入正确格式的时间!");
        time.focus();
        return false;
    }
    else
    {
        return true;
    }
}
function checkEndTime(){
    var reg=/^(([1-9]{1})|([0-1][0-9])|([1-2][0-3])):([0-5][0-9])$/;
    var time=document.getElementById('endTime');
    if(!reg.test(time.value))
    {
        alert("请输入正确格式的时间!");
        time.focus();
        return false;
    }
    else
    {
        return true;
    }
}
function checkAll()
{
    if(!checkName() || !checkStartTime() || !checkEndTime())
        return false;
    else
        return true;
}
function deleteInformation(){
    var a = confirm("确定删除？");
}