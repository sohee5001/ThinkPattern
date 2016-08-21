package kr.co.thinkpattern.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.thinkpattern.controller.UserController;
import kr.co.thinkpattern.vo.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	 private static final String LOGIN = "login";
	 private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	 
	 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		
		Object userVO = modelMap.get("userVO");
		System.out.println("aaaabbbb"+userVO);
		
		
		if(userVO != null)
		{
			logger.info("new login success");
			session.setAttribute(LOGIN, userVO);
			 response.sendRedirect("/");
			 
		}
		else
		{
	
			logger.info("wrong");
			
			response.sendRedirect("/user/loginFail");
		}

	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN)!= null)
		{
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		
		// TODO Auto-generated method stub
		return super.preHandle(request, response, handler);
	}
	
}
