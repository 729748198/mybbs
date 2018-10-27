package com.mybbs.hwj.service.login.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mybbs.hwj.dao.role.Base_infoMapper;
import com.mybbs.hwj.entity.login.Base_info;
import com.mybbs.hwj.service.login.Base_infoService;

@Service
public class Base_infoServiceImpl implements Base_infoService {
	
	
	@Resource
	Base_infoMapper mapper;
	
	@Override
	public int insert(Base_info record) {
		// TODO Auto-generated method stub
		return mapper.insert(record);
	}

	@Override
	public int insertSelective(Base_info record) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(record);
	}

}
