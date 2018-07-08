$(function () {
   getAuth();
})

/**
 * 获取登录用户角色的所有菜单或权限
 */
function getAuth() {
    $.ajax({
        url:"getAuth.do",
        method:"post",
        dataType:"json",
        data:{
        },
        success:function (data) {
            if (data.success){
                var loginUser = JSON.parse(localStorage.getItem("loginUser"));
                $(".hidden-xs").html(loginUser.userName);
                $(".user-panel").children("div:eq(1)").children("p:eq(0)").html(loginUser.userName);
            }
            else
                alert("菜单信息获取失败，请重新登录");
        }
    })
}