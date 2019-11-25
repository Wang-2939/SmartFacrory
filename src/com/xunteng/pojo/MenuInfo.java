package com.xunteng.pojo;

public class MenuInfo {
	private int menuId;
	private String menuName;
	private String icon;
	private String url;
	private int parentId;
	private int menuType;
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public int getMenuType() {
		return menuType;
	}
	public void setMenuType(int menuType) {
		this.menuType = menuType;
	}
	
}
