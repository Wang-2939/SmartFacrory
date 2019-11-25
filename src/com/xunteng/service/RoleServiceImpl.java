package com.xunteng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xunteng.dao.RoleMapper;
import com.xunteng.pojo.RoleInfo;
import com.xunteng.pojo.RoleMenu;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	RoleMapper roleMapper;
	
	@Override
	public List<RoleInfo> getRole(){
		return roleMapper.getRole();
	}

	@Override
	public int addRole(RoleInfo role) {
		return roleMapper.addRole(role);
	}


	@Override
	public int delRole(RoleInfo role) {
	return roleMapper.delRole(role);
		}

	@Override
	public int updateRole(RoleInfo role) {
		return roleMapper.updateRole(role);
	}

	@Override
	public List<RoleMenu> getRoleMenu(RoleMenu role) {
		return roleMapper.getRoleMenu(role);
	}

	@Override
	public int updateRoleMenu(RoleMenu role,String menuIds) {
		roleMapper.delRoleMenu(role);
		String[] arr=menuIds.split(",");
		int result = 0;
		for(int i=0;i<arr.length;i++) {
			role.setMenuId(Integer.parseInt(arr[i]));
			roleMapper.addRoleMenu(role);
			result++;
		}
		return result;
	};
}
