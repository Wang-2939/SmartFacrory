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
         <div class="col-md-10 a">
         	<div class="panel panel-default">
         		<div class="panel-heading">修改密码------<span>${name}</span></div>
         		<div class="panel-body" style="padding: 0;">
         			<div class="panel-body">
         				<form class="form-horizontal">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">请输入原密码</label>
						    <div class="col-sm-8">
						      <input type="password" class="form-control" id="oldPwd" placeholder="原密码">
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="col-sm-2 control-label">请输入修改密码</label>
						    <div class="col-sm-8">
						      <input type="password" class="form-control" id="newPwd" placeholder="修改密码">
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="col-sm-2 control-label">请确认修改密码</label>
						    <div class="col-sm-8">
						      <input type="password" class="form-control" id="rePwd" placeholder="确认密码">
						    </div>
						  </div>
						  <div class="form-group">
						    <div class="col-sm-offset-2 col-sm-8">
						      <button id="btnOk" type="button" class="btn btn-default">确认修改</button>
						    </div>
						  </div>
						</form>
         			</div>
         		</div>
         	</div>
         </div>
       </div>
     </div>
     
	<script type="text/javascript">
		$(function(){
			$("#btnOk").click(function(){
				$.post("./user/oldPwdIsOk",{pwd:$("#oldPwd").val()},function(data){
					if(data==true){
						if($("#newPwd").val().length>0){
							if($("#newPwd").val()==$("#rePwd").val()){
								$.post("./user/updatePwd",{pwd:$("#rePwd").val()},function(data){
									if(data>0){
										alert("修改密码成功");
										$("#oldPwd").val("");
										$("#newPwd").val("");
										$("#rePwd").val("");
									}
								})
							}else{
								alert("两次输入密码不一致");
							}
						}else{
							alert("新密码不能为空");
						}
					}else{
						alert("原密码输入错误，请重新输入");
					}
				})
			})
		});
	</script>
</body>
</html>