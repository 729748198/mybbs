package com.mybbs.hwj.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mybbs.hwj.service.MainPageService;
//@Controller注解声明该类为Spring控制类，继而通过@requestMapping注解声明的路径映射
//如果不使用@Controller注解，@requestMapping注解也会失效
@Controller
public class MainPageController {
	 //@RequestMapping注解用来声明路径映射，可以用于类或方法上
     //该注解映射路径为http://127.0.0.1:8080/mrbbs/goMainPage
	//通过浏览器输入路径便能够访问到这个方法
	@RequestMapping("/goMainPage")
	public ModelAndView goMainPage (HttpServletRequest request,
			@RequestParam(name="page",defaultValue="1") Integer page,
			@RequestParam(name="row",defaultValue="40") Integer row){
		
         //设置视图"myJSP/mainPage"，指向工程路径
		//WebContent→WEB-INF→view→myJSP→mainPage.jsp文件
         //在com.mrkj.ygl.config.WebConfig.java文件定义了jsp视图等
		ModelAndView mav = new ModelAndView("myJSP/mainPage");
        
		//获取mian info
		List<Map<String, Object>>mainContents=mps.getMainPage((page-1)*row,row);
		//帖子内容
		mav.addObject("main",mainContents);
		
		//获取总共多少帖子
		Long count=mps.getMainCount();
		
		//获取分页方法
		String pageHtml=mps.getPage(count,page, row);
		//分页
		mav.addObject("pageHtml",pageHtml);
		
		//返回ModelAndView对象会跳转至对应的视图文件，也将设置的参数同时传递至视图
		return mav;
	}
	

	//@Resource，Javax.annotation.Resource，该注解并不是Spring注解，但是Spring支持该注解注入
		@Resource
		MainPageService mps;
		
		//被rquestMapping注解声明的方法，会自动注入
		//request：该参数由Spring注入
		//content：该参数由前端传递过来，记录了富文本数据，参数名称要与传递过来的参数名要一致
		//mainTitle：该参数由前端传递过来，记录了帖子标题，参数名称要与传递过来的参数名要一致
		@RequestMapping(value="/saveUeditorContent")
		public ModelAndView saveUeditor(HttpServletRequest request
	                                       ,String content,String mainTitle){
			ModelAndView mav = new ModelAndView();
			System.out.println("进入后台");
			//获取客户端IP地址作为发帖人
			String mainCreatuser = request.getRemoteAddr();
			int result = mps.saveMainContent(content, mainTitle, mainCreatuser);
			//根据result判断是否向数据库当中插入了一条数据 
			if (result == 1){
				//如果数据插入成功，重新刷新页面数据
				mav.setViewName("redirect:/goMainPage");
			}else{
				//如果数据插入失败，设置视图指向错误页面 
				mav.setViewName("myJSP/error");
			}
			
			return mav;
		}
}
