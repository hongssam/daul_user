package egovframework.com.login.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmmn.SecurityUtil;
import egovframework.com.login.service.LoginService;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	protected Log log = LogFactory.getLog(LoginController.class);

	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping(value="/loginPage.do")
	public String loginPage() {
		return "login/login";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity login(@ModelAttribute UserVo vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpHeaders resHeaders = new HttpHeaders();
		resHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		UserVo userVo = loginService.selectUser(vo);
		
		if (userVo == null) {
			// 존재하지 않는 사용자
			return new ResponseEntity<>("ID 또는 PASSWORD를 확인해주세요.", resHeaders, HttpStatus.OK);
		} else {
			SecurityUtil securityUtil = new SecurityUtil();
			String encryptPw = securityUtil.encryptSHA256(vo.getPwKey());
			
			if (encryptPw.equals(userVo.getPw())) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("login", userVo);
				
				return new ResponseEntity<>("success", resHeaders, HttpStatus.OK);
			} else {
				// 비번 틀림 
				return new ResponseEntity<>("ID 또는 PASSWORD를 확인해주세요.", resHeaders, HttpStatus.OK);
			}
		}
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:/main/main.do";
	}
}
