package com.mybbs.hwj.dao.role;

import java.util.List;

import com.mybbs.hwj.entity.role.Sys_permissionTree;

public interface Sys_permissionTreeMapper {
    
	List<Sys_permissionTree> selectAll();
	
	int deleteByPrimaryKey(Integer id);
	
}