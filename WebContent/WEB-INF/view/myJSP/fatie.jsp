<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPEHTML> 
<html> 
<head> 
<% //引入jspHead.jsp文件，该文件定义了样式与脚本文件 %>
<%@include file="/../../../jspHead.jsp"%>
<!--  分页样式  -->
 	<style type="text/css"> 
	.page{
		display:inline-block;			/*  内联对象  */ 
		border: 1px solid ;			/*  1像素边框  */
		font-size: 20px;				/*  文字大小20像素 */
		width: 30px;					/*  宽度30像素  */
		height: 30px;				/*  高度30像素  */
		background-color: #1faeff;	/*  设置背景色  */
		text-align: center;			/*  居中对齐  */
	}
	a,a:hover{ text-decoration:none; color:#333}
 	</style> 
</head> 
<body> 
<!--  使用Bootstrap table样式  -->
	<table class="table table-striped">
		<!--  tr创建一行  --> 
		<tr> 
			<!--  th创建表头  -->
			<th width="70%"> <strong> 标题：</strong> </th> 
			<th width="10%"> <strong> 作者</strong> </th> 
			<th width="10%"> <strong> 回复/查看</strong> </th> 
			<th width="10%"> <strong> 最后发表</strong> </th> 
		</tr> 
		<c:choose>
			<c:when test="${not empty main }">
				<c:forEach items="${main }" var="item" varStatus="vs">
					<tr>
						<td>
						<a href="<%=basePath %>secondPageContent?mainId=${item.main_id }">
						<img src="<%=basePath %>image/pin_1.gif" id="${item.main_id}img"/>
						[日月精华]&nbsp;&nbsp;
						<!-- 标题 -->
						${item.main_title }
						</a>
						</td>
						<td>
						<!-- 发帖人 -->
						${item.main_creatuser}
						</td>
						
						<td>
						<!-- 回复人数和查看人数 -->
						${item.info_reply }/${item.info_see}
						</td>
						<td>
						<!-- 最后发帖人 -->
						${item.info_lastuser }
						</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table> 
	
	<!--  使用Bootstrap栅格系统  -->
	<div class="row"> 
 		<!--  定义单元格，占用7列，该单元格用于占位使用  -->
		<div class="col-xs-7"> 
			
		</div> 
		<!--  定义单元格，占用5列，分页样式在该单元格书写  -->
		<div class="col-xs-5 text-nowrap"> 
			<!--  定义span标签，用于放置前一页连接  -->
			${pageHtml }
			
		</div> 
	</div> 
	
	
    <form action="<%=basePath%>saveshouyeContent" method="post"> 
    <label for="biaoti">帖子标题</label>
    <input type="text" name="mainTitle" placeholder="最大长度80个汉字" style="width:360px;">
    <button type="submit" class="btn btn-primary btn-xs text-right">
    	发表帖子
    </button>
	<!-- 加载编辑器的容器 --> 
	<div style="padding: 0px;margin: 0px;width: 100%;height: 100%;" > 
		<script id="container" name="content" type="text/plain"> 

	</script> 
	</div> 
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
</body> 
</html> 
