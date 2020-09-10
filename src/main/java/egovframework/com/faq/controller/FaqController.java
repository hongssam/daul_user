package egovframework.com.faq.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/faq")
public class FaqController {
	protected Log log = LogFactory.getLog(FaqController.class);
	
	@RequestMapping(value="/faqListPage.do")
	public String faqListPage(ModelMap model) throws Exception{
		
		
		return "faq/faqList";
	}

}
