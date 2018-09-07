<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    pageContext.setAttribute("path",path);
    String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 
    	request.getServerPort()+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>"> 
<title>My JSP 'success.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="${path}/sdp2/plugins/zTree_v3/css/demo.css" type="text/css"></link>
<link rel="stylesheet" href="${path}/sdp2/plugins/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css"></link>
<link rel="stylesheet" href="${layPath}/css/layui.css"  media="all">
<script type="text/javascript" src="${path}/sdp2/plugins/zTree_v3/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${path}/sdp2/plugins/zTree_v3/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${path}/sdp2/plugins/zTree_v3/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="${path}/sdp2/plugins/zTree_v3/js/jquery.ztree.exedit.js"></script>
<script type="text/javascript" src="${path}/sdp2/menu/js/menu.js"></script>
<SCRIPT type="text/javascript">
  var setting = {
		  view: {
              dblClickExpand: false,
              showLine: true,
              selectedMulti: false
          },
         data : {
                  key : {
                         name : "name"
                  },
                  simpleData : {
                         enable : true
                  }
         }
         ,callback:{
        	 onClick: zTreeOnClick,
         }
         ,treeNode:{
        	 target:""
         }
    };
         
  function setTitle(node) {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            var nodes = node ? [ node ] : zTree.transformToArray(zTree.getNodes());
            for ( var i = 0, l = nodes.length; i < l; i++) {
                     var n = nodes[i];
                     n.title = "[" + n.id + "] isFirstNode = " + n.isFirstNode
                                        + ", isLastNode = " + n.isLastNode;
                     zTree.updateNode(n);
           }
  }

  function count() {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo"), 
            hiddenCount = zTree.getNodesByParam("isHidden", true).length;
            $("#hiddenCount").text(hiddenCount);
  }

  function showNodes() {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo"), 
            nodes = zTree.getNodesByParam("isHidden", true);
            zTree.showNodes(nodes);
            setTitle();
            count();
  }
   function hideNodes() {
             var zTree = $.fn.zTree.getZTreeObj("treeDemo"), 
             nodes = zTree.getSelectedNodes();
             if (nodes.length == 0) {
                      alert("请至少选择一个节点");
                     return;
             }
             zTree.hideNodes(nodes);
             setTitle();
             count();
   }
   
   //树节点的点击事件
   function zTreeOnClick(event, treeId, treeNodes) {
      var valuess = "id="+ treeNodes.id + ", name=" + treeNodes.name + ",pId=" + treeNodes.pId;       
       //console.log(valuess);
	//formTest 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
	 layui.form.val("formTest", {
	   "node_id": treeNodes.id // "name": "value"
	   ,"pid": treeNodes.pId
	   ,"menu_name": treeNodes.name
	   ,"url": treeNodes.url_
	   ,"remark": treeNodes.remark
	 });
	 findNodes(treeNodes);
   };
   
   /*查找当前节点下一级的子节点数*/
   function findNodes(treeNode)
   {
       var count;
       /*判断是不是父节点,是的话找出子节点个数，加一是为了给新增节点*/
       if(treeNode.isParent) {
           count = treeNode.children.length + 1 ;
       } else {
           /*如果不是父节点,说明没有子节点,设置为1*/
           count = 1;
       }
       //包括此节点在内的节点数目记录下来，即需要知道有无子节点
       layui.form.val("formTest", {
    	   "node_size": count // "name": "value"
    	 });
   }
   
      //从后台读取数据用来保存结点的数组
     var treeNodes = [];
      //一切准备好后初始化树
   $(document).ready(function() {
	   //菜单库类型赋值，每次弹窗后值不再变
	   $("#menu-type").val(localStorage.menu_type);
     //初始化zNodes数组——treeNodes
 		$(function() {
         //从后台获取json串的连接
         var url = "service/treeMenu/list";                          
         //right是从session获取并保存在jsp页面body中的一个hidden标签中
        // var libId = document.getElementById("libId").value;
         $.ajax({
                  url : url,
                  type : 'post',
                  //这个是传到后台的数据，后台就是根据它获取zTree结点信息的，它是一个json格式的串
                  data : {"libId" : localStorage.menu_type},
                  async : false,
                  success : function(data) {
                      //这个data是ajax传回的数据一个json串
  /*
  json串={"right":
 [{"id":"1","isHidden":0,"name":"公司","open":1,"pId":"0","target":"","title":"","url":""},

     {"id":"11","isHidden":0,"name":"超级管理员","open":0,"pId":"1","target":"mainF","title":"","url":""},

     {"id":"111","isHidden":0,"name":"显示报表","open":0,"pId":"11","target":"mainF","title":"","url":"http:"},

     {"id":"112","isHidden":0,"name":"管理用户","open":0,"pId":"11","target":"mainF","title":"","url":"http:"}]}
      */
        var msg = data;
        //遍历
        $.each(msg, function(i, item) {
           //此处i=right
           //item是json串的后半部分
           $.each(item,function(ii,iit){//遍历json数据（对我们有用的——树的节点的所有信息）
           /* treeNodes.push({"id":iit.id,"name":iit.menu_name,"pId":iit.pid,"url":iit.url,"target":iit.target}); */
           	treeNodes.push({"id":iit.id,"name":iit.menu_name,"pId":iit.pid,"url_":iit.url,"remark":iit.remark});
           });
        });
      }
   });
});                 

     //一下是初始化zTree的函数
     //但$("#treeDemo")中的treeDemo是要存放zTree的div的id
     $.fn.zTree.init($("#treeDemo"), setting, treeNodes);
    /*  $("#hideNodesBtn").bind("click", {type : "rename"}, hideNodes);
     $("#showNodesBtn").bind("click", {type : "icon"}, showNodes); */
   	 setTitle();
     count();
   //  zTreeBeforeClick();
    });
