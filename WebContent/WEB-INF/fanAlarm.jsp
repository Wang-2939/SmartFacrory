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
	#page{
		position: absolute;
	    bottom: 3%;
	    left: 50%;
	    margin-left: -120px;
	}
	.panel-body{
		height:535px;
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
         		<div class="panel-heading">风机频率报警</div>
         		
         			<div class="panel-body">
         				<form class="form-inline">
						  <div class="form-group">
						    <label>日期选择：</label>
						    <input type="date" class="form-control" id="selectDate" placeholder="请选择查询日期">
						  </div>
						  <button id="selectBtn" type="button" class="btn btn-primary">查询</button>
						</form>
						
						<div class="row1">
							<div id="p1" style="height:330px" class="col-md-12"></div>
						</div>
						
						<table  id="shuju" class="table table-bordered table-condensed">
                    		
                 		</table>	
                 		<div id="page"></div>
         			</div>
         	</div>
         </div>
       </div>
     </div>
     
    <script type="text/javascript" src="echarts.min.js"></script>
    <script type="text/javascript" src="jquery.page.js"></script>
	<script type="text/javascript">
		function getFanAlarm(){
			$.post("./waste/getFanAlarm",{insertTime:$("#selectDate").val()},function(data){
				var arr1=[]
				var arr2=[]
				for(var i=0;i<data.length;i++){
					arr1.push(data[i].alarmName);
					arr2.push(data[i].alarmCount);
				}
				
				var myC hart1 = echarts.init(document.getElementById('p1'))
				option1 = {
					    title : {
					        text: '风机频率报警',
					    },
					    calculable : true,
					    xAxis : [
					        {
					            type : 'value',
					            boundaryGap : [0, 0.01]
					        }
					    ],
					    yAxis : [
					        {
					            type : 'category',
					            data : arr1
					        }
					    ],
					    series : [
					        {
					            type:'bar',
					            data:arr2
					        },
					    ]
					};
				myChart1.setOption(option1);
	
			});
		};
		$(function(){
			var today=new Date();
			var year=today.getFullYear();
			var month=today.getMonth()+1;
			var day=today.getDate();
			
			var month=month<10?"0"+month:month;
			var day=day<10?"0"+day:day;
			
			var mydate=year+"-"+month+"-"+day; +
			
			$("#selectDate").val(mydate);		
			getFanAlarm();
			//按钮单击时
			$("#selectBtn").click(function(){
				getFanAlarm();
			});
		});
		
		
	
	</script>
</body>
</html>