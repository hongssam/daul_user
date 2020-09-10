package egovframework.com.cmmn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class cmmnInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	protected Log log = LogFactory.getLog(cmmnInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String requestURI = request.getRequestURI();
		
		if(log.isDebugEnabled()) {
		
			log.debug(" ============= start ==============");
			log.debug("Request URI \t :" + requestURI);
		}
		
		HttpSession httpSession = request.getSession();
		
		try {
			//비로그인 상태시 무조건 로그인페이지로 이동
			if (httpSession.getAttribute(LOGIN) == null) {
				log.debug(" =============비로그인==============");
				response.sendRedirect("/login/loginPage.do");
				return false;
			}
		} catch (Exception e) {
			
		}
		
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		try {
			if(log.isDebugEnabled()) {
				log.debug(" ============= end ==============");
				if (modelAndView != null) {
					log.debug("Response viewName : " + modelAndView.getViewName());
				}
			}
		}catch(Exception e) {
		
		}
		
		super.postHandle(request, response, handler, modelAndView);
	}

	
}
