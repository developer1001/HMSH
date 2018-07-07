/**
 * 用户登录,校验
 */
function login() {
    var name = $("#loginName").val();
    var pwd = $("#loginPwd").val();
    $.ajax({
        url:"login.do",
        method:"post",
        dataType:"json",
        data:{
            loginName:name,
            password:pwd,
        },
        success:function (data) {
            if (data.success){
                window.location.href="index.do";
            }
            else
                alert(data.msg);
    }
    })
}