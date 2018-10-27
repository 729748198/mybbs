package com.mybbs.hwj.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//@Controller注解声明该类为Spring控制类，继而通过@requestMapping注解声明的路径映射
//如果不使用@Controller注解，@requestMapping注解也会失效
@Controller
public class MyfirstController {
	 //@RequestMapping注解用来声明路径映射，可以用于类或方法上
     //该注解映射路径为http://127.0.0.1:8080/mrbbs/myTest
	//通过浏览器输入路径便能够访问到这个方法
	@RequestMapping(value="/myTest")
	public ModelAndView myTest(){
        //设置视图"myJSP/test01"，指向工程路径WebContent→WEB-INF→view→myJSP→test01.jsp文件
        //在com.mrkj.ygl.config.WebConfig.java文件定义了jsp视图等
         ModelAndView mav = new ModelAndView("myJSP/test01");		
        //返回ModelAndView对象会跳转至对应的视图文件。也将设置的参数同时传递至视图
	    return mav; 
	}
}

