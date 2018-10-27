package com.mybbs.hwj.dao.sys;

import java.util.List;

import com.mybbs.hwj.entity.sys.Dictionary;

public interface DictionaryMapper {
    int deleteByPrimaryKey(Integer dictId);

    int insert(Dictionary record);

    int insertSelective(Dictionary record);

    Dictionary selectByPrimaryKey(Integer dictId);

    int updateByPrimaryKeySelective(Dictionary record);

    int updateByPrimaryKey(Dictionary record);
    
    List<Dictionary> selectByGroup (String dictGroup);
}