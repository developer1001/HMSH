<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="${layPath}/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body> 
 
<div class="demoTable">
  菜单库名：
  <div class="layui-inline">
    <input class="layui-input" name="id" id="demoReload" autocomplete="off">
  </div>
  <button class="layui-btn" data-type="reload">搜索</button>
 <button class="layui-btn" data-method="addNew" data-type="auto" class="layui-btn layui-btn-normal">
  <i class="layui-icon">&#xe608;</i>添加库
</button>
</div>

<table class="layui-hide" id="LAY_table_user" lay-filter="menuLib"></table> 

</script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-xs" lay-event="config">配置</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>  
</script>       
<script src="${layPath}/layui.js"></script>
<script type="text/javascript" src="/xcrx-sdp2-web/sdp2/plugins/jquery/jquery-1.12.4.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['layer', 'form','table'], function(){
  var table = layui.table;
  var form = layui.form;
  //方法级渲染
  table.render({
    elem: '#LAY_table_user'
    ,url: '/xcrx-sdp2-web/service/menuLib/list'
    ,toolbar: '#toolbarDemo'
    ,cols: [[
      {checkbox: true, fixed: true}
      ,{field:'id', title: 'id', width:100}
      ,{field:'name', title: '菜单库名称', width:400}
      ,{field:'remark', title: '备注', width:400}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:250}
    ]]
    ,id: 'testReload'
    ,page: true
    ,height: 315
  });

  
//监听表格复选框选择
  table.on('checkbox(menuLib)', function(obj){
    //console.log(obj)
  });
  //监听工具条
  table.on('tool(menuLib)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
      //layer.msg('ID：'+ data.ID + ' 的查看操作');
      layer.alert(JSON.stringify(data));
    } else if(obj.event === 'del'){
      layer.confirm("警告：本库下所有菜单将删除，请谨慎！", { icon: 2,title: "警告" }, function(index){
    	  //执行删除方法    	
        obj.del();
        layer.close(index);
        $.post("/xcrx-sdp2-web/service/menuLib/delete", { ids: data.id }, function (data) {
        	location.reload();
        })
      });
    } else if(obj.event === 'edit'){
    	layer.open({
            type: 2,
            title: '修改信息',
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['893px', '600px'],
            content: '/xcrx-sdp2-web/sdp2/menu/editMenuLib.jsp',
            success: function(layero, index){
                var body = layer.getChildFrame('body', index);
                var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
               // console.log(body.html()) //得到iframe页的body内容
                //body.find('input').val('Hi，我是从父页来的')
                $(body).find("input").eq(0).val(data.id);
                $(body).find("input").eq(1).val(data.name);
                $(body).find("textarea").eq(0).val(data.remark);
              }
 });
      
    }else if(obj.event === 'config'){
    	localStorage.menu_type = data.id;
    	layer.open({
            type: 2,
            title: '配置菜单节点',
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['1300px', '600px'],
            content: '/xcrx-sdp2-web/sdp2/menu/menu_config.jsp',
            success: function(layero, index){
                var body = layer.getChildFrame('body', index);
                var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
               // console.log(body.html()) //得到iframe页的body内容
               // $(body).find("input").eq(3).val(data.type);               
              }
 });
      
    }
  });
  
  
  var $ = layui.$, active = {
		    reload: function(){
		      var demoReload = $('#demoReload');
		      
		      //执行重载
		      table.reload('testReload', {
		        page: {
		          curr: 1 //重新从第 1 页开始
		        }
		        ,where: {
		         /*  key: { */
		          name: demoReload.val()
		         /*  } */
		        }
		      });
		    }
  ,addNew: function(othis){
      var type = othis.data('type')
      ,text = othis.text();     
      layer.open({
        type: 2
        ,area: ['1000px', '600px']
        ,title:"添加新库"
        ,maxmin: true
        ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
        ,id: 'layerDemo'+type //防止重复弹出
        ,content: '/xcrx-sdp2-web/sdp2/menu/addMenuLib.jsp'
        ,btnAlign: 'c' //按钮居中
        ,shade: 0 //不显示遮罩
        ,yes: function(){
          layer.closeAll();
        }
      });
  }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
    var othis = $(this), method = othis.data('method');
    active[method] ? active[method].call(this, othis) : '';
  });
  
});
</script>

</body>
</html>        