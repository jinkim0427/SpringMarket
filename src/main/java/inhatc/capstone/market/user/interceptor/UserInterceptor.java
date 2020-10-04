package inhatc.capstone.market.user.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter {
	  
	 @Override
	 public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		 try {
			 if (request.getSession().getAttribute("loginInfo") == null) {
				 response.sendRedirect(request.getContextPath() + "/home.do");
				 return false;
			 }
			 else {
				 return true;
			 }
		 } 
		 catch (Exception e) {
			 e.printStackTrace();
		 }  
		 return super.preHandle(request, response, handler);
	 }
	 
	 @Override
	 public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		 super.postHandle(request, response, handler, modelAndView);
	 }
}

