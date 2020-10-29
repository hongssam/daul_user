package egovframework.com.main.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmmn.CallEmotionAPI;
import egovframework.com.cmmn.CallKeywordAPI;
import egovframework.com.contest.vo.ContestVo;
import egovframework.com.main.service.MainService;
import egovframework.com.notice.vo.NoticeVo;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.com.survey.vo.SurveyVo;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	protected Log log = LogFactory.getLog(MainController.class);
	
	@Resource(name="mainService")
	private MainService mainService;

	@Resource(name="callEmotionAPI")
	private CallEmotionAPI callEmotionAPI;
	
	@Resource(name="callKeywordAPI")
	private CallKeywordAPI callKeywordAPI;

	@RequestMapping(value = "/main.do")
	public String maingPage(ModelMap model) throws Exception{
		List<SuggestionVo> suggestionList = null;
		List<SurveyVo> surveyList = null;
		List<ContestVo> contestList = null;
		List<NoticeVo> noticeList = null;
		
		try {
			//callEmotionAPI.CallAPI("SG01");
			
			//callKeywordAPI.CallAPI("SG01");
			
			log.debug("[메인] 최근 열린제안 리스트 조회");
			suggestionList = mainService.selectSuggestionListByLately();
			log.debug("[메인] 최근 설문조사 리스트 조회");
			surveyList = mainService.selectSurveyListByLately();
			log.debug("[메인] 최근 공모제안 리스트 조회");
			contestList = mainService.selectContestListByLately();
			log.debug("[메인] 최근 공지 리스트 조회");
			noticeList = mainService.selectNoticeListByLately();
		} catch (Exception e) {
			log.debug("[메인] 최근 리스트 조회 실패");
			e.printStackTrace();
		}
		
		model.addAttribute("sgstList", suggestionList);
		model.addAttribute("surveyList", surveyList);
		model.addAttribute("contestList", contestList);
		model.addAttribute("noticeList", noticeList);
		
		log.debug("[메인] 최근 리스트 조회 완료");
		return "main/main";
	}
	
	@RequestMapping(value="/privacyPage.do")
	public String privacyPage() {
		return "main/privacy";
	}
	
	@RequestMapping(value="/provisionPage.do")
	public String provisionPage() {
		return "main/provision";
	}
}
