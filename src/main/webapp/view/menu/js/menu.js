function saveOrUpdate(data){
	if(data.node_id != ''){
		//编辑
		$.ajax({  
	         type : "POST",  
	         url : "/edit",
	         data : {
	        	 	 "id":data.node_id,
	           		 "menu_name":data.menu_name,
	           		 "remark":data.remark,
	           		 "pid":data.pid,
	           		 "url":data.url,
	           		 "type":data.type
	         },
	         success : function(result) { 
	        	window.location.reload();
	         }  
	     }); 
	}
	else if(data.node_id == null || data.node_id == ''){
		//新增
		console.log(data);
		$.ajax({  
	         type : "POST",  
	         url : "/create",
	         data : {
	           		 "menu_name":data.menu_name,
	           		 "remark":data.remark,
	           		 "pid":((data.pid == '') ? 0 : data.pid),
	           		 "url":data.url,
	           		 "type":data.type
	         },
	         success : function(result) { 
	        	window.location.reload();
	         }  
	     }); 
	}
}

function deleteNode(node_id){
	if(node_id != null && node_id != undefined && node_id != ''){
		$.ajax({  
	         type : "POST",  
	         url : "/delete",
	         data : {
	        	 	 "ids":node_id,	           		
	         },
	         success : function(result) { 
	        	window.location.reload();
	         }  
	     }); 
	}
}
