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
	.wbj{
		background-image:url(img/water1.png);
		background-size: 1161px 631px;
		height: 626px;
		position:relative;
		
	}
	.wbj div{
		width:90px;
		height:32px;
		border:3px solid green;
		z-index:1;
		position:absolute;
		background-color:#cecece;
		border-radius: 8px;
		font-weight: bold;
		text-align:center;
		line-height:25px;
	}
	
	#pressure1{
    	left: 781px;
    	top: 148px;
	}
	#pressure2{
    	left: 414px;
    	top: 158px;
	}
	#pressure3{
		left: 623px;
    	top: 194px;
	}
	#pressure4{
		left: 437px;
    	top: 234px;
	}
	#pressure5{
		left: 310px;
    	top: 234px;
	}
	#pressure6{
		left: 887px;
    	top: 148px;
	}
	
	.wbj span{
		width:90px;
		height:32px;
		border:3px solid green;
		z-index:1;
		position:absolute;
		background-color:#ffffff;
		border-radius: 8px;
		font-weight: bold;
		text-align:center;
		line-height:25px;
		font-size: 12px;
	}
	.pressure1{
		left: 781px;
    	top: 126px;
	}
	.pressure2{
    	left: 414px;
    	top: 136px;
	}
	.pressure3{
		left: 623px;
    	top: 172px;
	}
	.pressure4{
		left: 437px;
    	top: 212px;
	}
	.pressure5{
		left: 310px;
    	top: 212px;
	}
	.pressure6{
    	left: 887px;
    	top: 126px;
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
         			水压监控管理
         		</div>
         		<div class="panel-body" style="padding: 0;">
         		<div class="text-right"><button id="refresh" class="btn btn-primary">刷新</button></div>
         			<div class="panel-body wbj">
         				<span class="pressure1">一期循环水压力</span>
         				<span class="pressure2">二期循环水压力</span>
         				<span class="pressure3">热加工深井泵压力</span>
         				<span class="pressure4">真空槽深井泵压力</span>
         				<span class="pressure5">吊拉深井泵压力</span>
         				<span class="pressure6">自来水压力</span>
         				<div id="pressure1"></div>
         				<div id="pressure2"></div>
         				<div id="pressure3"></div>
         				<div id="pressure4"></div>
         				<div id="pressure5"></div>
         				<div id="pressure6"></div>
         			</div>
         		</div>
         	</div>
         </div>
       </div>
     </div>
     
      <script type="text/javascript">
     	function getData(){
     		$.post("./power/getWaterPressure",null,function(data){
     			$("#pressure1").html(data.waterPressure1+"MPa");
     			$("#pressure2").html(data.waterPressure2+"MPa");
     			$("#pressure3").html(data.waterPressure3+"MPa");
     			$("#pressure4").html(data.waterPressure4+"MPa");
     			$("#pressure5").html(data.waterPressure5+"MPa");
     			$("#pressure6").html(data.waterPressure6+"MPa");
     		})
     	}
     	$(function(){
     		getData();
     		$("#refresh").click(function(){
     			getData();
     		})
     	})
     	setInterval("getData()",1000*10);
     </script>
     
</body>
</html>