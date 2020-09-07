package egovframework.com.login.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	protected Log log = LogFactory.getLog(LoginController.class);
	
	@RequestMapping(value="/loginPage.do")
	public String loginPage() throws Exception {
		return "login/login";
	}
}
