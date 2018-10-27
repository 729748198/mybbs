package com.mybbs.hwj.service.role;

import com.mybbs.hwj.dao.role.Sys_role_permissionMapper;

public interface Sys_role_permissionService extends Sys_role_permissionMapper{

	public int updateRolPer(String roleName,Integer roleId,String[] splitParm);
	
}
