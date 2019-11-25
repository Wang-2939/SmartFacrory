<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
 String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="jquery-1.11.3.min.js"></script>
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.css">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">	
    <style type="text/css">
      body{
        background-color:#1c77ac;
        background-image:url(img/gybj4.jpg);
        background-size:cover;
        position:relative;
      }
      .row1{
      	position:relative;
      }
      .logo{
      	position:absolute;
        margin-top: 63.5%;
    	margin-left: 23%;
      }
      .col-md-offset-8{
      	margin-left: 51.333333%;
      	margin-top: 17.5%;
      }
      .bjDiv{
      	width:100%;
      	height:176px;
      	background-color: #89ade15c;
      	margin-top: -12.4%;
      	position: relative;
      	overflow: hidden;
      	z-index:-1;
      }
      .panel-primary > .panel-heading{
      	background-color: #071015;
      }
      .btn-primary{
      	background-color: #03080c;
      }
      .panel-footer{
      	background-color: #071015;
      }
      a{
      	color: #cecece;
      }
      .bjSpan{
    		display: inline-block;
    		width: 100%;
    		height:176px;
    		background-color: #c5c5c59e;
    		position: absolute;
    		left:-100%;
    		
    	}
    	.loading{
    		background-color: #0d2237;
    		width:448px;
    		height:178px;
    		position: absolute;
    		bottom: 40.6%;
    		left: 58.5%;
    		z-index:-1;
    	}
    	.loading p{
    		padding-top:20px;
    		padding-left:15px;
    	}
    	.loading p:nth-child(1){
    		font-size:20px;
    		color:lightgray;
    	}
    	.loading p:nth-child(2){
    		font-size:30px;
    		font-family: cursive;
    		color:white;
    	}
      @media screen and (max-width:1440px){
      	.logo{
	        margin-top: 63.5%;
	    	margin-left: 17%;
      	}
      	.col-md-offset-8{
	      	margin-left: 57.333333%;
	      	margin-top: 17.5%;
      	}
      	 .bjDiv{
	      	top:-238px;
	      	z-index:-1
      	}
      }
    </style>
  </head>  
  <body>
   <div class="container-fluid">
      <div class="row1">
        <div class="col-md-4 loginP">
           <img class="logo" src="img/logo.png">
        </div>
      </div>
      <div class="row">
         <div class="col-md-4 col-md-offset-8">
           <div class="panel panel-primary">
             <div class="panel-heading">
               <h4 class="panel-title">系统登录</h4>
             </div>
             <div class="panel-body">
               <form method="post" action="./login/doLogin">
                 <div class="form-group has-feedback">
                   <span class="glyphicon glyphicon-user form-control-feedback"></span>
                   <input type="text" name="name" class="form-control" placeholder="请输入用户名" />
                 </div>
                 <div class="form-group has-feedback">
                   <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                   <input type="password" name="password" class="form-control" placeholder="请输入密码" />
                 </div>
                 <input id="login" type="submit" value="登录" class="btn btn-primary btn-block" />                
               </form>
             </div>
             <div class="panel-footer text-right">
               <a href="#">员工注册</a>
             </div>
           </div>
        </div>
      </div>
   </div>
   <div class="bjDiv">
   	<span class="bjSpan"></span>
   </div>
   <div class="loading">
   		<p>系统提示：</p>
   		<p>页面正在疯狂加载中......</p>
   </div>
   
   <script type="text/javascript">
   	$(function(){
		$("#login").click(function () {
			$(".bjSpan").css({"left":"0","transition":"all 0.7s"});
			$(".loading").css({"z-index":"2"});
		})
// 		$("#login").mouseout(function () {
// 			$(".bjSpan").css({"left":"-100%","transition":"all 0.7s"});
// 		})
	})
   </script>
   
  </body>
</html>
