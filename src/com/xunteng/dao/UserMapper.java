package com.xunteng.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.xunteng.pojo.UserInfo;

public interface UserMapper {
	
	public UserInfo getUserByNameAndPwd (UserInfo user);
	
	public List<UserInfo> getUserList(UserInfo user, RowBounds row);

	public int getUserCount(UserInfo user);

	public int addUser(UserInfo user);
	
	public int delUser(UserInfo user);
	
	public UserInfo getUserById(UserInfo user);

	public int updateUser(UserInfo user);

	public int updatePwd(UserInfo user);

	public int getUserByName(UserInfo user);

	
	
}
