package com.mybbs.hwj.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mybbs.hwj.service.SecondPageService;

@Controller
public class SecondPageController {

	@Resource
	public SecondPageService sps;
	
	@RequestMapping(value="/secondPageContent")
	public ModelAndView goSecondPage(String mainId,
			@RequestParam(name="page",defaultValue="1") Integer page,
			@RequestParam(name="row",defaultValue="15") Integer row) {
		ModelAndView mav=new ModelAndView("myJSP/secondPage");
		//根据传过来的mainId查找my_main和my_second
		Map<String, Object> mainAndSecond=sps.getMainSecond(mainId,(page-1)*row,row);
		//将返回的值传递给JSP
	
		mav.addObject("mainAndSeconds", mainAndSecond);
		//获取跟帖总条数
		Long count=sps.getSecondCount(mainId);
	
		Map<String, String> parm=new HashMap<>();
		//将关系链——mainId传进去
		parm.put("mainId", mainId);
		//获取分页参数
		String pageHtml=sps.getPage(count,page,row,parm);
		
	
		mav.addObject("pageHtml",pageHtml);
		return mav;
	}
	
	@RequestMapping(value="/saveSecondPage")
	public ModelAndView saveSecondPage(HttpServletRequest request,
			String mainId,String content) {
		
		ModelAndView mav=new ModelAndView();
		String mainCreatuser=request.getRemoteAddr();
		
		int result=sps.saveSecondPage(mainId,content,mainCreatuser);
		if(result==1) {
			
			mav.setViewName("redirect:/secondPageContent?mainId="+mainId);
		}else {
			mav.setViewName("404");
		}
		return mav;
	}

}
