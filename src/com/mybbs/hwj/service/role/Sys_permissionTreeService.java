package com.mybbs.hwj.service.role;

import java.util.List;

import com.mybbs.hwj.dao.role.Sys_permissionTreeMapper;
import com.mybbs.hwj.entity.role.Sys_permissionTree;

public interface Sys_permissionTreeService extends Sys_permissionTreeMapper {

	
	public List<Sys_permissionTree> checked (List<Sys_permissionTree> listParm,String roleName);
	
}
