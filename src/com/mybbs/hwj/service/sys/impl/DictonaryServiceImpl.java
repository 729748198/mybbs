package com.mybbs.hwj.service.sys.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mybbs.hwj.dao.sys.DictionaryMapper;
import com.mybbs.hwj.entity.sys.Dictionary;
import com.mybbs.hwj.service.sys.DictionaryService;

@Service
public class DictonaryServiceImpl implements DictionaryService {

	@Resource
	DictionaryMapper dictm;

	@Override
	public int deleteByPrimaryKey(Integer dictId) {
		// TODO Auto-generated method stub
		return dictm.deleteByPrimaryKey(dictId);
	}

	@Override
	public int insert(Dictionary record) {
		// TODO Auto-generated method stub
		return dictm.insert(record);
	}

	@Override
	public int insertSelective(Dictionary record) {
		// TODO Auto-generated method stub
		return dictm.insertSelective(record);
	}

	@Override
	public Dictionary selectByPrimaryKey(Integer dictId) {
		// TODO Auto-generated method stub
		return dictm.selectByPrimaryKey(dictId);
	}

	@Override
	public int updateByPrimaryKeySelective(Dictionary record) {
		// TODO Auto-generated method stub
		return dictm.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Dictionary record) {
		// TODO Auto-generated method stub
		return dictm.updateByPrimaryKey(record);
	}

	@Override
	public List<Dictionary> selectByGroup(String dictGroup) {
		// TODO Auto-generated method stub
		return dictm.selectByGroup(dictGroup);
	}

	
	
}
