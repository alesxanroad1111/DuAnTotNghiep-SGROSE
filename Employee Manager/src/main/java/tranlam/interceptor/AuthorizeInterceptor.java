package tranlam.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import tranlam.model.Account;

import org.springframework.web.servlet.ModelAndView;

public class AuthorizeInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("loginForm", new Account());
		if (session.getAttribute("account") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/login/");
			return false;
		}
		System.out.println("AuthorizeInterceptor.preHandler()");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("AuthorizeInterceptor.postHandler()");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		System.out.println("AuthorizeInterceptor.afterCompletion()");
	}
}
