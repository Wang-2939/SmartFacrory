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
         		<div class="panel-heading">水压趋势图</div>
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
			
			$.post("./power/getWaterChart",{insertTime:$("#selectDate").val()},function(data){
				var arrTime=[];
				var arr1=[];
				var arr2=[];
				var arr3=[];
				var arr4=[];
				var arr5=[];
				var arr6=[];
				for(var i=0;i<data.length;i++){
					arrTime.push(data[i].insertTime);
					arr1.push(data[i].waterPressure1);
					arr2.push(data[i].waterPressure2);
					arr3.push(data[i].waterPressure3);
					arr4.push(data[i].waterPressure4);
					arr5.push(data[i].waterPressure5);
					arr6.push(data[i].waterPressure6);
					
				}
			
			
			//基于准备好的dom，初始化echarts实例 
			var myChart1 = echarts.init(document.getElementById('p1'))
			option1 = {
				    title : {
				        text: '一期循环水压力',
				    },
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data : arrTime
				        }
				    ],
				    yAxis : [
				        {	
				        	name : '水压(MPa)',
				            type : 'value',
				        }
				    ],
				    series : [
				        {
				            name:'水压',
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
				        text: '二期循环水压力',
				    },
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data : arrTime
				        }
				    ],
				    yAxis : [
				        {	
				        	name : '水压(MPa)',
				            type : 'value',
				        }
				    ],
				    series : [
				        {
				            name:'水压',
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
				        text: '热加工深井泵压力',
				    },
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data : arrTime
				        }
				    ],
				    yAxis : [
				        {	
				        	name : '水压(MPa)',
				            type : 'value',
				        }
				    ],
				    series : [
				        {
				            name:'水压',
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
				        text: '真空槽深井泵压力',
				    },
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data : arrTime
				        }
				    ],
				    yAxis : [
				        {	
				        	name : '水压(MPa)',
				            type : 'value',
				        }
				    ],
				    series : [
				        {
				            name:'水压',
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
				        text: '吊拉深井泵压力',
				    },
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data : arrTime
				        }
				    ],
				    yAxis : [
				        {	
				        	name : '水压(MPa)',
				            type : 'value',
				        }
				    ],
				    series : [
				        {
				            name:'水压',
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
				        text: '自来水压力',
				    },
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data : arrTime
				        }
				    ],
				    yAxis : [
				        {	
				        	name : '水压(MPa)',
				            type : 'value',
				        }
				    ],
				    series : [
				        {
				            name:'水压',
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