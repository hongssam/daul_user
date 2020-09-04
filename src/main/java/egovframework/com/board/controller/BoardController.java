package egovframework.com.board.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	protected Log log = LogFactory.getLog(BoardController.class);
	
	@RequestMapping(value="/introPage.do")
	public String introPage() throws Exception {
		return "board/introMain";
	}
	
	@RequestMapping(value="/faqListPage.do")
	public String faqListPage() throws Exception {
		return "board/faqList";
	}
	
	@RequestMapping(value="/noticeListPage.do")
	public String noticeListPage() throws Exception {
		return "board/noticeList";
	}
	
	@RequestMapping(value="/qnaListPage.do")
	public String qnaListPage() throws Exception {
		return "board/qnaList";
	}
	
	@RequestMapping(value="/noticeDetailPage.do")
	public String noticeDetailpage() throws Exception {
		return "board/noticeDetail";
	}
	
	@RequestMapping(value="/qnaDetailPage.do")
	public String qnaDetailpage() throws Exception {
		return "board/qnaDetail";
	}
	
	@RequestMapping(value="/qnaRegistPage.do")
	public String qnaRegistPage() throws Exception {
		return "board/qnaRegist";
	}
	
	@RequestMapping(value="/qnaModifyPage.do")
	public String qnaModifyPage() throws Exception {
		return "board/qnaModify";
	}
}
