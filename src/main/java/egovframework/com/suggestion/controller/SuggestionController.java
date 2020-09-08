package egovframework.com.suggestion.controller;

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

import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.suggestion.service.SuggestionService;
import egovframework.com.suggestion.vo.SuggestionOpinionVo;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value="/suggestion")
public class SuggestionController {
	protected Log log = LogFactory.getLog(SuggestionController.class);
	
	@Resource(name="fileUtil")
	private FileUtil fileUtil;
	
	@Resource(name="suggestionService")
	private SuggestionService suggestionService;

	@RequestMapping(value="/suggestionListPage.do")
	public String suggestionListPage(SuggestionVo vo, ModelMap model) throws Exception {
		try {
			log.debug("[열린제안] 열린제안 목록 조회");
			List<SuggestionVo> suggestionList = suggestionService.selectSuggestionList(vo);
			
			model.addAttribute("sgstList", suggestionList);
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 목록 조회 실패");
			e.printStackTrace();
		}
		
		log.debug("[열린제안] 열린제안 목록 조회 완료");
		return "suggestion/suggestionList";
	}
	
	@RequestMapping(value="/suggestionDetailPage.do")
	public String suggestionDetailPage(@RequestParam("suggestion_idx") String suggestion_idx, ModelMap model) throws Exception {
		try {
			log.debug("[열린제안] 열린제안 상세 조회");
			SuggestionVo suggestion = suggestionService.selectSuggestion(suggestion_idx);
			log.debug("[열린제안] 열린제안 상세 : " + suggestion);
			
			model.addAttribute("sgst", suggestion);
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 상세 조회 실패");
			e.printStackTrace();
		}
		
		log.debug("[열린제안] 열린제안 상세 조회 완료");
		return "suggestion/suggestionDetail";
	}
	
	@RequestMapping(value="/suggestionRegistPage.do")
	public String suggestionRegistPage(ModelMap model) throws Exception {
		model.addAttribute("suggestionVo", new SuggestionVo());
		
		return "suggestion/suggestionRegist";
	}
	
	@RequestMapping(value="/suggestionRegist.do", method=RequestMethod.POST)
	public String createSuggestion(SuggestionVo vo, HttpServletRequest request, BindingResult bindingResult, HttpSession session) throws Exception {
		try {
			SuggestionValidator suggestionValidator = new SuggestionValidator();
			suggestionValidator.validate(vo, bindingResult);
			
			if (bindingResult.hasErrors()) {
				return "suggestion/suggestionRegist";
			}
			
			log.debug("SuggestionVo : " + vo);
			String suggestionIdx = suggestionService.selectSuggestionIdx();
			vo.setSuggestion_idx(suggestionIdx);
			
			UserVo userVo = (UserVo) session.getAttribute("login");
			vo.setCreate_user(userVo.getUser_id());
			
			log.debug("[열린제안] 열린제안 등록");
			int result = suggestionService.registSuggestion(vo);
			log.debug("suggestion insert result : " + result);
			
			if (result > 0) {
				FileVo fileVo = new FileVo();
				
				fileVo.setCreate_user(vo.getCreate_user());
				fileVo.setIdx(vo.getSuggestion_idx());
				
				List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);

				log.debug("[열린제안] 열린제안 파일 등록");
				for(int i = 0; i<fileList.size(); i++) {
					suggestionService.insertFile(fileList.get(i));
				}
			}
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 등록 실패");
			e.printStackTrace();
		}
		
		log.debug("[열린제안] 열린제안 등록 완료");
		return "redirect:/suggestion/suggestionListPage.do";
	}
	
	@RequestMapping(value="/suggestionOpinionList.do")
	public ResponseEntity<?> suggestionOpinionList(@RequestParam("suggestion_idx") String suggestion_idx) throws Exception {
		List<SuggestionOpinionVo> suggestionOpinionList = null;
		
		try {
			log.debug("[열린제안] 열린제안 의견 목록 조회");
			suggestionOpinionList = suggestionService.selectSuggestionOpinionList(suggestion_idx);
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 의견 목록 조회 실패");
			e.printStackTrace();
		}
		
		log.debug("[열린제안] 열린제안 의견 목록 조회 완료");
		return new ResponseEntity<>(suggestionOpinionList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/suggestionOpinionRegist.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public ResponseEntity<?> suggestionOpinionRegist(SuggestionOpinionVo vo, BindingResult bindingResult, HttpSession session) throws Exception {
		try {
			log.debug("SuggestionOpinionVo : " + vo);
			
			SuggestionOpinionValidator suggestionOpinionValidator = new SuggestionOpinionValidator();
			suggestionOpinionValidator.validate(vo, bindingResult);
			
			
			if(bindingResult.hasErrors()) {
				return new ResponseEntity<>(bindingResult.getFieldError().getDefaultMessage(), HttpStatus.OK);
			}
			
			String opinionIdx = vo.getOpinion_idx();
			
			UserVo userVo = (UserVo) session.getAttribute("login");
			vo.setCreate_user(userVo.getUser_id());
			
			if (!"".equals(opinionIdx) && opinionIdx != null) {
				// opinionIdx가 있는 경우 -> 댓글의 댓글~~~들을 등록
				// 등록하고자 하는 댓글의 최상위 댓글 ref, indent, step 정보
				SuggestionOpinionVo topOpnVo = suggestionService.selectParentSuggestionOpinion(vo);
				log.debug("[열린제안] 열린제안 상위댓글 indent 수정");
				// 등록하고자 하는 댓글과 최상위 댓글 사이에 있는 댓글들의 indent를 수정하여 depth 설정
				suggestionService.updateChildSuggestionOpinion(topOpnVo);
				
				opinionIdx = suggestionService.selectSuggestionOpinionIdx();
				vo.setOpinion_idx(opinionIdx);
				vo.setSuggestion_ref(topOpnVo.getSuggestion_ref());
				vo.setSuggestion_indent(topOpnVo.getSuggestion_indent() + 1);
				vo.setSuggestion_step(topOpnVo.getSuggestion_step() + 1);
				
				log.debug("[열린제안] 열린제안 대댓글 등록");
				suggestionService.insertSuggestionOpinion(vo);
			} else {
				// opinionIdx가 없는 경우 -> 제안의 댓글을 등록
				opinionIdx = suggestionService.selectSuggestionOpinionIdx();
				vo.setOpinion_idx(opinionIdx);
				vo.setSuggestion_ref(opinionIdx);
				
				log.debug("[열린제안] 열린제안 댓글 등록");
				suggestionService.insertSuggestionOpinion(vo);
			}
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 댓글 등록 실패");
			e.printStackTrace();
		}
		
		log.debug("[열린제안] 열린제안 댓글 등록 완료");
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
}
