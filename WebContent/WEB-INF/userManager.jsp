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
<link rel="stylesheet" type="text/css" href="jquery.page.css"/>
<style>
	.row{
			background-image:url(img/gybj6.png);
			background-size:cover;
			background-position: bottom left 90px;
		}
	.first, .last{
		width:40px;
	}
	.panel-body{
		height:480px;
	}
	#page{
		position: absolute;
	    bottom: 3%;
	    left: 50%;
	    margin-left: -120px;
	}
	#addUser{
		display:inline-block;
		width:82px;
		height:30px;
		background-color:#337ab7;
		border-radius: 4px;
		color:white;
		text-align:center;
		line-height:30px;
		position:absolute;
		right: 33px;
    	top: 52px;
	}
	#addUser:hover{
		text-decoration:none;
		background-color:#1b4d77;
	}
/* 	.btn{ */
/* 		padding: 3px 12px; */
/* 	} */
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
         			员工档案管理
         		</div>
         		<div class="panel-body">
         			<form class="form-inline" style="height:40px;margin-top: -5px;">
					  <div class="form-group">
					    <label for="department">部门：</label>
					    <select class="form-control input-sm">
					    	<option value="0">请选择部门</option>
					    	<option value="1">人资部</option>
					    	<option value="2">生产部</option>
					    	<option value="3">环安部</option>
					    	<option value="4">后勤部</option>
					    	<option value="5">保安队</option>
					    </select>
					  </div>
					  <div class="form-group input-sm">
					    <label for="name">姓名：</label>
					    <input type="text" class="form-control input-sm" id="name" placeholder="请输入姓名" style="margin-top:-5px;">
					  </div>
					  <button id="SelectBtn" type="button" class="btn btn-primary input-sm" style="text-align:center;line-height:15px;">点此查询</button>
					  
					  <a id="addUser" href="./user/toAddUser">添加新员工</a>
					</form>
					<table id="shuju" class="table table-bordered table-condensed">
						
					</table>
					<div id="page">
					</div>
					
         		</div>
         	</div>
         </div>
       </div>
     </div>
     
    <script type="text/javascript" src="jquery.page.js"></script>
	<script type="text/javascript">
		function realSex(sex){
			if(sex==0){
				return "女"
			}else{
				return "男"
			}
		}
		
		function realPost(post){
			if(post==1){
				return "总经理"
			}else if(post==2){
				return "部门经理"
			}else if(post==3){
				return "组长"
			}else if(post==4){
				return "员工"
			}
		}
		
		function realDepartment(department){
			if(department==1){
				return "人资部"
			}else if(department==2){
				return "生产部"
			}else if(department==3){
				return "环安部"
			}else if(department==4){
				return "后勤部"
			}else if(department==5){
				return "保安部"
			}
		}
		
	
		function showData(data){
			$("#shuju").html("");
			
			var title="<tr><th>姓名</th><th>性别</th><th>年龄</th><th>职务</th>"
				+"<th>入职日期</th><th>电话</th><th>部门</th><th>角色</th><th>编辑</th></tr>";
			$("#shuju").append(title);
			for(var i=0;i<data.list.length;i++){
				  var line="<tr>"
				         +"<td>"+data.list[i].name+"</td>"
				         +"<td>"+realSex(data.list[i].sex)+"</td>"
				         +"<td>"+data.list[i].age+"</td>"
				         +"<td>"+realPost(data.list[i].post)+"</td>"
				         +"<td>"+data.list[i].enteringTime+"</td>"
				         +"<td>"+data.list[i].telephone+"</td>"
				         +"<td>"+realDepartment(data.list[i].department)+"</td>"
				         +"<td>"+data.list[i].roleName+"</td>"
				         +"<td><button class='btn btn-danger' style='padding:0 5px;margin-right:5px;'  >删除</button>"
				         +"<a class='btn btn-info' style='padding:0 5px;margin-right:5px;' href='./user/toUpdateUser/"+data.list[i].userId+"'>编辑</a>"
				         +"</tr>";
				  $("#shuju").append(line);
			 }
		} 
		http://localhost:8080/SmartFactory/
		function delUser(id){
			if(confirm("确定要删除该员工吗？")){
				if(id==1){
					   alert("删除失败，不可删除系统管理员");
				   }else{
					   $.post("./user/delUser",{userId:id},function(data){
					    	if(data>0){
					    		$.post("./user/getUserList",{name:$("#name").val(),department:$("#department").val(),pageNum:1,pageSize:10},function(data){
									showData(data);
									loadPage(data.totalPage);
								});				  
							}else{
								alert("删除失败");
							}	
								 		  
						})
				   }
			}
		   
		   }
		
		function loadPage(totalPage){
			
			$("#page").Page({
				totalPages:totalPage,
				liNums:7,		//分页的数字按钮数 
				activeClass: 'activP', //类样式定义
				callBack:function(page){
					$.post("./user/getUserList",{name:$("#name").val(),department:$("#department").val(),pageNum:page,pageSize:10},function(data){
								showData(data);
							});
				}
			});
		}
		
		$(function(){
			$.post("./user/getUserList",{name:$("#name").val(),department:$("#department").val(),pageNum:1,pageSize:10},function(data){
						showData(data);
						loadPage(data.totalPage);
			});
			
			$("#SelectBtn").click(function(){
				$.post("./user/getUserList",{name:$("#name").val(),department:$("#department").val(),pageNum:1,pageSize:10},function(data){
					showData(data);
					loadPage(data.totalPage);
				});
			});
		});
	</script>
</body>
</html>