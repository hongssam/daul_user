package egovframework.com.cmmn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final String LOGIN = "login";
	protected Log log = LogFactory.getLog(LoginInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
//		HttpSession httpSession = request.getSession();
//		ModelMap modelMap = modelAndView.getModelMap();
//		Object subVo = modelMap.get("user");
//		
//		if(subVo != null) {
//			log.debug("new login success");
//			httpSession.setAttribute(LOGIN, subVo);
//			response.sendRedirect("/");
//		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession httpSession = request.getSession();
		//기존의 로그인 정보 제거
		if(httpSession.getAttribute(LOGIN) != null) {
			log.debug("clear login data before");
			httpSession.removeAttribute(LOGIN);
		}
		return true;
	}
}
