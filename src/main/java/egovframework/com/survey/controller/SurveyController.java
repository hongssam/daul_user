package egovframework.com.survey.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.survey.service.SurveyService;
import egovframework.com.survey.vo.SurveyVo;

@Controller
@RequestMapping(value="/survey")
public class SurveyController {
	protected Log log = LogFactory.getLog(SurveyController.class);
	
	@Resource(name="surveyService")
	private SurveyService surveyService;
	
	@Resource(name="fileUtil")
	private FileUtil fileUtil;
	
	@RequestMapping(value="/surveyListPage.do")
	public String surveyListpage(ModelMap model) throws Exception {
		List<SurveyVo> surveyList = null;
		SurveyVo vo = new SurveyVo();
		
		try {
			log.debug("[설문조사] 설문조사 목록 조회");
			surveyList = surveyService.getSurveyList(vo);
			System.out.println(surveyList);
			
			
			model.addAttribute("surveyList",surveyList);
			
		}catch(Exception e) {
			log.debug("[설문조사] 설문조사 목록 조회 실패");
		}
		return "survey/surveyList";
	}
	

	@RequestMapping(value="/getSurveyList.do")
	public ResponseEntity<?> getSurveyList(SurveyVo vo) throws Exception {
		List<SurveyVo> surveyList = null;
		
		try {
			log.debug("[설문조사] 설문조사 목록 조회");
			surveyList = surveyService.getSurveyList(vo);
		} catch (Exception e) {
			log.debug("[설문조사] 설문조사 목록 조회 실패");
			e.printStackTrace();
		}
		
		log.debug("[설문조사] 설문조사 목록 완료");
		return new ResponseEntity<>(surveyList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/surveyDetailPage.do")
	public String surveyDetailpage(ModelMap model) throws Exception {
	
		return "survey/surveyDetail";
	}
}
