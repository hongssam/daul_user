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
		List<FaqVo> faqListMain =null;
		List<FaqVo> faqListContest =null;
		List<FaqVo> faqListSurvey =null;
		List<FaqVo> faqListSuggestion =null;
		try {
			faqListMain = faqService.getFaqListMain();
			faqListContest = faqService.getFaqListContest();
			faqListSurvey = faqService.getFaqListSurvey();
			faqListSuggestion = faqService.getFaqListSuggestion();
			
			model.addAttribute("faqListContest", faqListContest);
			model.addAttribute("faqListSurvey", faqListSurvey);
			model.addAttribute("faqListSuggestion", faqListSuggestion);
			model.addAttribute("faqListMain", faqListMain);
		}catch(Exception e) {
			
		}
		
		return "faq/faqList";
	}

}
