<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>Insert title here</title>

<style>
	.row{
			background-image:url(img/gybj6.png);
			background-size:cover;
			background-position: bottom left 90px;
		}
</style>
</head>
<body>
 <div class="container-fluid">
    <%@ include file="header.jsp" %>
    <div class="row">
        <%@ include file="menu.jsp" %>
        <div class="col-md-10">
           <div class="panel panel-default">
             <div class="panel-heading">角色管理</div>
               <div class="panel-body">
                 <div class="text-right" style="margin-bottom:10px;">
                    <button class="btn btn-primary" data-toggle="modal" data-target="#addModal">
                                                        添加角色
                    </button>
                 </div>
                 
					<!-- 添加角色 -->
                 <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="exampleModalLabel">添加角色</h4>
				      </div>
				      <div class="modal-body">
				        <form>
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">角色名称:</label>
				            <input type="text" class="form-control" id="roleName">
				          </div>
				          <div class="form-group">
				            <label for="message-text" class="control-label">角色备注:</label>
				            <textarea class="form-control" id="remark"></textarea>
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				        <button id="addRole" type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
				      </div>
				    </div>
				  </div>
                </div>
                
				<!--编辑角色 -->
                 <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="exampleModalLabel">编辑角色</h4>
				      </div>
				      <div class="modal-body">
				        <form>
				          <input type="hidden" id="roleIdUpdate" />
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">角色名称:</label>
				            <input type="text" class="form-control" id="roleNameUpdate">
				          </div>
				          <div class="form-group">
				            <label for="message-text" class="control-label">角色备注:</label>
				            <textarea class="form-control" id="remarkUpdate"></textarea>
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				        <button id="updateRole" type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
				      </div>
				    </div>
				  </div>
                </div>
                
				<!--权限分配 -->
                <div class="modal fade" id="menuModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="exampleModalLabel">权限分配---<span id="roleNameMenu"></span></h4>
				      </div>
				      <input type="hidden" id="roleIdMenu" />
				      <div id="roleMenuBody" class="modal-body">
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				        <button id="roleMenuBtn" type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
				      </div>
				    </div>
				  </div>
                </div>
                
				<!--人员档案管理 -->
                 <table  id="shuju" class="table table-bordered table-condensed">
                    
                 </table>
                 
               </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
   function refresh(){
	   $.post("./role/getRole",null,function(data){
			  $("#shuju").html("");
			  var title="<tr><th>角色编号</th><th>角色名称</th><th>备注</th><th>操作</th></tr>";
				$("#shuju").append(title);
			  for(var i=0;i<data.length;i++){
				  var line="<tr>"
				         +"<td>"+data[i].roleId+"</td>"
				         +"<td>"+data[i].roleName+"</td>"
				         +"<td>"+data[i].remark+"</td>"
				         +"<td><button class='btn btn-danger' onclick=delRole("+data[i].roleId+")>删除</button>"
				         +"<button class='btn btn-info' style='margin-left:10px;' data-toggle='modal' data-target='#updateModal' onclick=updateRole("+data[i].roleId+",'"+data[i].roleName+"','"+data[i].remark+"')>编辑</button>"
				         +"<button class='btn btn-primary' style='margin-left:10px;' data-toggle='modal' data-target='#menuModal' onclick=menuRole("+data[i].roleId+",'"+data[i].roleName+"')>权限</button></td>"
				         +"</tr>";
				  $("#shuju").append(line);
			  }			  
		  })
   }
   function updateRole(id,name,remark){
	   
	  $("#roleIdUpdate").val(id); 
	  $("#roleNameUpdate").val(name); 
	  $("#remarkUpdate").val(remark); 
	   
   }
   
   //删除角色
   function delRole(id){
	   if(confirm("确定要删除该员工吗？")){
		   if(id==1){
			   alert("删除失败，不可删除系统管理员");
		   }else{
			   $.post("./role/delRole",{roleId:id},function(data){
			    	if(data>0){
						refresh(); 				  
					}else{
						alert("删除失败");
					}	
						 		  
				})
		   }
	   }  
   }
 
 //角色权限
	  function menuRole(id,name){
		 $("#roleIdMenu").val(id)
		 $("#roleNameMenu").html(name)	
		 $.post("./home/getChildMenu",null,function(data){
			  $("#roleMenuBody").html("");
			  var arr=[];
			  $.post("./role/getRoleMenu",{roleId:id},function(roleMenuData){
				  for(var j=0;j<roleMenuData.length;j++){
					  arr.push(roleMenuData[j].menuId);
				  }
				  for(var i=0;i<data.length;i++){
					  if(arr.indexOf(data[i].menuId)>-1){
						  var line="<div style='width:150px;height:30px;display:inline-block'><input type='checkbox' checked='true' name='menus' value='"+data[i].menuId+"'>"+data[i].menuName+"</input></div>";
						  $("#roleMenuBody").append(line);
					  }else{
						  var line="<div style='width:150px;height:30px;display:inline-block'><input type='checkbox' name='menus' value='"+data[i].menuId+"'>"+data[i].menuName+"</input></div>";
						  $("#roleMenuBody").append(line);
					  }
					  
				  }	
			  })
			  		  
		  })
	 }
 
 
  $(function(){ 
	  //添加角色
	  $("#addRole").click(function(){
		  $.post("./role/addRole",{roleName:$("#roleName").val(),remark:$("#remark").val()},function(data){
			  if(data>0){
				  refresh(); 				  
			  }else{
				  alert("添加失败");
			  }			  
		  })
		  
	  });	
	  
	  //编辑角色
	  $("#updateRole").click(function(){
		  $.post("./role/updateRole",{roleId:$("#roleIdUpdate").val(),roleName:$("#roleNameUpdate").val(),remark:$("#remarkUpdate").val()},function(data){
			  if(data>0){
				  refresh(); 				  
			  }else{
				  alert("更改失败");
			  }			  
		  })
	  });
		  
	  
	  //权限分配
	  $("#roleMenuBtn").click(function(){
		  var ids="";
		  $("input:checkbox[name=menus]").each(function(){
			  if(this.checked){
				  ids+= $(this).val()+",";
			  }
		  })
		  //截取字符串，起始位置（从0开始）,终止位置（终止位置对应的字符不包括）
		  ids=ids.substring(0,ids.length-1);
		  
		  $.post("./role/updateRoleMenu",{roleId:$("#roleIdMenu").val(),menuIds:ids},function(data){
			  if(data>0){
				  refresh(); 				  
			  }else{
				  alert("更改权限失败");
			  }			  
		  })
	  })
	  refresh();
	  
  });
  
</script>

</body>
</html>