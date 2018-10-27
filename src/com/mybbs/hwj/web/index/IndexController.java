package com.mybbs.hwj.web.index;

import java.util.ArrayList;
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

import com.mybbs.hwj.component.ForumComponent;
import com.mybbs.hwj.entity.forum.forumMain;
import com.mybbs.hwj.entity.login.Sys_login;
import com.mybbs.hwj.entity.sys.Dictionary;
import com.mybbs.hwj.service.forum.impl.ForumServiceImpl;
import com.mybbs.hwj.service.sys.DictionaryService;

@Controller
public class IndexController {

	@Resource
	DictionaryService dictS;
	
	@Resource
	ForumServiceImpl forS;
	
	@Resource
	ForumComponent fc;
	
	@Resource
	ForumServiceImpl fS;
	
	@RequestMapping(value={"/index","/index.do","/index.html","index.action"})
	public ModelAndView initIndex (HttpServletRequest request,
			@RequestParam(name="page",defaultValue="1") Integer page,
			@RequestParam(name="row",defaultValue="40") Integer row){
		ModelAndView mav = new ModelAndView("index");
		
		String forumList = fc.getForumList();

		String[] forums = forumList.split(",");
		
		List<Map<String,List<forumMain>>> top5s = new ArrayList<>();
		
		for (String tempStr : forums ){
			List<Dictionary> forumTypes = dictS.selectByGroup(tempStr);
	
			mav.addObject(tempStr, forumTypes);
			for (Dictionary tempEntity : forumTypes){
				String typeKey = tempEntity.getDictKey();
				List<forumMain> top5  = forS.getRecommendTop5(typeKey);
					
				if (top5!=null&&top5.size()>0){
					Map<String,List<forumMain>> top5Map = new HashMap<>();
					top5Map.put(typeKey, top5);
					top5s.add(top5Map);
				}
			}
		}

		
		/*
		 * 加载灌水专区
		 */
		mav.addObject("top5s", top5s);
		//获取main 与 info
				String mainType="index";
				//获取main 与 info
				List<Map<String, Object>> mainContents = fS.getMainPage(mainType, (page-1)*row, row);
				mav.addObject("main", mainContents);
	
				//获取总共多少帖子
				Long count = fS.getMainCount(mainType);
				Map<String,String> parm = new HashMap<String, String>();
				//参数回传
				parm.put("mainType", mainType);//参数回传
				//分页
				String pageHtml = fS.getPage(count, page, row,parm);
	
				mav.addObject("pageHtml", pageHtml);
				
				
		return mav;
	}
	/*
	 * 灌水专区发帖保存
	 */
	@RequestMapping(value="/saveshouyeContent1")
	public ModelAndView saveMain (HttpServletRequest request,String mainFlag,String content,String mainTitle,String mainType){
		ModelAndView mav = new ModelAndView("redirect:/index");
		mainType="index";
		mainFlag="default";
		HttpSession session = request.getSession();


		Sys_login userEntity = (Sys_login)session.getAttribute("loginEntity");
		

		
		fS.insertMain(UUID.randomUUID().toString(), mainTitle, mainFlag, mainType, content, userEntity.getUsername(), 5, "n", userEntity.getWxname(), 0);
		
		
		return mav;
	}
	
}
