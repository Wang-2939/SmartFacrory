<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style type="text/css">
  .menubg{
    background-color:skyblue;  
    height:800px;
    background-image: url(img/gybj6.png);
    background-position: bottom -5px left -63px;
  }
  .menu{
    list-style:none;
  }
  .menu li{
    margin:5px;
    list-style:none;
  }
  .panel-group{
  margin-top:10px;
  }
  .panel-bodyM{
  	padding:0;
  }
  .nav-pills > li > a:hover{
  	border: 1px solid #337ab7;
  }
</style>
<div class="col-md-2 menubg">
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  
	</div>
</div>

<script type="text/javascript">
  $(function(){
	  $.post("./home/getMenu",null,function(data){
		  //清空已有菜单数据
		  $("#accordion").html("");
		  for(var i=0;i<data.length;i++){
			  if(data[i].menuType==0){
			  var panel=" <div class='panel panel-default'>"
			              +" <div class='panel-heading' role='tab' id='heading"+data[i].menuId+"'> "
			              +" <h4 class='panel-title'>"
			              +" <a class='collapsed' role='button' data-toggle='collapse' data-parent='#accordion' href='#collapse"+data[i].menuId+"' aria-expanded='false' aria-controls='collapse"+data[i].menuId+"'>"
			              +data[i].menuName
			              +" </a>"
			              +" </h4>"
			              +"</div>"
			              +"<div id='collapse"+data[i].menuId+"' class='panel-collapse collapse' role='tabpanel' aria-labelledby='heading"+data[i].menuId+"'>"
			              +"<div class='panel-bodyM'>"
			              +"<ul class='nav nav-pills nav-stacked'>";
			              for(var j=0;j<data.length;j++){
			            	  if(data[j].parentId==data[i].menuId){
			            	     panel+="<li><a href='"+data[j].url+"'>"+data[j].menuName+"</a></li>";
			            	  }           	  
			              }
			              panel+="</ul>";
			              panel+="</div> </div> </div>";
			              $("#accordion").append(panel);
			  }
		  }
	  });
	  
  });
  
</script>
