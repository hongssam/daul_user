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
	

}
