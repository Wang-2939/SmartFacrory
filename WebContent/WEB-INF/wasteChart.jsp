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
	.row_c div{
		height:217px;
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
         		<div class="panel-heading">合成废水趋势图</div>
         		<div class="panel-body" style="padding: 0;">
         			<div class="panel-body">
         				<form class="form-inline">
						  <div class="form-group">
						    <label>日期选择：</label>
						    <input type="date" class="form-control" id="selectDate" placeholder="请选择查询日期">
						  </div>
						  <button id="selectBtn" type="button" class="btn btn-primary">查询</button>
						</form>
						<div class="row_c">
							<div id="p1" class="col-md-6"></div>
							<div id="p2" class="col-md-6"></div>
						</div>
						<div class="row_c">
							<div id="p3" class="col-md-6"></div>
							<div id="p4" class="col-md-6"></div>
						</div>
						<div class="row_c">
							<div id="p5" class="col-md-6"></div>
							<div id="p6" class="col-md-6"></div>
						</div>
         			</div>
         		</div>
         	</div>
         </div>
       </div>
     </div>
     
    <script type="text/javascript" src="echarts.min.js"></script>
	<script type="text/javascript">
		function getChart(){
			
			$.post("./waste/getWasteChart",{insertTime:$("#selectDate").val()},function(data){
				var arrTime=[];
				var arr1=[];
				var arr2=[];
				var arr3=[];
				var arr4=[];
				var arr5=[];
				var arr6=[];
				for(var i=0;i<data.length;i++){
					arrTime.push(data[i].insertTime);
					arr1.push(data[i].backWaterPH);
					arr2.push(data[i].waterPH);
					arr3.push(data[i].backWaterTemperature);
					arr4.push(data[i].waterTemperature);
					arr5.push(data[i].fanFrequency);
					arr6.push(data[i].acValue);
					
				}
			
			
			//基于准备好的dom，初始化echarts实例 
			var myChart1 = echarts.init(document.getElementById('p1'))
			option1 = {
				    title : {
				        text: '回水ph值',
				    },
				    xAxis : [
				        {	
				        	name : '时间',
				            type : 'category',
				            boundaryGap : false,
				            data : arrTime
				        }
				    ],
				    yAxis : [
				        {	
				        	name : 'pH',
				            type : 'value',
				        }
				    ],
				    series : [
				        {
				            name:'ph',
				            type:'line',
				            data:arr1
				        }]
				};
			//使用刚指定的配置项和数据显示图表 
			myChart1.setOption(option1)
			
			//基于准备好的dom，初始化echarts实例 
			var myChart2 = echarts.init(document.getElementById('p2'))
			option2 = {
				    title : {
				        text: '供水ph值',
				    },
				    xAxis : [
				        {	
				        	name : '时间',
				            type : 'category',
				            boundaryGap : false,
				            data : arrTime
				        }
				    ],
				    yAxis : [
				        {	
				        	name : 'pH',
				            type : 'value',
				        }
				    ],
				    series : [
				        {
				            name:'pH',
				            type:'line',
				            data:arr2
				        }]
				};
			//使用刚指定的配置项和数据显示图表 
			myChart2.setOption(option2)
			
			//基于准备好的dom，初始化echarts实例 
			var myChart3 = echarts.init(document.getElementById('p3'))
			option3 = {
				    title : {
				        text: '回水温度',
				    },
				    xAxis : [
				        {	
				        	name : '时间',
				            type : 'category',
				            boundaryGap : false,
				            data : arrTime
				        }
				    ],
				    yAxis : [
				        {	
				        	name : '℃',
				            type : 'value',
				        }
				    ],
				    series : [
				        {
				            name:'温度',
				            type:'line',
				            data:arr3
				        }]
				};
			//使用刚指定的配置项和数据显示图表 
			myChart3.setOption(option3)
			
			//基于准备好的dom，初始化echarts实例 
			var myChart4 = echarts.init(document.getElementById('p4'))
			option4 = {
				    title : {
				        text: '供水温度 ',
				    },
				    xAxis : [
				        {	
				        	name : '时间',
				            type : 'category',
				            boundaryGap : false,
				            data : arrTime
				        }
				    ],
				    yAxis : [
				        {	
				        	name : '℃',
				            type : 'value',
				        }
				    ],
				    series : [
				        {
				            name:'温度',
				            type:'line',
				            data:arr4
				        }]
				};
			//使用刚指定的配置项和数据显示图表 
			myChart4.setOption(option4)
			
			//基于准备好的dom，初始化echarts实例 
			var myChart5 = echarts.init(document.getElementById('p5'))
			option5 = {
				    title : {
				        text: '冷却风机频率',
				    },
				    xAxis : [
				        {	
				        	name : '时间',
				            type : 'category',
				            boundaryGap : false,
				            data : arrTime
				        }
				    ],
				    yAxis : [
				        {	
				        	name : 'hz',
				            type : 'value',
				        }
				    ],
				    series : [
				        {
				            name:'频率',
				            type:'line',
				            data:arr5
				        }]
				};
			//使用刚指定的配置项和数据显示图表 
			myChart5.setOption(option5)
			
			//基于准备好的dom，初始化echarts实例 
			var myChart6 = echarts.init(document.getElementById('p6'))
			option6 = {
				    title : {
				        text: '补碱阀值',
				    },
				    xAxis : [
				        {	
				        	name : '时间',
				            type : 'category',
				            boundaryGap : false,
				            data : arrTime
				        }
				    ],
				    yAxis : [
				        {	
				        	name : 'pH',
				            type : 'value',
				        }
				    ],
				    series : [
				        {
				            name:'pH',
				            type:'line',
				            data:arr6
				        }]
				};
			//使用刚指定的配置项和数据显示图表 
			myChart6.setOption(option6)
		})
		}
		
		$(function(){
			var today=new Date();
			var year=today.getFullYear();
			var month=today.getMonth()+1;
			var day=today.getDate();
			
			var month=month<10?"0"+month:month;
			var day=day<10?"0"+day:day;
			
			var mydate=year+"-"+month+"-"+day;
			$("#selectDate").val(mydate);
			getChart();
			$("#selectBtn").click(function(){
				getChart();
			})
		})
	</script>
</body>
</html>