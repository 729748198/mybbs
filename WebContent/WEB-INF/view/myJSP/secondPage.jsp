<%@page import="com.mybbs.hwj.service.MainPageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/../../../jspHead.jsp"%>
<!-- 分页样式 -->
<style type="text/css">
	.page{
		display:inline-block;
		border:1px solid;
		font-size:20px;
		width:30px;
		height:30px;
		background-color:#1faeff;
		text-align:center;
	}
	a,a:hover{text-decoration:none;color:#333}

</style>

</head>
<body>
<!--  以下代码使用JSTL标签迭代出主贴与跟帖  --> 
<div class="container-fluid" > 
	<table class="table table-bordered"> 
		<tr> 
	 		<!--  td标签，该单元格定义了发帖人信息与身份  -->
			<td class="tbl"> 
					<div style="text-align: center;"> 
						<p> 楼主</p> 
						<a> <img alt="" src="<%=basePath %>image/avatar_002.gif" /> </a> 
					</div>
				<!--  table标签，该表格用户展示发帖人信息  -->
					<table class="table" style="background-color:#e5edf2; "> 
						<tr> 
							<td> 昵称:</td> 
				 		<!--  使用EL表达式获取发帖人  -->
							<td> ${mainAndSeconds.main_creatuser }</td> 
						</tr> 
						<tr> 
							<td> 性别:</td> 
							<td> 男</td> 
						</tr> 
						<tr> 
							<td> 年龄:</td> 
							<td> 18</td> 
						</tr> 
						<tr> 
							<td> 发帖数:</td> 
							<td> 10</td> 
						</tr> 
						<tr> 
							<td> 回帖数:</td> 
							<td> 10</td> 
						</tr> 
					</table> 
			</td> 
	 		<!--  td标签，该单元格定义了帖子详细内容  -->
			<td class="tbr"> 
				<div style="height: 65px;padding-left: 20px;padding-top: 1px;"> 
					<h3>
				 		<!--  使用EL表达式获取帖子标题  -->
				 		<a style="color: #ifaeff"> ${mainAndSeconds.main_title }</a>
			 		</h3> 
				</div> 
		 		<!-- 下面这是画出一条横线 --> 
		 		<div style="width:98%;height:1px;margin-bottom:10px;
		 			padding:0px;background-color:#D5D5D5;overflow:hidden;"> 
		 		</div> 
				<p class="text-right" style="padding-right: 90px;"> 
					<span style="padding-right: 30px;"> 
				 		<!--  EL表达式获取发帖时间  -->
						<a style="color: #78BA00;">
				 		发表于:${mainAndSeconds.main_creatime }
				 		</a> 
					</span> 
					<span> </span> 
				</p> 
		 		<!-- 下面这是画出一条横线 --> 
		 		<div style="width:98%;height:1px;margin-bottom:10px;
		                        padding:0px;background-color:#D5D5D5;overflow:hidden;"> 
		 		</div> 
				<div style="padding-top: 12px;min-height: 380px;"> 
			 		<!--  EL表达式获取帖子内容  -->
					${mainAndSeconds.main_content }
				</div> 
		 		<!-- 下面这是画出一条横线 --> 
		 		<div style="width:98%;height:1px;margin-bottom:10px;
		                       padding:0px;background-color:#D5D5D5;overflow:hidden;"> 
		 		</div> 
				<!--  上下间隙90像素  --> 
				<div style="padding-right: 90px;"> 
							
				</div> 
						
			</td> 
		</tr> 
		<!--  choose标签相当于Java代码当中switch case语句 -->
		<c:choose> 
 		<%--  when标签相当于Java当中switch case语句当中的case，属性test设置条件 --%>
		<c:when test="${not empty mainAndSeconds.seconds }"> 
 		<!--  forEach相当于Java代码当中的循环  -->
 		<!--  属性items为要迭代元素  -->
 		<!--  属性item为迭代出来的元素  -->
 		<!--  属性varStatus为迭代状态  -->
		<c:forEach	items="${mainAndSeconds.seconds}" var="item" varStatus="vs"> 
		<tr> 
		<td class="tbl"> 
		<div style="text-align: center;"> 
 		<!--  利用vs获取迭代序号，vs索引从0开始  -->
		<p> 第${vs.index+1 }楼</p> 
		<a> 
 		<img alt="" src="<%=basePath %>image/avatar_002.gif" /> 
 		</a> 
		</div> 
		<table class="table" style="background-color:#e5edf2; "> 
		<tr> 
		<td> 昵称:</td>
 		<!--  获取跟帖人  --> 
		<td> ${item.creatuser }</td> 
		</tr> 
		<tr> 
		<td> 性别:</td> 
		<td> 男</td> 
		</tr> 
		<tr> 
		<td> 年龄:</td> 
		<td> 18</td> 
		</tr> 
		<tr> 
		<td> 发帖数:</td> 
		<td> 10</td> 
		</tr> 
		<tr> 
		<td> 回帖数:</td> 
		<td> 10</td> 
		</tr> 
		</table> 
		</td> 
						
		<td class="tbr"> 
		<span style="padding-right: 30px;"> 
 		<!--  获取跟帖时间  -->
		<a style="color: #78BA00;"> 回复于:${item.sec_creatime } 
 		</a> 
		</span> 
 		<div style="width:98%;height:1px;margin-bottom:10px;
                                    padding:0px; background-color:#D5D5D5;overflow:hidden;"> 
 		</div> 
		<div style="padding-top: 12px;min-height: 380px;"> 
 		<!--  获取跟帖内容  -->
		${item.sec_content }
		</div> 
 		<div style="width:98%;height:1px;margin-bottom:10px;
                                    padding:0px; background-color:#D5D5D5;overflow:hidden;"> 
 		</div> 
		<div style="padding-right: 90px;"> 
		</div> 
		</td> 
		</tr> 
		</c:forEach> 
		</c:when> 
		</c:choose> 
	</table> 
<div style="padding: 10px 5px;text-align: right;"> ${pageHtml }</div>
	<!-- 富文本 -->
		
    <form action="<%=basePath%>saveSecondPage" method="post"> 
    	<!-- 记录主贴，关系链 -->
    	<input name="mainId" type="hidden" value="${mainAndSeconds.main_id }">
	  <p class="text-right" style="padding-right:90px;">
	    <button type="submit" class="btn btn-primary btn-xs text-right">
	    	<span class="glyphicon glyphicon-edit" qria-hidden="true"></span>
	    		回复帖子
	    		
	    		
	    </button>
	   </p>
		<!-- 加载编辑器的容器 --> 
		
			<script id="container" name="content" type="text/plain"> 

			</script> 
		
	</form> 

<!-- 配置文件 --> 
<script type="text/javascript" src="<%=basePath %>uedit/js/ueditor.config.js"> </script> 
<!-- 编辑器源码文件 --> 
<script type="text/javascript" src="<%=basePath %>uedit/js/ueditor.all.js"> </script> 
<!-- 实例化编辑器 --> 
<script type="text/javascript"> 
		var editor = UE.getEditor('container');
</script> 
<!-- end富文本 -->
</div> 
</body>
</html>