<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
<script type="text/javascript" src="jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"/></script>
<style type="text/css">
  .headerbg{
    background-color:#1c77ac;
    background-image:url(img/gybj6.png);
    background-position: bottom -146px left;
  }
  .a_color{
    color:white;
  }
  .bj{
    margin-top: 20px;
    margin-bottom: 50px;
  }
  #titleLogo{
  	width: 600px;
    margin-left: 98%;
    margin-top:-3px;
  }
  .a_color{
  	margin-left: 10px;
    color: #cccccc;
    font-weight: bolder;
  }
  .a_color:hover{
  	color:white;
  }
  .Dhlw{
  	position:absolute;
  	display:block;
  	height:100%;
  	width:50%;
  	color: #b7b7b7;
  	top:70%;
  	font-size:18px;
  }
  @media screen and (max-width:1440px){
  	#titleLogo{
  		margin-left: 78%;
  	}
  	.Dhlw{
  		width:50%;
  		top:57%;
  		font-weight: bold;
  		font-style: oblique;
  	}
  }
</style>
<div class="row headerbg">
  <div class="col-md-4">
  	<span class="Dhlw">互联网+工业v.4.0 ©WangChao</span>
    <img src="img/logo.png" id="titleLogo">
  </div>
  <div class="col-md-4 col-md-offset-4 text-right">
    <div class="bj">
      <a href="#" class="a_color">关于</a>
      <a href="#" class="a_color">帮助</a>
      <a href="./user/logout" class="a_color">注销</a>
    </div>
    <div>
      <span class="glyphicon glyphicon-user" style="color:white;"></span>
      <span style="color:white;font-size:18px;">欢迎  <span id="depart" style="font-weight: bolder;color:black;">${name}</span> 登录智慧工厂中央管理系统 </span>
    </div>
  </div>
</div>
