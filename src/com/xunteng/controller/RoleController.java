package com.xunteng.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xunteng.pojo.RoleInfo;
import com.xunteng.pojo.RoleMenu;
import com.xunteng.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Autowired
	RoleService roleService;
	
	@RequestMapping("/toRole")
	public String toRole() {
		return "RoleManager";
	}

	@RequestMapping("/getRole")
	@ResponseBody
	public List<RoleInfo> getRole(){
		return roleService.getRole();
		
	}
	
	@RequestMapping("/addRole")
	@ResponseBody
	public int addRole(RoleInfo role){
		return roleService.addRole(role);
		
	}
	
	@RequestMapping("/delRole")
	@ResponseBody
	public int delRole(RoleInfo role){
		return roleService.delRole(role);
		
	}
	@RequestMapping("/updateRole")
	@ResponseBody
	public int updateRole(RoleInfo role){
		return roleService.updateRole(role);
		
	}
	
	@RequestMapping("/getRoleMenu")
	@ResponseBody
	public List<RoleMenu> getRoleMenu(RoleMenu role){
		return roleService.getRoleMenu(role);
		
	}
	
	@RequestMapping("/updateRoleMenu")
	@ResponseBody
	public int updateRoleMenu(RoleMenu role,String menuIds){
		return roleService.updateRoleMenu(role,menuIds);
		
	}
}
