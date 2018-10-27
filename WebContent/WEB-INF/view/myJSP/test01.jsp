<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPEHTML> 
<html> 
<head> 
<% //引入jspHead.jsp文件，该文件定义了样式与脚本文件 %>
<%@include file="/../../../jspHead.jsp"%>
</head> 
<body> 
     <!--  定义一个Bootstrap布局容器，并设置背景主题info  --> 
	<div class="container bg-info"> 
		<h1 class="text-center"> Hello world!</h1> 
         <!--  定义一个Bootstrap的row样式，row样式一行最多12个列  --> 
		<div class="row"> 
              <!--  col-xs-6定义一个占6列的单元格  --> 
			<div class="col-xs-6"> 
				<h3 class="text-right"> UI(用户界面):</h3> 
			</div> 
              <!--  在定义一个占6列的单元格，一行最多12列，那么与上面的6列刚好组合成一行  --> 
			<div class="col-xs-6"> 
				<h3> <small> Bootstrap 3</small> </h3> 
			</div> 
			<div class="col-xs-6"> 
				<h3 class="text-right"> JS Framework(JavaScript 框架):</h3> 
			</div> 
			<div class="col-xs-6"> 
				<h3> <small> jQuery</small> </h3> 
			</div> 
			<div class="col-xs-6"> 
				<h3 class="text-right"> Server Framework(服务端框架):</h3> 
			</div> 
			<div class="col-xs-6"> 
				<h3> <small> Spring/MyBatis/Shiro</small> </h3> 
			</div> 
			<div class="col-xs-6"> 
				<h3 class="text-right"> DataBase(数据库):</h3> 
			</div> 
			<div class="col-xs-6"> 
				<h3> <small> MySQL 5.x</small> </h3> 
			</div> 
		</div> 
	</div> 
</body> 
</html> 
