package egovframework.com.survey.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.survey.service.SurveyService;
import egovframework.com.survey.vo.SurveyOpinionVo;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.com.user.vo.UserVo;

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
		}
		
		log.debug("[설문조사] 설문조사 목록 완료");
		return new ResponseEntity<>(surveyList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/surveyDetailPage.do", method=RequestMethod.GET)
	public String surveyDetailpage(ModelMap model, @RequestParam("survey_idx") String survey_idx) throws Exception {
		SurveyVo vo = new SurveyVo();
		List<SurveyOpinionVo> surveyOpinionList = null;
		
		try {
			vo.setSurvey_idx(survey_idx);
			vo = surveyService.getSurveyDetail(vo);
			//surveyOpinionList = surveyService.getSurveyOpinionList(vo);
			//surveyQuestionList = surveyService.getSurveyQuestionList(vo);
		}catch(Exception e) {
			log.debug("[설문조사] 설문조사 상세보기 조회 실패");
		}
		
		model.addAttribute("surveyVo", vo);
		//model.addAttribute("surveyOpinionList",surveyOpinionList);
		
		return "survey/surveyDetail";
	}
	
	@RequestMapping(value="/surveyOpinionList.do")
	public ResponseEntity<?> surveyOpinionList(@RequestParam("survey_idx") String survey_idx) throws Exception {
		//List<SurveyOpinionVo> surveyOpinionList = null;
		List<Map<String, String>> surveyOpinionList = null;
		
		try {
			SurveyVo vo = new SurveyVo();
			vo.setSurvey_idx(survey_idx);
			
			log.debug("[설문조사] 설문조사 의견 목록 조회");
			surveyOpinionList = surveyService.getSurveyOpinionList(vo);
		} catch (Exception e) {
			log.debug("[설문조사] 설문조사 의견 목록 조회 실패");
			e.printStackTrace();
		}
		
		log.debug("[설문조사] 설문조사 의견 목록 조회 완료");
		return new ResponseEntity<>(surveyOpinionList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/surveyOpinionRegist.do", method=RequestMethod.POST, produces="application/text;chartset=utf8")
	public ResponseEntity<?> surveyOpinionRegist(SurveyOpinionVo vo, BindingResult bindingResult, HttpSession session) throws Exception {
		String opinionCount = "";
		
		try {
			SurveyOpinionValidator surveyOpinionValidator = new SurveyOpinionValidator();
			surveyOpinionValidator.validate(vo, bindingResult);
			
			if(bindingResult.hasErrors()) {
				return new ResponseEntity<>(bindingResult.getFieldError().getDefaultMessage(), HttpStatus.OK);
			}
			
			log.debug("SurveyOpinionVo : " + vo);
			String opinionIdx = vo.getOpinion_idx();
			
			UserVo userVo = (UserVo) session.getAttribute("login");
			vo.setCreate_user(userVo.getUser_id());
			
			if (!"".equals(opinionIdx) && opinionIdx != null) {
				// opinionIdx가 있는 경우 -> 댓글의 댓글~~~들을 등록
				// 등록하고자 하는 댓글의 최상위 댓글 ref, indent, step 정보
				SurveyOpinionVo topOpnVo = surveyService.selectParentSurveyOpinion(vo);
				log.debug("[설문조사] 설문조사 상위댓글 indent 수정");
				// 등록하고자 하는 댓글과 최상위 댓글 사이에 있는 댓글들의 indent를 수정하여 depth 설정
				surveyService.updateChildSurveyOpinion(topOpnVo);
				
				opinionIdx = surveyService.selectSurveyOpinionIdx();
				vo.setOpinion_idx(opinionIdx);
				vo.setSurvey_ref(topOpnVo.getSurvey_ref());
				vo.setSurvey_indent(topOpnVo.getSurvey_indent() + 1);
				vo.setSurvey_step(topOpnVo.getSurvey_step() + 1);
				
				log.debug("[설문조사] 설문조사 대댓글 등록");
				surveyService.insertSurveyOpinion(vo);
			} else {
				// opinionIdx가 없는 경우 -> 제안의 댓글을 등록
				opinionIdx = surveyService.selectSurveyOpinionIdx();
				vo.setOpinion_idx(opinionIdx);
				vo.setSurvey_ref(opinionIdx);
				
				log.debug("[설문조사] 설문조사 댓글 등록");
				surveyService.insertSurveyOpinion(vo);
			}
			
			opinionCount = surveyService.selectSurveyOpinionCount(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<>(opinionCount, HttpStatus.OK);
	}
	
	@RequestMapping(value="/surveyOpinionDelete.do", method=RequestMethod.POST)
	public ResponseEntity<?> surveyOpinionDelete(SurveyOpinionVo vo) throws Exception {
		try {
			log.debug("[설문조사] 설문조사 댓글 삭제");
			surveyService.deleteSurveyOpinion(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value="/getQuestionList.do")
	public ResponseEntity<?> getParticipationList( @RequestParam("survey_idx") String survey_idx) throws Exception{
		List<Map<String,String>> surveyQuestionList = null;
		SurveyVo surveyVo = new SurveyVo();
		surveyVo.setSurvey_idx(survey_idx);
		surveyQuestionList = surveyService.getSurveyQuestionList(surveyVo);
		
		return new ResponseEntity<>(surveyQuestionList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/vote.do", method=RequestMethod.POST)
	public String vote(HttpSession session, @ModelAttribute  SurveyVo vo, BindingResult bindingResult, HttpServletRequest request) throws Exception{
		String question_idx;
		String survey_idx;
	    List<Map<String, Object>> answerList = new ArrayList<Map<String, Object>>();
	    
		try {
			UserVo userVo = (UserVo) session.getAttribute("login");
		    vo.setCreate_user(userVo.getUser_id());
			String answer_arr = vo.getAnswer();
			String[] answerArr = answer_arr.split(",");
			survey_idx = vo.getSurvey_idx();
			
			for(int i = 0; i < answerArr.length; i++) {
				question_idx = answerArr[i];
				
				Map<String,Object> answerInfo = new HashMap<String,Object>();
				
				answerInfo.put("survey_idx", survey_idx);
				answerInfo.put("question_idx", question_idx);
				answerInfo.put("participation_user", vo.getCreate_user());
				answerList.add(answerInfo);
			}
			for(int answerListCnt = 0; answerListCnt < answerList.size(); answerListCnt++) {
				System.out.println(answerList.get(answerListCnt));
				surveyService.insertVote(answerList.get(answerListCnt));
				
			}
			
		}catch(Exception e){
			
		}
			
		return "redirect:/survey/surveyDetailPage.do?survey_idx="+vo.getSurvey_idx();
	}
	
	@RequestMapping(value="/getSurveyResult.do")
	public ResponseEntity<?> getSurveyResult( @RequestParam("survey_idx") String survey_idx) throws Exception{
		List<Map<String,String>> surveyResult = null;
		SurveyVo surveyVo = new SurveyVo();
		surveyVo.setSurvey_idx(survey_idx);
		surveyResult = surveyService.getSurveyResult(surveyVo);
		
		return new ResponseEntity<>(surveyResult, HttpStatus.OK);
	}
	
}





















