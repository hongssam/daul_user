package egovframework.com.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.main.service.MainService;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value = "/main/*")
public class MainController {

	@Resource(name = "mainService")
	private MainService mainService;
	
	@RequestMapping(value = "/main.do")
	public String home(ModelMap model) throws Exception{
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "main/main";
	}
	

	@RequestMapping(value = "/main2.do")
	public String home2(ModelMap model) throws Exception{
		System.out.println("main controller2");
		
		try {

			
			List<Map<String, String>> dummyList = mainService.selectDummyList();
			System.out.println("dummyList >>> " + dummyList);
			
			model.addAttribute("resultList", dummyList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "main/main";
	}
}
