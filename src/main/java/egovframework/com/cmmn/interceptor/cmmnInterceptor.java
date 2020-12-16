package egovframework.com.cmmn.interceptor;

import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.com.cmmn.util.LogVo;
import egovframework.com.user.service.UserService;
import egovframework.com.user.vo.UserVo;

public class cmmnInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	protected Log log = LogFactory.getLog(cmmnInterceptor.class);
	
	@Resource(name="userService")
	private UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String requestURI = request.getRequestURI();
		Enumeration params = request.getParameterNames();

		HttpSession session = request.getSession();
		UserVo userVo = (UserVo) session.getAttribute("login");
		
		try {
			LogVo logVo = new LogVo();
			
			//로그저장 
			HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			String ip = req.getHeader("X-FORWARDED-FOR");
			
			if (ip == null) {
				ip = req.getRemoteAddr();
			}
			
			logVo.setIp(ip);
			logVo.setRequestURI(requestURI);
			
			try {
				logVo.setUser_id(userVo.getUser_id());
			}catch(NullPointerException e) {
				logVo.setUser_id("-");
			}
			
			userService.saveUserLog(logVo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    String idx_param = "";
		    
		    if(name.indexOf("_idx") > -1) {
		    	 requestURI += "?"+ name + "=" +request.getParameter(name);
		    }
		   
		    System.out.println(idx_param);
		    
		    if(name.equals("ch") && request.getParameter(name).equals("kakao")) {
		    	if(userService.chkKakaoKey(request.getParameter("user_key")) == 0) {
		    		response.sendRedirect("/login/insertPhoneNumber.do?user_key=" + request.getParameter("user_key")+"&forward=" + requestURI);
		    		return false;
		    	}else {
		    		//바로 로그인
		    		response.sendRedirect("/login/kakaoLogin.do?ch=kakao&user_key=" + request.getParameter("user_key") +"&forward=" + requestURI + idx_param);
		    		return false;
		    	}
		    }
		}

			
		if(log.isDebugEnabled()) {
		
			log.debug(" ============= start ==============");
			log.debug("Request URI \t :" + requestURI);
			
		}
		
		HttpSession httpSession = request.getSession();
		
		try {
//			//비로그인 상태시 무조건 로그인페이지로 이동
//			if (httpSession.getAttribute(LOGIN) == null) {
//				log.debug(" =============비로그인==============");
//				response.sendRedirect("/login/loginPage.do");
//				return false;
//			}
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
