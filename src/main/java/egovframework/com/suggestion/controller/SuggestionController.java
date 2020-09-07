package egovframework.com.suggestion.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.suggestion.service.SuggestionService;
import egovframework.com.suggestion.vo.SuggestionVo;

@Controller
@RequestMapping(value="/suggestion")
public class SuggestionController {
	protected Log log = LogFactory.getLog(SuggestionController.class);
	
	@Resource(name="fileUtil")
	private FileUtil fileUtil;
	
	@Resource(name="suggestionService")
	private SuggestionService suggestionService;

	@RequestMapping(value="/suggestionListPage.do")
	public String suggestionListPage() throws Exception {
		return "suggestion/suggestionList";
	}
	
	@RequestMapping(value="/suggestionDetailPage.do")
	public String suggestionDetailPage() throws Exception {
		return "suggestion/suggestionDetail";
	}
	
	@RequestMapping(value="/suggestionRegistPage.do")
	public String suggestionRegistPage(ModelMap model) throws Exception {
		model.addAttribute("suggestionVo", new SuggestionVo());
		
		return "suggestion/suggestionRegist";
	}
	
	@RequestMapping(value="/suggestionRegist.do", method=RequestMethod.POST)
	public String createSuggestion(SuggestionVo vo, HttpServletRequest request, BindingResult bindingResult) throws Exception {
		try {
			SuggestionValidator suggestionValidator = new SuggestionValidator();
			suggestionValidator.validate(vo, bindingResult);
			
			if (bindingResult.hasErrors()) {
				return "suggestion/suggestionRegist";
			}
			
			log.debug("SuggestionVo : " + vo);
			String suggestionIdx = suggestionService.selectSuggestionIdx();
			vo.setSuggestion_idx(suggestionIdx);
			
			log.debug("[열린제안] 열린제안 등록");
			int result = suggestionService.registSuggestion(vo);
			log.debug("suggestion insert result : " + result);
			
			if (result > 0) {
				FileVo fileVo = new FileVo();
				
				fileVo.setCreate_user(vo.getCreate_user());
				fileVo.setIdx(vo.getSuggestion_idx());
				
				//List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, publicFile, repFile);
				List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);

				log.debug("[열린제안] 열린제안 파일 등록");
				for(int i = 0; i<fileList.size(); i++) {
					suggestionService.insertFile(fileList.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/suggestion/suggestionListPage.do";
	}
}
