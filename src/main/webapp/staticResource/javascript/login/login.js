$(function () {
    $("body").keydown(function() {
        if (event.keyCode == "13") {//keyCode=13是回车键
            $('#loginBtn').click();
        }
    });
})

/**
 * 用户登录,校验
 */
function login() {
    var name = $("#loginName").val();
    var pwd = $("#loginPwd").val();
    $.ajax({
        url:"../login.do",
        method:"post",
        dataType:"json",
        data:{
            loginName:name,
            password:pwd,
        },
        success:function (data) {
            if (data.success){
                var loginUser = {};
                loginUser.Id = data.data.id;
                loginUser.loginName = data.data.loginName;
                loginUser.userName = data.data.userName;
                localStorage.setItem("loginUser",JSON.stringify(loginUser));
                window.location.href="../index.do";
            }
            else
                alert(data.msg);
    }
    })
}
