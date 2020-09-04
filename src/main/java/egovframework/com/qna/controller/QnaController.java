package egovframework.com.qna.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmmn.interceptor.cmmnInterceptor;
import egovframework.com.cmmn.util.CmmnUtil;
import egovframework.com.contest.vo.ContestVo;
import egovframework.com.qna.service.QnaService;
import egovframework.com.qna.vo.QnaVo;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value="/qna")
public class QnaController {
	protected Log log = LogFactory.getLog(cmmnInterceptor.class);
	
	@Resource(name = "qnaService")
	private QnaService qnaService;
	
	@Resource(name = "cmmnUtil")
	private CmmnUtil cmmnUtil;
	
	@RequestMapping(value="/getQnaList.do", method = RequestMethod.GET)
	public ResponseEntity<?> qnaList(ModelMap model, QnaVo vo) throws Exception{
		List<QnaVo> qnaList = null;
		try {
			qnaList = qnaService.selectQnaList(vo);
		}catch(Exception e) {
			log.debug("QnaController > /qnaList.do > Exception");
		}		
		
		return new ResponseEntity<>(qnaList, HttpStatus.OK);	
	}
	
	@RequestMapping(value = "/qnaListPage.do")
	public String suggestionListPage() {
		return "qna/qnaList";
	}
	
	
	@RequestMapping(value="/insertQnaReply",method = RequestMethod.POST)
	public ResponseEntity insertQnaReply(HttpSession session, QnaVo vo, BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response) throws Exception{
		try {
			QnaValidator qnaValidator = new QnaValidator();
			qnaValidator.validate(vo, bindingResult);
			
			if(bindingResult.hasErrors()) {
				return new ResponseEntity<>(cmmnUtil.getValid(bindingResult), HttpStatus.OK);
			}
			
			UserVo userVo = (UserVo) session.getAttribute("login");
		    String sessionUser = userVo.getUser_id();
		    vo.setCreate_user(sessionUser);
		    qnaService.insertQnaReply(vo);
		     
			
			return new ResponseEntity<>("success", HttpStatus.OK);
		}catch(Exception e) {
			return new ResponseEntity<>("error.", HttpStatus.OK);
		}
	}
	
	@RequestMapping(value="/updateQnaReply",method = RequestMethod.POST)
	public ResponseEntity updateQnaReply(HttpSession session, QnaVo vo, BindingResult bindingResult ,HttpServletRequest request, HttpServletResponse response) throws Exception{
		try {
			QnaValidator qnaValidator = new QnaValidator();
			qnaValidator.validate(vo, bindingResult);
			
			if(bindingResult.hasErrors()) {
				return new ResponseEntity<>(cmmnUtil.getValid(bindingResult), HttpStatus.OK);
			}
			
			UserVo userVo = (UserVo) session.getAttribute("login");
		    String sessionUser = userVo.getUser_id();
		    vo.setUpdate_user(sessionUser);

		    qnaService.updateQnaReply(vo);
			
			return new ResponseEntity<>("success", HttpStatus.OK);
		}catch(Exception e) {
			return new ResponseEntity<>("error.", HttpStatus.OK);
		}
	}
	
	@RequestMapping(value="/deleteQnaReply",method = RequestMethod.POST)
	public ResponseEntity deleteQnaReply(HttpSession session, @ModelAttribute QnaVo vo,HttpServletRequest request, HttpServletResponse response) throws Exception{
		try {
			System.out.println(vo);
			
			if(vo.getParent_qna_idx().equals(null)||vo.getParent_qna_idx().equals("")) {
				qnaService.deleteQnaAll(vo);
			}else {
				qnaService.deleteQnaReply(vo);
			}
			return new ResponseEntity<>("success", HttpStatus.OK);
		}catch(Exception e) {
			return new ResponseEntity<>("error.", HttpStatus.OK);
		}
	}
	
	@RequestMapping(value="/increaseViewCount",method = RequestMethod.GET)
	public ResponseEntity increaseViewCount(HttpSession session, @RequestParam("qna_idx") String qna_idx ,HttpServletRequest request, HttpServletResponse response) throws Exception{
		try {
			QnaVo qnaVo = new QnaVo();
			qnaVo.setQna_idx(qna_idx);
			
			qnaService.increaseViewCount(qnaVo);
			
			return new ResponseEntity<>("success", HttpStatus.OK);
		}catch(Exception e) {
			return new ResponseEntity<>("error.", HttpStatus.OK);
		}
	}
}
