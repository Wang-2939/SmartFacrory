package com.xunteng.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthoriaztionInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//获取session对象
		//在拦截器中不能使用@SessionAttribute注解获取session的值，@SessionAttribute注解只能在控制器中使用
		//在拦截器中使用request对象获取session对象
		HttpSession session = request.getSession();
		//根据登录时，存session数据的名称，获取session对象中的值
		Object name = session.getAttribute("name");
		if(name==null) {
			//转发到网页
			request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			//name为空说明session中没有数据，说明没有登录，返回false,不允许调用控制器
			return false;
		}else {
			return true;
		}
	}
	
}
