package egovframework.com.qna.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmmn.util.CmmnUtil;
import egovframework.com.qna.service.QnaService;
import egovframework.com.qna.vo.QnaVo;

@Controller
@RequestMapping(value="/qna")
public class QnaController {
	protected Log log = LogFactory.getLog(QnaController.class);
	
	@Resource(name = "qnaService")
	private QnaService qnaService;
	
	@Resource(name = "cmmnUtil")
	private CmmnUtil cmmnUtil;
	
	@RequestMapping(value="/qnaListPage.do")
	public String getQnaPage(ModelMap model) throws Exception{
		List<QnaVo> qnaList = null;
		try {
			qnaList = qnaService.getQnaList();
			model.addAttribute("qnaList",qnaList);
		}catch(Exception e) {
			log.debug("QnaController > /getQnaPage.do > Exception");
		}
		
		return "qna/qnaList";
	}
}
