package com.xunteng.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.xunteng.dao.UserMapper;
import com.xunteng.pojo.PageBean;
import com.xunteng.pojo.UserInfo;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper userMapper;
	@Override
	public boolean isLogin(UserInfo user) {
		
		UserInfo userInfo= userMapper.getUserByNameAndPwd(user);
				if(userInfo!=null) {
					return true;
				}else {
					return false;
				}
	}
	
	//��ҳ
	@Override
	public PageBean<UserInfo> getUserList(UserInfo user, int pageNum, int pageSize) {
		// TODO �Զ����ɵķ������
		int total =userMapper.getUserCount(user);
		
		int totalPage = (int)Math.ceil((float)total/(float)pageSize);
		RowBounds row = new RowBounds((pageNum-1)*pageSize,pageSize);
		List<UserInfo> list = userMapper.getUserList(user, row);
		PageBean<UserInfo> pageBean = new PageBean<UserInfo>();
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		return pageBean;
		
	}
	
	@Override
	public int addUser(UserInfo user,MultipartFile file,HttpServletRequest request) {
		//��ȡԭʼ�ļ���
		String oldName = file.getOriginalFilename();
		//��ȡ��չ��
		String extName=oldName.substring(oldName.lastIndexOf("."));
		//ʹ��UUID��ͨ��Ψһʶ����
		String newName = UUID.randomUUID().toString()+extName;
		//���·��
		String path = "/WEB-INF/resources/photo/"+newName;
		String realPath=request.getServletContext().getRealPath(path);
		System .out.println(realPath);
		
		try {
			file.transferTo(new File(realPath));
		} catch (IllegalStateException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		} catch (IOException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		user.setPhotoUrl("photo/"+newName);
		
		user.setPassword("123456");
		user.setEnteringTime(new Date());
		return userMapper.addUser(user);
	}
	
	@Override
	public int delUser(UserInfo user,HttpServletRequest request) {
		UserInfo u=userMapper.getUserById(user);
		String path="/WEB-INF/resources/"+u.getPhotoUrl();
		String realPath=request.getServletContext().getRealPath(path);
		
		if(u.getPhotoUrl()!=null) {
			File file=new File(realPath);
			if(file.exists()) {
				file.delete();
			}
		}
		return userMapper.delUser(user);
	}
	
	@Override
	public UserInfo getUserById(UserInfo user) {
		// TODO �Զ����ɵķ������
		return userMapper.getUserById(user);
	}
	
	
	@Override
	public int updateUser(UserInfo user,MultipartFile file,HttpServletRequest request) {
		if(! file.isEmpty()) {
			String path="/WEB-INF/resources/"+user.getPhotoUrl();
			String realPath=request.getServletContext().getRealPath(path);
			try {
				file.transferTo(new File(realPath));
			} catch (IllegalStateException e) {
				// TODO �Զ����ɵ� catch ��
				e.printStackTrace();
			} catch (IOException e) {
				// TODO �Զ����ɵ� catch ��
				e.printStackTrace();
			}
		}
		
		return userMapper.updateUser(user);
	}

	@Override
	public int updatePwd(UserInfo user) {
		// TODO �Զ����ɵķ������
		return userMapper.updatePwd(user);
	}

	@Override
	public int getUserByName(UserInfo user) {
		// TODO �Զ����ɵķ������
		return userMapper.getUserByName(user);
	}

}
