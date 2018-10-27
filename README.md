# mybbs
这是一个简单的论坛网站

WebContent：前端 login.jsp: 登录页面

  WEB-INF/view

    index.jsp: 首页
   
    jinggua.jsp :精华页面
    
    mainContent.jsp:板块页面

    secondContent.jsp :帖子页面
    
myresource：测试用

resource：配置文件

    scr/com/mybbs/hwj :后台代码
    
      UserLogin 登录控制层

      index/IndexCOntroller  首页控制层

      forum/MainController  板块控制层

      forum/SecondController  帖子控制层 
     
注册登录使用了shiro框架验证，后端SpringMVC+Spring，持久层使用了JDBCTemplate
