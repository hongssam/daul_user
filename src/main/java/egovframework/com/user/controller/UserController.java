package egovframework.com.user.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/user")
public class UserController {
	protected Log log = LogFactory.getLog(UserController.class);
	
	@RequestMapping(value="/userRegistTermPage.do")
	public String userRegistTermPage() throws Exception {
		return "user/userRegistTerm";
	}
	
	@RequestMapping(value="/userRegistAuthPage.do")
	public String userRegistAuthPage() throws Exception {
		return "user/userRegistAuth";
	}
	
	@RequestMapping(value="/userRegistPage.do")
	public String userRegistPage() throws Exception {
		return "user/userRegist";
	}
	
	@RequestMapping(value="/userRegistCmplPage.do")
	public String userRegistCmplPage() throws Exception {
		return "user/userRegistCmpl";
	}
}
