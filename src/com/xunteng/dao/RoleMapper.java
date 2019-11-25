package com.xunteng.dao;

import java.util.List;

import com.xunteng.pojo.RoleInfo;
import com.xunteng.pojo.RoleMenu;

public interface RoleMapper {
	
	public List<RoleInfo> getRole();
	
	public int addRole(RoleInfo role);
	
	public int delRole(RoleInfo role);
	public int updateRole(RoleInfo role);
	
	public List<RoleMenu> getRoleMenu(RoleMenu role);
	
	public int addRoleMenu(RoleMenu role);
	public int delRoleMenu(RoleMenu role);
	
}
