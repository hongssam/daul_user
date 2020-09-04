package egovframework.com.suggestion.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/suggestion")
public class SuggestionController {
	protected Log log = LogFactory.getLog(SuggestionController.class);

	@RequestMapping(value="/suggestionListPage.do")
	public String suggestionListPage() throws Exception {
		return "suggestion/suggestionList";
	}
	
	@RequestMapping(value="/suggestionDetailPage.do")
	public String suggestionDetailPage() throws Exception {
		return "suggestion/suggestionDetail";
	}
	
	@RequestMapping(value="/suggestionRegistPage.do")
	public String suggestionRegistPage() throws Exception {
		return "suggestion/suggestionRegist";
	}
}
