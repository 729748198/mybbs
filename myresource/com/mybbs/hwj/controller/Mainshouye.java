package com.mybbs.hwj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mybbs.hwj.entity.login.Sys_login;
import com.mybbs.hwj.service.SecondPageService;
import com.mybbs.hwj.service.forum.impl.ForumServiceImpl;

@Controller
public class Mainshouye {

	@Resource
	ForumServiceImpl fS;
	@RequestMapping(value="/fatie")
	public ModelAndView myTest(HttpServletRequest request,
			@RequestParam(name="page",defaultValue="1") Integer page,
			@RequestParam(name="row",defaultValue="40") Integer row){
        
		ModelAndView mav = new ModelAndView("myJSP/fatie");
		//获取main 与 info
		String mainType="php";
		//获取main 与 info
		List<Map<String, Object>> mainContents = fS.getMainPage(mainType, (page-1)*row, row);
		mav.addObject("main", mainContents);
		System.out.println(mainContents);
		//获取总共多少帖子
		Long count = fS.getMainCount(mainType);
		System.out.println(mainType);
		Map<String,String> parm = new HashMap<String, String>();
		//参数回传
		parm.put("mainType", mainType);//参数回传
		//分页
		String pageHtml = fS.getPage(count, page, row,parm);
		mav.addObject("pageHtml", pageHtml);
		
        //返回ModelAndView对象会跳转至对应的视图文件。也将设置的参数同时传递至视图
	    return mav; 
	}
	@RequestMapping(value="/saveshouyeContent")
	public ModelAndView saveMain (HttpServletRequest request,String mainFlag,String content,String mainTitle,String mainType){
		ModelAndView mav = new ModelAndView();
		mainType="index";
		mainFlag="default";
		HttpSession session = request.getSession();
		System.out.println("进入后台");
		System.out.println(mainTitle+" "+mainFlag+" "+mainType+" "+content);
		Sys_login userEntity = (Sys_login)session.getAttribute("loginEntity");
		
		System.out.println(userEntity.toString());
		
		fS.insertMain(UUID.randomUUID().toString(), mainTitle, mainFlag, mainType, content, userEntity.getUsername(), 5, "n", userEntity.getWxname(), 0);
		
		System.out.println("插入成功");
		return mav;
	}
}
