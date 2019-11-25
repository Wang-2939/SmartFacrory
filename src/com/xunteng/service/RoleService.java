package com.xunteng.service;

import java.util.List;

import com.xunteng.pojo.RoleInfo;
import com.xunteng.pojo.RoleMenu;

public interface RoleService {
	
	public List<RoleInfo> getRole();
	public int addRole (RoleInfo role);
	public int delRole (RoleInfo role);
	public int updateRole (RoleInfo role);
	
	public List<RoleMenu> getRoleMenu(RoleMenu role);
	
	public int updateRoleMenu (RoleMenu role,String menuIds);
}
