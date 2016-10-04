package kr.co.thinkpattern.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	//url 호출 후 request가 Controller에 도달하기 전에 미리 로그인이 되어있는지 체크한다.
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			
			HttpSession session = request.getSession();
			//로그인이 안된 상태이면 메인으로
			if(session.getAttribute("login") ==null){
				response.sendRedirect("/user/login");
				return false;
			}
			return true;
		}

}
