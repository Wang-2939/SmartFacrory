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
         		<div class="panel-heading">合成废水报警</div>
         		
         			<div class="panel-body">
         				<form class="form-inline">
						  <div class="form-group">
						    <label>日期选择：</label>
						    <input type="date" class="form-control" id="selectDate" placeholder="请选择查询日期">
						  </div>
						  <button id="selectBtn" type="button" class="btn btn-primary">查询</button>
						</form>
						
						<div class="row1">
							<div id="p1" style="height:230px" class="col-md-12"></div>
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
		function getAlarmCount(){
			$.post("./waste/getWasteAlarm",{insertTime:$("#selectDate").val()},function(data){
				var fs=[]
				for(var i=0;i<data.length;i++){
					fs.push({value:data[i].alarmCount,name:data[i].alarmName});
				}
				//表1
				var myChart1 = echarts.init(document.getElementById("p1"));
				var option1 = {
					    title : {
					        text: '合成废水报警',
					        x:'center'
					    },
					    calculable : true,
					    series : [
					        {
					            name:'合成废水报警',
					            type:'pie',
					            radius : '55%',
					            center: ['50%', '60%'],
					            data:fs
					        }
					    ]
					};
					myChart1.setOption(option1);
			})	
		}
		
		function showData(data){
			$("#shuju").html("");
			
			var title="<tr><th>报警时间</th><th>报警名称</th><th>报警值</th><th>限定值</th></tr>";
			$("#shuju").append(title);
			for(var i=0;i<data.list.length;i++){
				  var line="<tr>"
				         +"<td>"+data.list[i].insertTime+"</td>"
				         +"<td>"+data.list[i].alarmName+"</td>"
				         +"<td>"+data.list[i].alarmValue+"</td>"
				         +"<td>"+data.list[i].limitValue+"</td>"
				         +"</tr>";
				  $("#shuju").append(line);
			 }
		} 
		
		function loadPage(totalPage){
			
			$("#page").Page({
				totalPages:totalPage,
				liNums:7,		//分页的数字按钮数 
				activeClass: 'activP', //类样式定义
				callBack:function(page){
					$.post("./waste/getWasteList",{insertTime:$("#selectDate").val(),pageNum:page,pageSize:5},function(data){
								showData(data);
							});
				}
			});
		}
		
		$(function(){
			var today=new Date();
			var year=today.getFullYear();
			var month=today.getMonth()+1;
			var day=today.getDate();
			
			var month=month<10?"0"+month:month;
			var day=day<10?"0"+day:day;
			
			var mydate=year+"-"+month+"-"+day; 
			
			//页面加载时
			$("#selectDate").val(mydate);		
				getAlarmCount();
				$.post("./waste/getWasteList",{insertTime:$("#selectDate").val(),pageNum:1,pageSize:5},function(data){
					showData(data);
					loadPage(data.totalPage);
				});
			
				//按钮单击时
				$("#selectBtn").click(function(){
				
					getAlarmCount();
					$.post("./waste/getWasteList",{insertTime:$("#selectDate").val(),pageNum:1,pageSize:5},function(data){
						showData(data);
						loadPage(data.totalPage);
					});
					
				});
	
		
		})
	
	</script>
</body>
</html>