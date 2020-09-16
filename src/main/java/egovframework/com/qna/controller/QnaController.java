package egovframework.com.qna.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmmn.util.CmmnUtil;
import egovframework.com.qna.service.QnaService;
import egovframework.com.qna.vo.QnaVo;
import egovframework.com.user.vo.UserVo;

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
			vo.setPagination(listCnt, curPage);
			vo.setPageSize(10);
			qnaList = qnaService.getQnaList(vo);
			model.addAttribute("qnaList",qnaList);
			model.addAttribute("pagination", vo);
		}catch(Exception e) {
			log.debug("QnaController > /getQnaPage.do > Exception");
		}
		return "qna/qnaList";
	}
	
	@RequestMapping(value="/qnaRegistPage.do")
	public String qnaRegistPage(ModelMap model) throws Exception{
		
		model.addAttribute("qnaVo", new QnaVo());
		return "qna/qnaRegist";
	}
	
	@RequestMapping(value="/qnaRegist.do", method = RequestMethod.POST)
	public String qnaRegist(QnaVo vo, HttpSession session, BindingResult bindingResult, HttpServletRequest request) throws Exception{

		try {
			UserVo userVo = (UserVo) session.getAttribute("login");
			
			vo.setQna_idx(qnaService.selectQnaIdx());
			vo.setCreate_user(userVo.getUser_id());
			qnaService.qnaRegist(vo);
		}catch(Exception e) {
			
		}
		return "redirect:/qna/qnaListPage.do";
	}
	
	@RequestMapping(value="/qnaDetail.do", method=RequestMethod.GET)
	public String qnaDetail(ModelMap model, @RequestParam("qna_idx") String qna_idx) throws Exception{
		QnaVo vo = new QnaVo();
		
		try {
			vo.setQna_idx(qna_idx);
			System.out.println("vo.getQna_idx() = " + vo.getQna_idx());
			qnaService.increaseViewCount(vo.getQna_idx());
			
			vo = qnaService.getQnaDetail(vo);
			
		}catch(Exception e){
			
		}
		model.addAttribute("qnaVo", vo);
		
		return "qna/qnaDetail";
	}
	
	@RequestMapping(value="/qnaDelete.do")
	public String qnaDelete(ModelMap model, @RequestParam("qna_idx") String qna_idx, HttpSession session) throws Exception{
		UserVo userVo = (UserVo) session.getAttribute("login");
		System.out.println(qnaService.getCreateUser(qna_idx) + ',' +userVo.getUser_id() );
		if(qnaService.getCreateUser(qna_idx).equals(userVo.getUser_id())) {
			qnaService.qnaDelete(qna_idx);
		}else {
		}
		return "redirect:/qna/qnaListPage.do";
	}
	
	@RequestMapping(value="/getBeforeQna.do")
	public ResponseEntity<?> getBeforeQna( @RequestParam("qna_idx") String qna_idx) throws Exception{
		QnaVo vo = new QnaVo();
		vo.setQna_idx(qna_idx);
		vo = qnaService.getBeforeQna(vo);
		
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}
	
	@RequestMapping(value="/getAfterQna.do")
	public ResponseEntity<?> getAfterQna( @RequestParam("qna_idx") String qna_idx) throws Exception{
		QnaVo vo = new QnaVo();
		vo.setQna_idx(qna_idx);
		vo = qnaService.getAfterQna(vo);
		
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}
	

}

































