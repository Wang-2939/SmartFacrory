package com.xunteng.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.xunteng.pojo.PageBean;
import com.xunteng.pojo.RoleInfo;
import com.xunteng.pojo.UserInfo;
import com.xunteng.service.RoleService;
import com.xunteng.service.UserService;

@Controller
@RequestMapping("user")
public class UserContorller {
	
	@Autowired
	UserService userService;
	
	@Autowired
	RoleService roleService;
	
	@RequestMapping("/getUserList")
	@ResponseBody
	public PageBean<UserInfo> getUserList(UserInfo user, int pageNum, int pageSize){
		return userService.getUserList(user, pageNum, pageSize);
	}
	
	@RequestMapping("/toUser")
	public String toUser() {
		return "userManager";
	}
	
	@RequestMapping("/toAddUser")
	public String toAddUser() {
		return "addUser";
	}
	
	@RequestMapping("/addUser")
	public String addUser(UserInfo user,@RequestPart("img") MultipartFile file,HttpServletRequest request) {
		int result=userService.addUser(user,file,request);
		if(result>0){
			return "redirect:./toUser";
		}else {
			return "addUser";
		}
	}
	
	@RequestMapping("/delUser")
	@ResponseBody
	public int delUser(UserInfo user,HttpServletRequest request) {
		return userService.delUser(user,request);
	}
	
	@RequestMapping("/toUpdateUser/{id}")
	public String toUpdateUser(@PathVariable("id") int id,Model model) {
		UserInfo user = new UserInfo();
		user.setUserId(id);
		UserInfo u = userService.getUserById(user);
		model.addAttribute("updateUser",u);
		List<RoleInfo> roleList = roleService.getRole();
		model.addAttribute("roleList",roleList);
		return "updateUser";
	}
	
	@RequestMapping("/updateUser")
	public String updateUser(UserInfo user,@RequestPart("img") MultipartFile file,HttpServletRequest request) {
		int result=userService.updateUser(user,file,request);
		if(result>0){
			return "redirect:./toUser";
		}else {
			return "ad,HttpServletRequest requestdUser";
		}
	}
	
	@RequestMapping("/toUpdatePwd")
	public String toUpdatePwd() {
		return "updatePwd";
	}
	
	@RequestMapping("/oldPwdIsOk")
	@ResponseBody
	public boolean oldPwdIsOk(@SessionAttribute("name") String name,String pwd) {
		UserInfo user = new UserInfo();
		user.setName(name);
		user.setPassword(pwd);
		return userService.isLogin(user);
		
	}
	
	@RequestMapping("/updatePwd")
	@ResponseBody
	public int updatePwd(@SessionAttribute("name") String name,String pwd) {
		UserInfo user = new UserInfo();
		user.setName(name);
		user.setPassword(pwd);
		return userService.updatePwd(user);
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../login/toLogin";
	}
	
	@RequestMapping("/getUserByName")
	@ResponseBody
	public int getUserByName(UserInfo user) {
		return userService.getUserByName(user);
		
	}
}
