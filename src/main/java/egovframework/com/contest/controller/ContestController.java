package egovframework.com.contest.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/contest")
public class ContestController {
	protected Log log = LogFactory.getLog(ContestController.class);
	
	@RequestMapping(value="/contestListPage.do")
	public String contestListPage() throws Exception {
		return "contest/contestList";
	}
	
	@RequestMapping(value="/contestDetailPage.do")
	public String contestDetailPage() throws Exception {
		return "contest/contestDetail";
	}
}
