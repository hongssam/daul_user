package egovframework.com.faq.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmmn.interceptor.cmmnInterceptor;
import egovframework.com.cmmn.util.CmmnUtil;
import egovframework.com.faq.service.FaqService;
import egovframework.com.faq.vo.FaqVo;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value="/faq")
public class FaqController {
	protected Log log = LogFactory.getLog(cmmnInterceptor.class);
	
	@Resource(name = "faqService")
	private FaqService faqService;
	
	@Resource(name = "cmmnUtil")
	private CmmnUtil cmmnUtil;
	
	@RequestMapping(value = "/faqListPage.do")
	public String suggestionListPage() {
		return "faq/faqList";
	}
	
	@RequestMapping(value="/getFaqList.do", method = RequestMethod.GET)
	public  ResponseEntity<?> faqList(ModelMap model, FaqVo vo) throws Exception{
		List<FaqVo> faqList = faqService.selectFaqList(vo);
		try{
			
			model.addAttribute("faqList",faqList);
		}catch(Exception e){
			log.debug("FaqController > /faqList.do > Exception");
		}
		
		return new ResponseEntity<>(faqList, HttpStatus.OK);
	}

	@RequestMapping(value = "/faqWrite.do", method = RequestMethod.GET)
	public String faqWrite(ModelMap model) throws Exception {
		model.addAttribute("faqVo", new FaqVo());
		return "faq/faqWrite";
	}
	
	@RequestMapping(value="/insertFaq.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity insertFaq(HttpSession session,FaqVo vo , BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			
			FaqValidator faqValidator = new FaqValidator();
			faqValidator.validate(vo, bindingResult);
			
			if(bindingResult.hasErrors()) {
				return new ResponseEntity<>(cmmnUtil.getValid(bindingResult), HttpStatus.OK);
			}
			
	       if((vo.getQuestion().equals(null)||vo.getQuestion().equals("")) || (vo.getAnswer().equals(null)||vo.getAnswer().equals("")) ) {
	    	   throw new Exception(); 
	       }
		   UserVo userVo = (UserVo) session.getAttribute("login");
	       String sessionUser = userVo.getUser_id();
	       vo.setCreate_user(sessionUser);
	       vo.setUpdate_user(sessionUser);
	       faqService.insertFaq(vo);
			
			return new ResponseEntity<>("success", HttpStatus.OK);
		}catch(Exception e) {
			return new ResponseEntity<>("error.", HttpStatus.OK);
		}		
	}
	
	@RequestMapping(value="/updateFaq.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity updateFaq(HttpSession session, FaqVo vo, BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			
			FaqValidator faqValidator = new FaqValidator();
			faqValidator.validate(vo, bindingResult);
			
			if(bindingResult.hasErrors()) {
				return new ResponseEntity<>(cmmnUtil.getValid(bindingResult), HttpStatus.OK);
			}
			
		       if((vo.getQuestion().equals(null)||vo.getQuestion().equals("")) || (vo.getAnswer().equals(null)||vo.getAnswer().equals("")) ) {
		    	   throw new Exception(); 
		       }
			   UserVo userVo = (UserVo) session.getAttribute("login");
		       String sessionUser = userVo.getUser_id();
		       vo.setCreate_user(sessionUser);
		       vo.setUpdate_user(sessionUser);
		       faqService.updateFaq(vo);
			
			return new ResponseEntity<>("success", HttpStatus.OK);
		}catch(Exception e) {
			return new ResponseEntity<>("error.", HttpStatus.OK);
		}		
	}
	
	@RequestMapping(value="/deleteFaq.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity deleteFaq(HttpSession session, @ModelAttribute FaqVo vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			
			   UserVo userVo = (UserVo) session.getAttribute("login");
		       String sessionUser = userVo.getUser_id();
		       if((!vo.getCreate_user().equals(sessionUser))) {
		    	   throw new Exception();
		       }
		       vo.setCreate_user(sessionUser);
		       vo.setUpdate_user(sessionUser);
		       faqService.deleteFaq(vo);
			
			return new ResponseEntity<>("success", HttpStatus.OK);
		}catch(Exception e) {
			return new ResponseEntity<>("error.", HttpStatus.OK);
		}		
	}
	
}
