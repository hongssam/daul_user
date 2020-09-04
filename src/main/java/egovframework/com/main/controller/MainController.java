package egovframework.com.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/main")
public class MainController {

	@RequestMapping(value = "/mainPage.do")
	public String maingPage() throws Exception{
		return "main/main";
	}
}
