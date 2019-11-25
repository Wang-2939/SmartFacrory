package com.xunteng.controller;

import java.awt.AWTException;
import java.awt.Robot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.xunteng.pojo.UserInfo;
import com.xunteng.service.UserService;

@Controller
@RequestMapping("/login")
@SessionAttributes(names={"name"},types= {String.class})
public class LoginController {
	
	//自动装配业务逻辑层
	@Autowired
	UserService userService;
	//调用登录界面
	@RequestMapping("/toLogin")
	public String toLogin() {
		return "login";
	}
	
	@RequestMapping("/doLogin")
	public String doLogin(UserInfo user,Model model) throws Exception {
		Robot r = new Robot();
		r.delay(800);
		boolean result=userService.isLogin(user);
		if(result) {
			model.addAttribute("name", user.getName());
			return "redirect:/home/toIndex";
		}else {
			return "login";
		
		}
	}
}
