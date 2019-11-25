package com.xunteng.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.xunteng.pojo.MenuInfo;
import com.xunteng.pojo.UserInfo;
import com.xunteng.service.MenuService;


@Controller
@RequestMapping("/home")
public class HomeController {
	
	@RequestMapping("/toIndex")
	public String toIndex() {
		return "index";
	}
	@Autowired
	MenuService menuService;
	
	@RequestMapping("getMenu")
	@ResponseBody
	public List<MenuInfo> getMenu(@SessionAttribute("name") String name) {
		UserInfo u = new UserInfo();
		u.setName(name);
		return menuService.getMenu(u);
	}
	
	@RequestMapping("getChildMenu")
	@ResponseBody
	public List<MenuInfo> getChildMenu() {
		return menuService.getChildMenu();
	}
}

