<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String socketPath = request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>江科大程序员论坛 </title>
    <!-- css -->
    <link href="<%=basePath %>css/autocomplete.css" rel="stylesheet">
    <link href="<%=basePath %>css/forum.css" rel="stylesheet">
    <link href="<%=basePath %>css/mod-dz-1.css" rel="stylesheet">
    <link href="<%=basePath %>css/style_6_common.css" rel="stylesheet">
    <link href="<%=basePath %>css/style_6_forum_index.css" rel="stylesheet">
    <link href="<%=basePath %>css/style_6_widthauto.css" rel="stylesheet">
    <link href="<%=basePath %>css/prestoge.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="<%=basePath %>bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/ityks.css" rel="stylesheet">
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
        <style type="text/css">
    	
    	a,a:hover{ text-decoration:none; color:#333}
    </style>
  </head>
<body >
	<!-- 导航路径 -->
<div class="container-fluid" >
	<nav class="navbar bg-success" >
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">BBS</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li><a href="<%=basePath%>">首页</a></li>
	        <li><a href="<%=basePath%>JinghuaContent">精华帖子</a></li>
	      </ul>
	      
	      <form action="<%=basePath%>findMainByTitle" class="navbar-form navbar-left" role="search">
	        <div class="form-group">
	          <input type="text" name="mainTitle" class="form-control" placeholder="查找">
	          
	          <button type="submit" class="btn btn-default ">搜索</button>
	        </div>
	      </form>
	      
	      <ul class="nav navbar-nav navbar-right">
	      	<c:choose>
	      		<c:when test="${sessionScope.loginFlag}">
	      			<li><a href="javascript:void(0)" onclick="alert('会员')">会员:${sessionScope.loginEntity.wxname}</a></li>
	      			<li><a href="<%=basePath%>/login/logout" >退出</a></li>
	      		</c:when>
	      		<c:otherwise>
	      			<li><a href="<%=basePath %>login.jsp">登录</a></li>
	      		</c:otherwise>
	      	</c:choose>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
</div>

<div class="container-fluid">
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	  <!-- Indicators -->

	
	<div>
	    <div class="item">
	      <img alt="First slide [2046x256]" class="img-responsive"  src="<%=basePath %>image/ccy10.png">
	      <div class="carousel-caption">
	        <p class="text-primary"></p>
	      </div>
	    </div>
	  </div>
	
	  <!-- Controls -->
	  <!-- <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a> -->
	</div>
</div>

<div class="container-fluid" >
	<div class="bm bmw  flg cl con01" style="background-color: #ffffff;" >
      <div class="bm_h cl" style="position: relative;background-color: #ffffff;" >
        <span class="o" >
          <img id="category_8702_img" src="<%=basePath%>image/collapsed_no.gif" title="收起/展开" alt="收起/展开" onclick="toggle_collapse('category_8701');">
        </span>
        <h4 >
        	<i class="jg"></i>
			<a href="javascript:void(0)">编程 专区</a>
        </h4>
      </div>
      
      
      <div id="category_8701" class="bm_c" >
        <table class="fl_tb" >
          <tbody class="js-hover">
            <c:choose>
            	<c:when test="${not empty java }">
            		<c:forEach items="${java }" var="forum" varStatus="vs">
            			<c:set var="endTr" value="3"></c:set>
            			<c:if test="${vs.index*10%3 eq 0 }">
            				<tr class="fl_row">
            			</c:if>
            				<td class="fl_g" width="32.9%">
            					<div class="fl_icn_g" style="width: 120px;">
				                  <a href="<%=basePath%>mainContent?mainType=${forum.dictKey }">
				                  <c:if test="${vs.index eq 0 }">
				                  	<img src="<%=basePath%>image/language_java.png" alt="Java" align="left">
				                  </c:if>
				                  <c:if test="${vs.index eq 1 }">
				                  	<img src="<%=basePath%>image/language_php.png" alt="PHP" align="left">
				                  </c:if>
				                  <c:if test="${vs.index eq 2 }">
				                  	<img src="<%=basePath%>image/language_net.png" alt=".NET" align="left">
				                  </c:if>
				                  <c:if test="${vs.index eq 3 }">
				                  	<img src="<%=basePath%>image/language_jsp.png" alt="JSP" align="left">
				                  </c:if>
				                   <c:if test="${vs.index eq 4 }">
				                  	<img src="<%=basePath%>image/language_mysql.png" alt="MYSQL" align="left">
				                  </c:if>
				                   <c:if test="${vs.index eq 5 }">
				                  	<img src="<%=basePath%>image/language_web.png" alt="Web" align="left">
				                  </c:if>
				                  <c:if test="${vs.index eq 6 }">
				                  	<img src="<%=basePath%>image/language_andriod.png" alt="Android" align="left">
				                  </c:if>
				                  <c:if test="${vs.index eq 7 }">
				                  	<img src="<%=basePath%>image/language_c.png" alt="C/C++" align="left">
				                  </c:if>
				                  <c:if test="${vs.index eq 8 }">
				                  	<img src="<%=basePath%>image/language_c.png" alt="Algorithm" align="left">
				                  </c:if>
				                  </a>
				                </div>
				                <dl style="margin-left: 120px;">
								                    <dt>
								                 
								                       <a href="<%=basePath%>mainContent?mainType=${forum.dictKey }" class="game-title">${forum.dictValue }</a>
								                       <em class="game-todayposts" title="今日"></em>
								                    </dt>
								                    <dd class="game-desc">
				                <c:choose>
				                	<c:when test="${not empty top5s }">
				                		<c:forEach items="${top5s }" var="top5" varStatus="vsa" >
				                			<c:if test="${not empty top5[forum.dictKey] }">
				                				<c:forEach items="${top5[forum.dictKey] }" var="itm" varStatus="vsb">
				                					<a href="<%=basePath%>secondContent?mainId=${itm.mainId}" target="_blank" class="text-nowrap">${itm.mainTitle}</a>|
				                				</c:forEach>
				                			</c:if>
				                		</c:forEach>
				                	</c:when>
				                </c:choose>
				                					</dd>
				                </dl>
            				</td>
            			<c:if test="${vs.last or endTr eq (vs.index+1) }">
            				<tr>
            				<c:set var="endTr" value="${endTr+3}" ></c:set>
            				</tr> 
            			</c:if>
            		</c:forEach>
            	</c:when>
            </c:choose>         
       </tbody>
     </table>
   </div>
</div>
    
    
<div class="bm bmw  flg cl con02" style="background-color: #ffffff;">
      <div class="bm_h cl" style="position: relative;background-color: #ffffff;">
        <span class="o">
          <img id="category_8702_img" src="<%=basePath%>image/collapsed_no.gif" title="收起/展开" alt="收起/展开" onclick="toggle_collapse('category_8702');">
        </span>
        <h4 >
        	<i class="jg"></i>
			<a style="" href="#">灌水专区——今天有什么好玩的~</a>
        </h4>
      </div>
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
  						 	<c:if test="${sessionScope.loginEntity.wxname eq '贺文杰'}">
	  						 		<c:if test="${item.main_recommend eq 1 }">
	  								<a href="<%=basePath%>secondContent?mainId=${item.main_id}" ><img src="<%=basePath %>image/pin_1.gif" id="${item.main_id}img" />[精品]&nbsp;&nbsp; ${item.main_title }</a>
	  								<c:if test="${sessionScope.loginFlag}">
	  									<a style="color: green" href="javascript:void(0)" onclick="setjinghua('${item.main_id}','qx')">[取消精华]</a>
	  								</c:if>
	  								
	  							</c:if>
	  							<c:if test="${item.main_recommend ne 1 }">
	  								<a href="<%=basePath%>secondContent?mainId=${item.main_id}" ><img src="<%=basePath %>image/folder_new.gif" />[新帖]&nbsp;&nbsp; ${item.main_title }</a>
	  								<c:if test="${sessionScope.loginFlag}">
	  								<a style="color: red" href="javascript:void(0)" onclick="setjinghua('${item.main_id}','sz')">[设置精华]</a>
	  								</c:if>
	  							</c:if>
	  							<script type="text/javascript">
	  								function setjinghua(mainId,flag){
	  									$.ajax({
												url:"<%=basePath%>jinghua?mainId="+mainId+"&flag="+flag,
												type:'GET',
												success:function (data){
													if (data.success){
														window.location.reload();
													}
												}
											});
	  								}
	  							</script>
  						 	</c:if>
  						 	<c:if test="${sessionScope.loginEntity.wxname != '贺文杰'}">
	  						 		<c:if test="${item.main_recommend eq 1 }">
	  								<a href="<%=basePath%>secondContent?mainId=${item.main_id}" ><img src="<%=basePath %>image/pin_1.gif" id="${item.main_id}img" />[精品]&nbsp;&nbsp; ${item.main_title }</a>
	  								
	  							</c:if>
	  							<c:if test="${item.main_recommend ne 1 }">
	  								<a href="<%=basePath%>secondContent?mainId=${item.main_id}" ><img src="<%=basePath %>image/folder_new.gif" />[新帖]&nbsp;&nbsp; ${item.main_title }</a>
	  								
	  							</c:if>
	  							<script type="text/javascript">
	  								function setjinghua(mainId,flag){
	  									$.ajax({
												url:"<%=basePath%>jinghua?mainId="+mainId+"&flag="+flag,
												type:'GET',
												success:function (data){
													if (data.success){
														window.location.reload();
													}
												}
											});
	  								}
	  							</script>
  						 	</c:if>
  						
  						
  						</td>
  						<td>${item.main_creatuser }</td>
			  			<td>${item.info_reply }/${item.info_see }</td>
			  			<td>${item.info_lastuser }</td>
  					</tr>
  				</c:forEach>
  			</c:when>
  		</c:choose>
	</table> 
	
	<div class="row">
		<div class="col-xs-7">
			
		</div>
		<div class="col-xs-5 text-nowrap" >
			${pageHtml }
			<script type="text/javascript">
				function goPage (parm){
					var page = $("#pageNum").val();
					var reg = new RegExp("^[0-9]*$");
					if (page!=''&&reg.test(page)){
						window.location.href="?page="+page+parm;
					}else{
						alert ("请输入数字");
					}
				}
			</script>
		</div>
	</div>
		
	<div style="width:98%;height:3px;margin-bottom:10px;padding:0px;background-color:#D5D5D5;overflow:hidden;"></div>
	
    <form action="<%=basePath%>saveshouyeContent1" method="post" id="saveTiezi"> 
    <label for="biaoti">帖子标题</label>
    <input type="text" name="mainTitle" placeholder="最大长度80个汉字" style="width:360px;">
    <c:choose>
			<c:when test="${sessionScope.loginFlag}">
				<button type="button" class="btn btn-primary btn-xs text-right" onclick="subForm()" >发表帖子</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-primary btn-xs text-right" onclick="goLogin()">发表帖子</button>
			</c:otherwise>
		</c:choose>
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
    	 var success = ${sessionScope.loginFlag};
	   	 editor.addListener('ready',function (){
	   			if(success){
					console.log("OK");
					return;
				}else{
	   				editor.setDisabled('fullscreen');
	   				editor.setContent('<br/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=basePath%>login.jsp" target="_parent" onclick="goLogin()">请登录</a>');
				}
	     });
    	 function goLogin(){
    		 if (confirm('发帖前请先登录,确定跳转登录页面')){
    		 window.location.href="<%=basePath%>login.jsp";
    	 	}
    	 }
        function subForm (){
        	var content = editor.getContent();
        	var mainTitle = $("#mainTitle").val();
        	if (content === '' || mainTitle === ''){
        		alert ("请输入标题与内容");
        	}else{
        		$("#saveTiezi").submit();
        	}
        }
    </script>
</div>
</div>	
<footer class="footer bg-info">
	    <div class="container" >
	    	<div class="row">
	                <div class="col-sm-12">
	                    <span><a href="http://120.78.66.11:8080/">贺文杰</a></span> | 
	                    
	                    <span>QQ：729748198</span>
	                </div>
	                <br />
	                <br />
	         </div>
	    </div>
	</footer>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=basePath %>bootstrap-3.3.5-dist/js/jquery-1.11.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=basePath %>bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/index.js"></script>
</body>
</html>