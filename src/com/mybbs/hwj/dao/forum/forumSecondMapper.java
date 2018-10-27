package com.mybbs.hwj.dao.forum;

import com.mybbs.hwj.entity.forum.forumSecond;

public interface forumSecondMapper {
    int deleteByPrimaryKey(String secId);

    int insert(forumSecond record);

    int insertSelective(forumSecond record);

    forumSecond selectByPrimaryKey(String secId);

    int updateByPrimaryKeySelective(forumSecond record);

    int updateByPrimaryKeyWithBLOBs(forumSecond record);

    int updateByPrimaryKey(forumSecond record);
}