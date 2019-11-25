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
	.row1_1{
		margin-top:50px;
	}
	.row1_1 span{
		display:block;
	}
	.row1_1 #span1,#span4{
		width:70px;
		height:40px;
		border:3px solid black;
	}
	.row1_1 #span2,#span3{
		width:5px;
		height:50px;
		background-color:black;
		margin-left: 33px;
	}
	.zhengchang{
		margin-top: -60px;
	}
	.row1_1 #span4{
		margin-top: -20px;
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
         		<div class="panel-heading">尾气风机监控</div>
         		<div class="panel-body" style="padding: 0;">
         			<div class="panel-body">
         			<div class="text-right"><button id="refresh" class="btn btn-primary">刷新</button></div>
         				<img src="img/tuli.png" class="tuli"/>
         				<div class="row1">
         				
							<!--第一个管道 -->
         					<div class="col-md-2 row1_1">
	         					<span id="span1" class="wd1"></span>
	         					<span id="span2"></span>
	         					<img src="img/guandao.png" class="guandao"/>
	         					<span id="span3"></span>
	         					<img id="qiu1" src="img/zhengchang.png" class="zhengchang"/>
	         					<span id="span4" class="pl1"></span>
         					</div>
         					
         					<!--第二个管道 -->
         					<div class="col-md-2 row1_1">
	         					<span id="span1" class="wd2"></span>
	         					<span id="span2"></span>
	         					<img src="img/guandao.png" class="guandao"/>
	         					<span id="span3"></span>
	         					<img id="qiu2" src="img/zhengchang.png" class="zhengchang"/>
	         					<span id="span4" class="pl2"></span>
         					</div>
         					
         					<!--第三个管道 -->
         					<div class="col-md-2 row1_1">
	         					<span id="span1" class="wd3"></span>
	         					<span id="span2"></span>
	         					<img src="img/guandao.png" class="guandao"/>
	         					<span id="span3"></span>
	         					<img id="qiu3" src="img/zhengchang.png" class="zhengchang"/>
	         					<span id="span4" class="pl3"></span>
         					</div>
         					
         					<!--第四个管道 -->
         					<div class="col-md-2 row1_1">
	         					<span id="span1" class="wd4"></span>
	         					<span id="span2"></span>
	         					<img src="img/guandao.png" class="guandao"/>
	         					<span id="span3"></span>
	         					<img id="qiu4" src="img/zhengchang.png" class="zhengchang"/>
	         					<span id="span4" class="pl4"></span>
         					</div>
         					
         					<!--第五个管道 -->
         					<div class="col-md-2 row1_1">
	         					<span id="span1" class="wd5"></span>
	         					<span id="span2"></span>
	         					<img src="img/guandao.png" class="guandao"/>
	         					<span id="span3"></span>
	         					<img id="qiu5" src="img/zhengchang.png" class="zhengchang"/>
	         					<span id="span4" class="pl5"></span>
         					</div>
         					
         					<!--第六个管道 -->
         					<div class="col-md-2 row1_1">
	         					<span id="span1" class="wd6"></span>
	         					<span id="span2"></span>
	         					<img src="img/guandao.png" class="guandao"/>
	         					<span id="span3"></span>
	         					<img id="qiu6" src="img/zhengchang.png" class="zhengchang"/>
	         					<span id="span4" class="pl6"></span>
         					</div>
         				</div>
         				
         			</div>
         		</div>
         	</div>
         </div>
       </div>
     </div>
     
<script type="text/javascript">
	function getWasteGas(){
		$.post("./waste/getWasteGas",null,function(data){
			//管道1
			$(".wd1").html(data.flueTemperature1+"℃");
			$(".pl1").html(data.fanFrequency1+"Hz");
			//管道2
			$(".wd2").html(data.flueTemperature2+"℃");
			$(".pl2").html(data.fanFrequency2+"Hz");
			//管道3
			$(".wd3").html(data.flueTemperature3+"℃");
			$(".pl3").html(data.fanFrequency3+"Hz");
			//管道4
			$(".wd4").html(data.flueTemperature4+"℃");
			$(".pl4").html(data.fanFrequency4+"Hz");
			//管道5
			$(".wd5").html(data.flueTemperature5+"℃");
			$(".pl5").html(data.fanFrequency5+"Hz");
			//管道6
			$(".wd6").html(data.flueTemperature6+"℃");
			$(".pl6").html(data.fanFrequency6+"Hz");
			
			if(data.fanFrequency1==0){
				$("#qiu1").attr("src","img/buzhengchang.png");
			}else{
				$("#qiu1").attr("src","img/zhengchang.png");
			}
			if(data.fanFrequency2==0){
				$("#qiu2").attr("src","img/buzhengchang.png");
			}else{
				$("#qiu2").attr("src","img/zhengchang.png");
			}
			if(data.fanFrequency3==0){
				$("#qiu3").attr("src","img/buzhengchang.png");
			}else{
				$("#qiu3").attr("src","img/zhengchang.png");
			}
			if(data.fanFrequency4==0){
				$("#qiu4").attr("src","img/buzhengchang.png");
			}else{
				$("#qiu4").attr("src","img/zhengchang.png");
			}
			if(data.fanFrequency5==0){
				$("#qiu5").attr("src","img/buzhengchang.png");
			}else{
				$("#qiu5").attr("src","img/zhengchang.png");
			}
			if(data.fanFrequency6==0){
				$("#qiu6").attr("src","img/buzhengchang.png");
			}else{
				$("#qiu6").attr("src","img/zhengchang.png");
			}
		})
	}
	$(function(){
		getWasteGas();
		$("#refresh").click(function(){
			getWasteGas();
		})
	})
	setInterval("getWasteGas()",1000*10);
</script>
</body>
</html>