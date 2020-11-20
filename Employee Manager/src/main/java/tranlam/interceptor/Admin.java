package tranlam.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import tranlam.model.Account;

public class Admin extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("loginForm", new Account());
		Account acc = (Account) session.getAttribute("account");
		if (acc.getAccess() == 2) {
			response.sendRedirect(request.getContextPath() + "/admin/login/");
		}
		System.out.println("AuthorizeInterceptor.preHandler()" + acc.getAccess()+"ssssssssssssssssssss");
		return true;
	}

}
