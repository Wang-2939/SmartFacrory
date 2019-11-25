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
		
</style>
</head>
<body>
	<div class="container-fluid">
       <%@ include file="header.jsp" %>
       <div class="row">
         <%@ include file="menu.jsp" %>
         <div class="col-md-10 a">
         	<div class="panel panel-default">
         		<div class="panel-heading">电度日报表</div>
         		<div class="panel-body" style="padding: 0;">
         			<div class="panel-body">
         				<form class="form-inline">
						  <div class="form-group">
						    <label>变压器选择：</label>
						    <select id="transformer" class="form-control">
						    	<option value='0'>请选择变压器</option>
						    </select>
						  </div>
						  <div class="form-group">
						    <label>日期选择：</label>
						    <input type="date" class="form-control" id="selectDate" placeholder="请选择查询日期">
						  </div>
						  <button id="selectBtn" type="button" class="btn btn-primary">查询</button>
						</form>
						<table  id="shuju" class="table table-bordered table-condensed">
                    		
                 		</table>
                 		
                 		<div class="modal fade" id="chartModal">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title">电度日报饼图</h4>
						      </div>
						      <div id="chart" style="height:300px;" class="modal-body">
						        
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						      </div>
						    </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
						</div><!-- /.modal -->
                 		
         			</div>
         		</div>
         	</div>
         </div>
       </div>
     </div>
     
     <script type="text/javascript" src="echarts.min.js"></script>
	<script type="text/javascript">
	function getElectric(){
		$.post("./power/getElectric",{transformerId:$("#transformer").val(),insertTime:$("#selectDate").val()},
				function(data){
					$("#shuju").html("");
		
					var title="<tr><th>变压器名称</th><th>峰用电量</th><th>平均电量</th><th>谷用电量</th><th>总用电量</th><th>查看图表</th></tr>"
					
					$("#shuju").append(title);
					for(var i=0;i<data.length;i++){
						var line="<tr>"
					         +"<td>"+data[i].transformerName+"</td>"
					         +"<td>"+data[i].value1+"</td>"
					         +"<td>"+data[i].value2+"</td>"
					         +"<td>"+data[i].value3+"</td>"
					         +"<td>"+data[i].value4+"</td>"
					         +"<td>"
					         +"<button class='btn btn-info' data-toggle='modal' data-target='#chartModal' onclick=showChart("+data[i].value1+",'"+data[i].value2+"','"+data[i].value3+"')>查看图表</buttom>"
					         +"</td>"
					         +"</tr>";
					  	$("#shuju").append(line);
					}
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
			$.post("./power/getTransformer",null,function(data){ 

				for(var i=0;i<data.length;i++){
					var option="<option value='"+data[i].transformerId+"'>"+data[i].transformerName+"</option>";
					$("#transformer").append(option);
				}
			})
			getElectric();
			$("#selectBtn").click(function(){
				getElectric();
			})
			
		})
		
		function showChart(value1,value2,value3){
			$("#chartModal").on("shown.bs.modal",function(e){
				var myChart = echarts.init(document.getElementById("chart"));
				var option = {
					    title : {
					        text: '电度日报饼图',
					        x:'center'
					    },
					    legend: {
					        orient : 'vertical',
					        x : 'left',
					        data:['峰用电量','平均电量','谷用电量']
					    },
					    calculable : true,
					    series : [
					        {
					            name:'用电量',
					            type:'pie',
					            radius : '55%',
					            center: ['50%', '60%'],
					            data:[
					                {value:value1, name:'峰用电量'},
					                {value:value2, name:'平均电量'},
					                {value:value3, name:'谷用电量'},
					            ]
					        }
					    ]
					};
					myChart.setOption(option)                   
			})
			
		}
		
	</script>
</body>
</html>