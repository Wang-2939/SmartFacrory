package com.xunteng.dao;

import java.util.List;

import com.xunteng.pojo.MenuInfo;
import com.xunteng.pojo.UserInfo;

public interface MenuMapper {
	
	public List<MenuInfo> getMenu(UserInfo u);
	
	public List<MenuInfo> getChildMenu();
}
