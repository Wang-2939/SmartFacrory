package com.xunteng.service;

import javax.servlet.http.HttpServletRequest;fffffawrwwrrfg
jhbbbfhhhhhhhhhhhhh

import org.springframework.web.multipart.MultipartFile;

import com.xunteng.pojo.PageBean;
import com.xunteng.pojo.UserInfo;

public interface UserService {
		public boolean isLogin(UserInfo User);
		public PageBean<UserInfo> getUserList(UserInfo user,int pageNum,int pageSize);
		
		public int addUser(UserInfo user, MultipartFile file,HttpServletRequest request);
		
		public int delUser(UserInfo user, HttpServletRequest request);
		
		public UserInfo getUserById(UserInfo user);
		
		public int updateUser(UserInfo user,MultipartFile file,HttpServletRequest request);
		public int updatePwd(UserInfo user);
		public int getUserByName(UserInfo user); 
}