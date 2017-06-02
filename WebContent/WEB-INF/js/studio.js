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
function checkAll()
{
    if(!checkName())
        return false;
    else
        return true;
}
function deleteInformation(){
    var a = confirm("确定删除？");
}
