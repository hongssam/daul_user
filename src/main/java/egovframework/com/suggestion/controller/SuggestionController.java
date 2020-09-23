package egovframework.com.suggestion.controller;

import java.util.HashMap;
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
	public String suggestionListPage(SuggestionVo vo, @RequestParam(defaultValue = "1") int curPage, ModelMap model) throws Exception {
		try {
			log.debug("[열린제안] 열린제안 목록 카운트 조회");
			int listCnt = suggestionService.selectSuggestionListCnt(vo);
			vo.setPageSize(8);
			vo.setPagination(listCnt, curPage);
			
			log.debug("[열린제안] 열린제안 목록 조회");
			List<SuggestionVo> suggestionList = suggestionService.selectSuggestionList(vo);
			log.debug("[열린제안] 열린제안 목록 조회 : " + suggestionList);
			
			for(int i = 0; i < suggestionList.size(); i++) {
				String date = suggestionList.get(i).getCreate_date().substring(0,10);
				suggestionList.get(i).setCreate_date(date);
			}
			
			model.addAttribute("sgstList", suggestionList);
			model.addAttribute("pagination", vo);
			model.addAttribute("type", vo.getType());
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 목록 조회 실패");
			e.printStackTrace();
		}
		
		log.debug("[열린제안] 열린제안 목록 조회 완료");
		return "suggestion/suggestionList";
	}
	
	@RequestMapping(value="/suggestionDetailPage.do")
	public String suggestionDetailPage(@RequestParam("suggestion_idx") String suggestion_idx, ModelMap model, HttpSession session) throws Exception {
		try {
			UserVo userVo = (UserVo) session.getAttribute("login");
			
			Map<String, String> params = new HashMap<>();
			params.put("suggestion_idx", suggestion_idx);
			if (userVo != null) params.put("user_id", userVo.getUser_id());
			
			log.debug("[열린제안] 열린제안 상세 조회");
			SuggestionVo suggestion = suggestionService.selectSuggestion(params);
			
			suggestion.setCreate_date(suggestion.getCreate_date().substring(0,10));
			
			log.debug("[열린제안] 열린제안 상세 파일 조회");
			List<Map<String, String>> fileList = suggestionService.selectSuggestionFileList(params);
			log.debug("[열린제안] 열린제안 상세 파일 조회 : " + fileList);
			
			model.addAttribute("sgst", suggestion);
			model.addAttribute("fileList", fileList);
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
	public String suggestionRegist(SuggestionVo vo, HttpServletRequest request, BindingResult bindingResult, HttpSession session) throws Exception {
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
	public ResponseEntity<?> suggestionOpinionList(@RequestParam("suggestion_idx") String suggestion_idx, @RequestParam(defaultValue = "1") int curPage) throws Exception {
		Map<String, Object> resMap = new HashMap<>();
		List<Map<String, String>> suggestionOpinionList = null;
		
		try {
			SuggestionOpinionVo vo = new SuggestionOpinionVo();
			vo.setSuggestion_idx(suggestion_idx);
			
			log.debug("[열린제안] 열린제안 의견 목록 카운트 조회");
			String opnListCnt = suggestionService.selectSuggestionOpinionCount(vo);
			
			vo.setPageSize(10);
			vo.setPagination(Integer.valueOf(opnListCnt), curPage);
			
			log.debug("[열린제안] 열린제안 의견 목록 조회");
			suggestionOpinionList = suggestionService.selectSuggestionOpinionList(vo);
			
			resMap.put("sgstOpnList", suggestionOpinionList);
			resMap.put("pagination", vo);
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 의견 목록 조회 실패");
			e.printStackTrace();
		}
		
		log.debug("[열린제안] 열린제안 의견 목록 조회 완료");
		return new ResponseEntity<>(resMap, HttpStatus.OK);
	}

	@RequestMapping(value="/suggestionOpinionRegist.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public ResponseEntity<?> suggestionOpinionRegist(SuggestionOpinionVo vo, BindingResult bindingResult, HttpSession session) throws Exception {
		String opinionCount = "";
		
		try {
			log.debug("SuggestionOpinionVo : " + vo);
			
			SuggestionOpinionValidator suggestionOpinionValidator = new SuggestionOpinionValidator();
			suggestionOpinionValidator.validate(vo, bindingResult);
			
			
			if(bindingResult.hasErrors()) {
				return new ResponseEntity<>(bindingResult.getFieldError().getDefaultMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
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
			
			opinionCount = suggestionService.selectSuggestionOpinionCount(vo);
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 댓글 등록 실패");
			e.printStackTrace();
		}
		
		log.debug("[열린제안] 열린제안 댓글 등록 완료");
		return new ResponseEntity<>(opinionCount, HttpStatus.OK);
	}
	
	@RequestMapping(value="/suggestionOpinionDelete", method=RequestMethod.POST)
	public ResponseEntity<?> suggestionOpinionDelete(SuggestionOpinionVo vo) throws Exception {
		try {
			log.debug("[열린제안] 열린제안 댓글 삭제");
			suggestionService.deleteSuggestionOpinion(vo);
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 댓글 삭제 실패");
			e.printStackTrace();
		}
		
		log.debug("[열린제안] 열린제안 댓글 삭제 완료");
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value="/suggestionUserLikeChange.do")
	public ResponseEntity<?> suggestionUserLikeChange(@RequestParam Map<String, String> params, HttpSession session) throws Exception {
		int likeCount = 0;
		
		try {
			UserVo userVo = (UserVo) session.getAttribute("login");
			
			params.put("user_id", userVo.getUser_id());
			
			log.debug("[열린제안] 열린제안 공감 조회");
			Map<String, String> result = suggestionService.selectSuggestionUserLike(params); 
			
			if (result == null) {
				if ("reg".equals(params.get("method_type"))) {
					log.debug("[열린제안] 열린제안 공감 등록");
					suggestionService.insertSuggestionUserLike(params);
				}
			} else {
				if ("del".equals(params.get("method_type"))) {
					log.debug("[열린제안] 열린제안 공감 삭제");
					suggestionService.deleteSuggestionUserLike(params);
				}
			}
			
			log.debug("[열린제안] 열린제안 공감 카운트 조회");
			likeCount = suggestionService.selectSuggestionLikeCount(params.get("suggestion_idx"));
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 공감 실패");
			e.printStackTrace();
		}
		
		log.debug("[열린제안] 열린제안 공감 등록 완료");
		return new ResponseEntity<>(likeCount, HttpStatus.OK);
	}
	
	@RequestMapping(value="/downloadFile.do")
	public void downloadFile(HttpServletResponse response, @RequestParam("save_file_name") String save_file_name) throws Exception {
		try {
			FileVo fileVo = new FileVo();
			fileVo.setSave_file_name(save_file_name);
			
			fileVo = suggestionService.selectSuggestionDownloadFile(fileVo);
			
			log.debug("[열린제안] 열린제안 첨부파일 다운로드");
			fileUtil.downloadFile(response, fileVo);
		} catch (Exception e) {
			log.debug("[열린제안] 열린제안 첨부파일 다운로드 실패");
			e.printStackTrace();
		}
	}
}
