<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="${layPath}/css/layui.css"  media="all">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript">
function edit(data){
	 $.ajax({  
         type : "POST",  
         url : "/edit",
         data : {
        	 	 "id":data.id,
           		 "name":data.name,
           		 "remark":data.remark
         },
         success : function(result) { 
        	window.parent.location.reload();
         }  
     });  
}
</script>
<body>
<script src="${layPath}/layui.js"></script>
<form class="layui-form" action="">
<div class="layui-form-item" style="display: none">
    <label class="layui-form-label">ID</label>
    <div class="layui-input-block">
      <input type="text" name="ID" placeholder="" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">菜单库名称</label>
    <div class="layui-input-block">
      <input type="text" name="name" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">备注</label>
    <div class="layui-input-block">
      <textarea name="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="form2">立即提交</button>
      <button type="reset"  class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form> 
<script>
//Demo
layui.use('form', function(){
  var form = layui.form;
  
  //监听提交
  form.on('submit(form2)', function(data){
    //layer.msg(JSON.stringify(data.field));
    edit(data.field);
    return false;
  });
});
</script>
</body>
</html>