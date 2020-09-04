package egovframework.com.survey.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.survey.vo.SurveyVo;

@Controller
@RequestMapping(value="/survey")
public class SurveyController {
	protected Log log = LogFactory.getLog(SurveyController.class);
	
	@RequestMapping(value="/surveyListPage.do")
	public String surveyListpage() throws Exception {
		return "survey/surveyList";
	}

	@RequestMapping(value="/getSurveyList.do")
	public ResponseEntity<?> getSurveyList(SurveyVo vo) throws Exception {
		List<Map<String, String>> surveyList = null;
		
		try {
			log.debug("[설문조사] 설문조사 목록 조회");
			//surveyList = surveyService.selectSurveyList(vo);
		} catch (Exception e) {
			log.debug("[설문조사] 설문조사 목록 조회 실패");
			e.printStackTrace();
		}
		
		log.debug("[설문조사] 설문조사 목록 완료");
		return new ResponseEntity<>(surveyList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/surveyDetailPage.do")
	public String surveyDetailpage() throws Exception {
		return "survey/surveyDetail";
	}
}
