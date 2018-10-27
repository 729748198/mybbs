package com.mybbs.hwj.dao.forum;

import com.mybbs.hwj.entity.forum.forumInfo;

public interface forumInfoMapper {
    int deleteByPrimaryKey(Integer infoId);

    int insert(forumInfo record);

    int insertSelective(forumInfo record);

    forumInfo selectByPrimaryKey(Integer infoId);

    int updateByPrimaryKeySelective(forumInfo record);

    int updateByPrimaryKey(forumInfo record);
}