</script>

</head>
<body>
 <div style="width:100% ;height:90%">
    <div style="width:20% ;height:100%;float: left">                  
         <%--这就是要摆放zTree的地方--%>
         <div class="zTreeDemoBackground left">
              <ul id="treeDemo" class="ztree"></ul>
         </div>
    </div> 
    <!--ztree结束  --> 
           
 <div class="rightDiv" style="border:1px solid gray;width:65%;height:90%;float: left">
    <script src="${layPath}/layui.js"></script>
    
    <div class="demoTable">
	 <button class="layui-btn" data-method="addNew" data-type="auto" class="layui-btn layui-btn-normal">
	  <i class="layui-icon">&#xe608;</i>添加节点
	</button>
	<button class="layui-btn" data-method="deleteNode" data-type="auto" class="layui-btn layui-btn-normal">
	   <i class="layui-icon">&#xe640;</i>删除节点
	</button>
	</div>
    
	<form class="layui-form" lay-filter="formTest" action="">
	<div class="layui-form-item" style="display: none">
    <label class="layui-form-label">节点id</label>
    <div class="layui-input-block">
      <input type="text" name="node_id" id="nodeid" readonly="readonly"  placeholder="" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item" style="display: none">
    <label class="layui-form-label">父节点id</label>
    <div class="layui-input-block">
      <input type="text" name="pid" readonly="readonly"   autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">节点名称</label>
    <div class="layui-input-block">
      <input type="text" name="menu_name" required  lay-verify="required" placeholder="请输入节点名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item" style="display: none">
    <label class="layui-form-label">所属菜单库</label>
    <div class="layui-input-block">
      <input type="text" name="type" id="menu-type" readonly="readonly" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">跳转地址</label>
    <div class="layui-input-block">
      <input type="text" name="url" required  lay-verify="required" placeholder="请输入跳转地址" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">备注</label>
    <div class="layui-input-block">
      <textarea name="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
  </div>
  
    <div class="layui-form-item" style="display: none">
    <label class="layui-form-label">自身加子节点的数目</label>
    <div class="layui-input-block">
      <input type="text" name="node_size" readonly="readonly" id="node_size" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
    </div>
  </div>
</form>
	<script>
	//Demo
	layui.use('form', function(){
	  var form = layui.form;
	  
	  //监听提交
	  form.on('submit(formDemo)', function(data){
	    //layer.msg(JSON.stringify(data.field));
	    saveOrUpdate(data.field);
	    return false;
	  });
	  
	  var $ = layui.$, active = {
	  addNew: function(othis){
		  //选中的子节点成为父节点
		  var idToPid = $("#nodeid").val();
		  if(idToPid){
		  //添加子节点		 
		    form.val("formTest", {
			   "node_id": '' // "name": "value"		   
			   ,"menu_name": ''
			   ,"pid":idToPid
			   ,"url": ''
			   ,"remark": ''
		 	});  
		  }
		  else{
		  //添加根节点		 
		    form.val("formTest", {
			   "node_id": '' // "name": "value"		   
			   ,"menu_name": ''
			   ,"pid":''
			   ,"url": ''
			   ,"remark": ''
		 	}); 
		  }
	 	layer.msg('请录入信息后提交', {
		     time: 1000, //1s后自动关闭
		 });	 	
	  }
	  ,deleteNode: function(othis){
		  console.log($(""));
		  if($("#node_size").val() == 1){
			  layer.confirm("确认要删除吗，删除后不能恢复", { title: "删除确认" }, function(index){
		    	  //执行删除方法 	    	  
				deleteNode($("#nodeid").val());
		      });
		  }
		  else if($("#node_size").val() > 1){
			  layer.msg('删除失败：有子节点存在', {
				     time: 1000, //1s后自动关闭
				 });
		  }
		  else {
			  layer.msg('请先选中一个节点', {
				     time: 1000, //1s后自动关闭
				 });
		  }
	      
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
    </div>
 </div>    
</body>
</html>