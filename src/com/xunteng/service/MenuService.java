package com.xunteng.service;

import java.util.List;

import com.xunteng.pojo.MenuInfo;
import com.xunteng.pojo.UserInfo;

public interface MenuService {
	public List<MenuInfo> getMenu(UserInfo u);
	
	public List<MenuInfo> getChildMenu();
}
