<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fm" %>
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
         		 编辑员工档案
         		</div>
         		<div class="panel-body">
         			<fm:form modelAttribute="updateUser" class="form-horizontal" method="post" action="./user/updateUser" enctype="multipart/form-data">
					  <div class="col-md-2"><img style="width:100%;" src="${updateUser.photoUrl }"></div>
					  <div class="col-md-10">
						  <fm:hidden path="userId" />
						  <fm:hidden path="photoUrl" />
						  <div class="form-group">
						    <label class="col-sm-2 control-label">姓名：</label>
						    <div class="col-sm-8">
						      <fm:input path="name" class="form-control" required="required" name="name" placeholder="请输入员工姓名" />
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label class="col-sm-2 control-label">性别：</label>
						    <div class="col-sm-8">
						      <fm:radiobutton path="sex" name="sex" value="0" />女
						      <fm:radiobutton path="sex" name="sex" value="1"/>男
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label class="col-sm-2 control-label">年龄：</label>
						    <div class="col-sm-8">
						      <fm:input path="age" class="form-control" required="required" name="age" placeholder="请输入员工年龄" />
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label class="col-sm-2 control-label">职务：</label>
						    <div class="col-sm-8">
							    <fm:select path="post" name="post" class="form-control input-sm">
							    	<fm:option value="1">总经理</fm:option>
							    	<fm:option value="2">部门经理</fm:option>
							    	<fm:option value="3">组长</fm:option>
							    	<fm:option value="4">员工</fm:option>
							    </fm:select>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label class="col-sm-2 control-label">联系电话：</label>
						    <div class="col-sm-8">
						      <fm:input path="telephone" maxlength="11" required="required" class="form-control" name="telephone" placeholder="请输入联系电话" />
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label class="col-sm-2 control-label">部门：</label>
						    <div class="col-sm-8">
							    <fm:select path="department" name="department" class="form-control input-sm">
							    	<fm:option value="1">人资部</fm:option>
							    	<fm:option value="2">生产部</fm:option>
							    	<fm:option value="3">环安部</fm:option>
							    	<fm:option value="4">后勤部</fm:option>
							    	<fm:option value="5">保安队</fm:option>
							    </fm:select>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label class="col-sm-2 control-label">联系地址：</label>
						    <div class="col-sm-8">
						      <fm:input path="address" class="form-control" name="address" required="required" placeholder="请输入联系地址" />
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label class="col-sm-2 control-label">员工照片：</label>
						    <div class="col-sm-8">
						      <input type="file" name="img"  required="required">
						    </div>
						  </div>
						  
	 					  <div class="form-group">
	 					    <label class="col-sm-2 control-label">角色：</label>
	 					    <div class="col-sm-8">
	 					      <fm:select class="form-control" name="roleId" path="roleId" items="${roleList}" itemValue="roleId" required="required" itemLabel="roleName"/>	
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
						      <button id="addUserAll" type="submit" class="btn btn-primary" style="margin-right:20px;">保存更改员工信息</button>
						      <a id="removeUserAll" class="btn btn-warning" role="button">重新填写员工信息</a>
						    </div>
						  </div>
					  </div>
					</fm:form>
         		</div>
         	</div>
       	 </div>
       </div>
     </div>
     
     <script type="text/javascript">
     
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
			$("input[name='roleId']").val("");
			$("#inlineCheckbox1").removeAttr("checked");
			$("#inlineCheckbox2").removeAttr("checked");
			$("#inlineCheckbox3").removeAttr("checked");
		});
     </script>
</body>
</html>