package com.mybbs.hwj.service;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
@Service
public class SecondPageService {

	@Resource
	JdbcTemplate jdbc;
	
	public Map<String, Object> getMainSecond(String mainId, Integer start, Integer offset) {
		// TODO Auto-generated method stub
		

		//查询主贴
		String sql_select_mymain="select main_id,main_title,"
				+"main_content,DATE_FORMAT(main_creatime,'%Y年%m月%d日  %h点%i分%s秒') "
				+"as main_creatime,main_creatuser,"
				+"main_commend from my_main where main_id=?";
		//查询跟帖
		String sql_select_mysecond="select sec_id,main_id,"
				+"sec_content,DATE_FORMAT(sec_creatime,'%Y年%m月%d日  %h点%i分%s秒') "
				+"as sec_creatime,sec_creatuser,sec_sequence "
				+"from my_second where main_id= ? ORDER BY sec_creatime "
				+"LIMIT ?,?";
		//获取主贴信息
		Map<String, Object>mainContent=jdbc.queryForMap(sql_select_mymain,mainId);
	
		//判断主贴是否存在,如果存在查找跟帖
		if(mainContent!=null) {
			List<Map<String, Object> >seconds
			=jdbc.queryForList(sql_select_mysecond,mainId,start,offset);
		
			mainContent.put("seconds", seconds);
		}
		
		return mainContent;
	}

	public Long getSecondCount(String mainId) {
		// TODO Auto-generated method stub
		//count关键字查询总条数
		String sql_select_mymain="select count(sec_id) as count from my_second where main_id=?";
		
		return (Long)jdbc.queryForMap(sql_select_mymain,mainId).get("count");
	}

	public int saveSecondPage (String main_id,String content,String creatuser){
		String sql_insert_mysecond = "insert INTO my_second "
		+ "(sec_id,main_id,sec_content,sec_creatime,sec_creatuser,sec_sequence) "
		+ "VALUES (?,?,?,now(),?,'1')";

		return jdbc.update(sql_insert_mysecond,UUID.randomUUID().toString(),
				main_id,content,creatuser);
	}

		//count：数据库当中数据总条数
	 	//currentPage：当前页数
	 	//offset：每页显示多少条数护具
	 	//parm：附加参数	
	 	public String getPage (Long count,Integer currentPage,
	                                  Integer offset,Map<String,String> parm){
			//将当前页数转换为Long类型，统一类型方便计算
			Long currentLong = Long.parseLong(currentPage+"");
	 		//记录总页数，初始化给定值为0L。因为是长整形所以要在数字后面加L 
			Long countPage = 0L;
			//计算总页数，根据数据库数据总条数与每页显示数，计算总页数
	 		//使用求余运算，判断是否整除，如果整除，使用总条数除以每页记录数，得出总页数
	 		//如果没有整除那么证明有余数，使用总条数除以每页记录数加一得出总页数
			if(count%offset!=0){
				countPage = count/offset+1;
			}else{
				countPage = count/offset;
			}
			//将parm里的参数拼接成URL参数
			StringBuffer sbParm = new StringBuffer("");

			//判断parm是否为空，设置额外附加参数
			if (parm!=null){
	 			//从Map类型获取entrySet，Entry是Map的一个元素，以键值对呈现
				Set<Entry<String, String>>  entrySet = parm.entrySet();
				//迭代Set获取Entry元素，将键作为参数名，值作为参数值拼接成URL参数
				for (Entry<String, String>  entry : entrySet){
					sbParm.append("&"+entry.getKey()+"="+entry.getValue());
				}
				
			}
			
			StringBuffer sb = new StringBuffer();
	 		//前一页，判断当前页数是否大于1
			if (currentPage> 1){
	 			//大于1的话，前一页就等于当前页减1
				sb.append("<span class=\"page\"> <a href=\"?page="+(currentPage-1));
				sb.append(sbParm);
				sb.append("\"> «</a> </span> ");
			}else{
	 			//不大于1的话，证明是第一页
				sb.append("<span class=\"page\"> <a href=\"?page=1");
	 			//增加URL参数
				sb.append(sbParm);
				sb.append("\"> «</a> </span> ");
			}
	 		//第一页
			sb.append("<span class=\"page\" style=\"width: 50px !important;\"> ");
			//连接永远指向第一页
			sb.append("<a href=\"?page=1");
	 		//增加URL参数
			sb.append(sbParm);
			sb.append("\"> start</a> ");
			sb.append("</span> ");
			//如果总页数减去当前页数大于5，那么证明可以显示5个分页
			if ((countPage-currentLong+1) >=5){
				for (Long i = currentLong ; i<currentPage+5;i++){
					sb.append("<span class=\"page\"> ");
					sb.append("<a href=\"?page="+i);
	 				//增加URL参数
					sb.append(sbParm);
					sb.append("\"> "+i+"</a> ");
					sb.append("</span> ");
				}
			}
	 		//如果总页数减4大于0那么证明总页数任然够5页
	 		else if (countPage-4 >  0){
				for (long i = countPage-4 ; i<= countPage;i++){
	 				//顺序迭代页面 
					sb.append("<span class=\"page\"> ");
					sb.append("<a href=\"?page="+i);
	 				//增加URL参数
					sb.append(sbParm);
					sb.append("\"> "+i+"</a> ");
					sb.append("</span> ");
				}
			}
	 		//否则总页数不够5页
	 		else{
				for (long i = 1 ; i<= countPage;i++){
	 				//顺序迭代页面
					sb.append("<span class=\"page\"> ");
					sb.append("<a href=\"?page="+i);
	 				//增加URL参数
					sb.append(sbParm);
					sb.append("\"> "+i+"</a> ");
					sb.append("</span> ");
				}
			}
			//增加最后一页
			sb.append("<span class=\"page\" style=\"width: 40px !important;\"> ");
	 		//这里使用了三目表达式，判断总页数是否为0，如果是0返回1否则返回总页数
			sb.append("<a href=\"?page="+(countPage==0?1:countPage));
	 		//增加URL参数
			sb.append(sbParm);
			sb.append("\"> end</a> ");
			sb.append("</span> ");
			//判断是否拥有下一页
			if (currentLong<countPage){
				sb.append("<span class=\"page\"> ");
	 			//如果满足条件下一页为当前页加1
				sb.append("<a href=\"?page="+currentLong+1);
				sb.append(sbParm);
				sb.append("\"> »</a> ");
				sb.append("</span> ");
			}else{
				sb.append("<span class=\"page\"> ");
	 			//为满足条件，下一页为当前页
				sb.append("<a href=\"?page="+currentLong);
				sb.append(sbParm);
				sb.append("\"> »</a> ");
				sb.append("</span> ");
			}
			
			sb.append("<span> ");
			sb.append("共"+countPage+"页");
			sb.append("</span> ");

			return sb.toString();
		}


}
