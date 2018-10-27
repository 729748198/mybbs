package com.mybbs.hwj.dao.role;

import java.util.List;

import com.mybbs.hwj.entity.role.Sys_role;
import com.mybbs.hwj.entity.role.Sys_roleTree;

public interface Sys_roleMapper {
    int deleteByPrimaryKey(Integer roleId);

    int insert(Sys_role record);

    int insertSelective(Sys_role record);

    Sys_role selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKeySelective(Sys_role record);

    int updateByPrimaryKey(Sys_role record);
    
    List<Sys_roleTree> selectTreeAll();
}