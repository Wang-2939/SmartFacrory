package com.xunteng.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xunteng.dao.MenuMapper;
import com.xunteng.pojo.MenuInfo;
import com.xunteng.pojo.UserInfo;

@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	MenuMapper menuMapper;
	@Override
	public List<MenuInfo> getMenu(UserInfo u) {
		return menuMapper.getMenu(u);
		
	}
	
	@Override
	public List<MenuInfo> getChildMenu() {
		return menuMapper.getChildMenu();
	}
	
}