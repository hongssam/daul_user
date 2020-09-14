package egovframework.com.qna.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmmn.paging.Pagination;
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
	public String getQnaPage(ModelMap model, @RequestParam(defaultValue = "1") int curPage) throws Exception{
		List<QnaVo> qnaList = null;
		QnaVo vo = new QnaVo();
		try {
			int listCnt = qnaService.getQnaListCnt(vo);
			Pagination pagination = new Pagination(listCnt, curPage);
			vo.setStartIndex(pagination.getStartIndex());
			vo.setCntPerPage(pagination.getPageSize());
			qnaList = qnaService.getQnaList(vo);
			model.addAttribute("qnaList",qnaList);
			model.addAttribute("pagination", pagination);
		}catch(Exception e) {
			log.debug("QnaController > /getQnaPage.do > Exception");
		}
		return "qna/qnaList";
	}
}
