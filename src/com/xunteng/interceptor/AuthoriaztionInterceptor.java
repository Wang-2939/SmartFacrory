package com.xunteng.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthoriaztionInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//��ȡsession����
		//���������в���ʹ��@SessionAttributeע���ȡsession��ֵ��@SessionAttributeע��ֻ���ڿ�������ʹ��
		//����������ʹ��request�����ȡsession����
		HttpSession session = request.getSession();
		//���ݵ�¼ʱ����session���ݵ����ƣ���ȡsession�����е�ֵ
		Object name = session.getAttribute("name");
		if(name==null) {
			//ת������ҳ
			request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			//nameΪ��˵��session��û�����ݣ�˵��û�е�¼������false,��������ÿ�����
			return false;
		}else {
			return true;
		}
	}
	
}
