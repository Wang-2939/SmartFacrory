<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
         <div class="col-md-10 a">
         	<div class="panel panel-default">
         		<div class="panel-heading">
         			添加员工档案
         		</div>
         		<div class="panel-body">
         			<form class="form-horizontal" method="post" action="./user/addUser" enctype="multipart/form-data">
					  <div class="form-group">
					    <label class="col-sm-2 control-label">姓名：</label>
					    <div class="col-sm-8">
					      <input type="text" class="form-control" name="name" required placeholder="请输入员工姓名">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label class="col-sm-2 control-label">性别：</label>
					    <div class="col-sm-8">
					      <input type="radio" name="sex" value="0" />女
					      <input type="radio" name="sex" value="1" checked="checked"/>男
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label class="col-sm-2 control-label">年龄：</label>
					    <div class="col-sm-8">
					      <input type="number" class="form-control" name="age" required placeholder="请输入员工年龄">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label class="col-sm-2 control-label">职务：</label>
					    <div class="col-sm-8">
						    <select name="post" class="form-control input-sm">
						    	<option value="1">总经理</option>
						    	<option value="2">部门经理</option>
						    	<option value="3">组长</option>
						    	<option value="4">员工</option>
						    </select>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label class="col-sm-2 control-label">联系电话：</label>
					    <div class="col-sm-8">
					      <input type="text" maxlength="11" class="form-control" name="telephone" required placeholder="请输入联系电话">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label class="col-sm-2 control-label">部门：</label>
					    <div class="col-sm-8">
						    <select name="department" class="form-control input-sm">
						    	<option value="1">人资部</option>
						    	<option value="2">生产部</option>
						    	<option value="3">环安部</option>
						    	<option value="4">后勤部</option>
						    	<option value="5">保安队</option>
						    </select>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label class="col-sm-2 control-label">联系地址：</label>
					    <div class="col-sm-8">
					      <input type="text" class="form-control" name="address" required placeholder="请输入联系地址">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label class="col-sm-2 control-label">员工照片：</label>
					    <div class="col-sm-8">
					      <input type="file" name="img" required>
					    </div>
					  </div>
					  
 					  <div class="form-group">
 					    <label class="col-sm-2 control-label">角色：</label>
 					    <div class="col-sm-8">
 					      <select id="role" name="roleId" required class="form-control input-sm">
						    	
						  </select>
 					    </div>
 					  </div>
					  <div class="form-group">
					  	<div class="col-sm-offset-2 col-sm-8">
						  	<label class="checkbox-inline">
							  <input type="checkbox" id="inlineCheckbox1" value="1"> 该员工已通过公司员工体检
							</label>
							<label class="checkbox-inline">
							  <input type="checkbox" id="inlineCheckbox2" value="2"> 该员工已通过公司考核
							</label>
							<label class="checkbox-inline">
							  <input type="checkbox" id="inlineCheckbox3" value="3"> 该员工已和公司完成合同签署
							</label>
						</div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-8">
					      <button id="addUserAll" type="submit" class="btn btn-primary" style="margin-right:20px;">提交新员工信息</button>
					      <a id="removeUserAll" class="btn btn-warning" role="button">清空新员工信息</a>
					    </div>
					  </div>
					</form>
         		</div>
         	</div>
       	 </div>
       </div>
     </div>
     
     <script type="text/javascript">

     	$(function(){
     		$("input[name='name']").blur(function(){
     	    	 $.post("./user/getUserByName",{name:$("input[name='name']").val()},function(data){
     	    		 if(data>0){
     	    			 alert("已有此员工，请核实后输入");
     	    			 $("input[name='name']").val("");
     	    		 }
     	    	 })
     	     });
     		
     		$.post("./role/getRole",null,function(data){
	     		for(var i=0;i<data.length;i++){
	     			var option="<option value='"+data[i].roleId+"'>"+data[i].roleName+"</option>"
	     			$("#role").append(option)
	     		}
	     	})	
			
	     	//清空信息
			$("#removeUserAll").click(function(){
				$("input[name='name']").val("");
				$("input[name='sex']").removeAttr("checked");
				$("input[name='age']").val("");
				$("input[name='post']").val("");
				$("input[name='telephone']").val("");
				$("input[name='department']").val("");
				$("input[name='address']").val("");
				$("input[name='img']").val("");
				$("#inlineCheckbox1").removeAttr("checked");
				$("#inlineCheckbox2").removeAttr("checked");
				$("#inlineCheckbox3").removeAttr("checked");
			});
	     	
     	})
     </script>
</body>
</html>