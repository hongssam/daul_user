package egovframework.com.faq.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.faq.service.FaqService;
import egovframework.com.faq.vo.FaqVo;

@Controller
@RequestMapping(value="/faq")
public class FaqController {
	protected Log log = LogFactory.getLog(FaqController.class);
	
	@Resource(name="faqService")
	private FaqService faqService;
	
	@RequestMapping(value="/faqListPage.do")
	public String faqListPage(ModelMap model) throws Exception{
		List<FaqVo> faqList =null;
		try {
			faqList = faqService.getFaqList();
			model.addAttribute("faqList", faqList);
		}catch(Exception e) {
			
		}
		
		return "faq/faqList";
	}

}
