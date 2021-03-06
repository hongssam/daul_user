package egovframework.com.survey.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmmn.util.CmmnUtil;
import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.mileage.controller.MileageController;
import egovframework.com.mileage.vo.MileageVo;
import egovframework.com.notice.vo.NoticeVo;
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
	
	@Resource(name="mileageController")
	private MileageController mileageController;
	
	@RequestMapping(value="/surveyListPage.do")
	public String surveyListpage(SurveyVo surveyVo, ModelMap model, @RequestParam(defaultValue = "1") int curPage) throws Exception {
		List<SurveyVo> surveyList = null;
		
		try {
			log.debug("[설문조사] 설문조사 목록 조회");
			int listCnt = surveyService.getSurveyListCnt(surveyVo);
			
			surveyVo.setPagination(listCnt, curPage);
			
			surveyList = surveyService.getSurveyList(surveyVo);
			
			for(int i = 0; i < surveyList.size(); i++) {
				String createDate = surveyList.get(i).getCreate_date().substring(0,10);
				String surveyEndDate = surveyList.get(i).getE_date().substring(0,10);
				String surveyStartDate = surveyList.get(i).getS_date().substring(0,10);
				
				surveyList.get(i).setCreate_date(createDate);
				surveyList.get(i).setE_date(surveyEndDate);
				surveyList.get(i).setS_date(surveyStartDate);
			}
			
			model.addAttribute("surveyList",surveyList);
			model.addAttribute("pagination",surveyVo);
			
		}catch(Exception e) {
			log.debug("[설문조사] 설문조사 목록 조회 실패");
		}
		return "survey/surveyList";
	}
	
	@RequestMapping(value="/surveyNoticeListPage.do")
	public String surveyNoticeListPage(SurveyVo surveyVo, ModelMap model, @RequestParam(defaultValue = "1") int curPage) throws Exception {
		List<NoticeVo> surveyNoticeList = null;
		try {
			log.debug("[설문조사] 설문조사공지사항 목록 조회");
			
			int NoticeListCnt = surveyService.getSurveyNoticeListCnt(surveyVo);

			surveyVo.setPageSize(10);
			surveyVo.setPagination(NoticeListCnt, curPage);
			surveyNoticeList = surveyService.getSurveyNoticeList(surveyVo);
			
			for(int i = 0; i < surveyNoticeList.size(); i++) {
				String createDate = surveyNoticeList.get(i).getCreate_date().substring(0,10);
				
				surveyNoticeList.get(i).setCreate_date(createDate);
			}
			
			model.addAttribute("surveyNoticeList",surveyNoticeList);
			model.addAttribute("pagination",surveyVo);
			
		}catch(Exception e) {
			log.debug("[설문조사] 설문조사공지사항 목록 조회 실패");
		}
		return "survey/surveyNotice";
	}
	
	@RequestMapping(value="/surveyNoticeDetail.do", method=RequestMethod.GET)
	public String surveyNoticeDetail(ModelMap model, @RequestParam("notice_idx") String notice_idx) throws Exception {
		NoticeVo vo = new NoticeVo();
		List<Map<String, String>> fileList = null;
		
		try {
			vo.setNotice_idx(notice_idx);

			surveyService.increaseViewCount(vo.getNotice_idx());
			vo = surveyService.getSurveyNoticeDetail(vo);
			vo.setCreate_date(vo.getCreate_date().substring(0,10));
			
			fileList = surveyService.getSurveyNoticeFile(vo);
			
		}catch(Exception e){
			e.printStackTrace();
		}
			model.addAttribute("surveyNoticeVo", vo);
			model.addAttribute("fileList", fileList);
			
		return "survey/surveyNoticeDetail";
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
	public String surveyDetailpage(ModelMap model, @RequestParam("survey_idx") String survey_idx, HttpSession session) throws Exception {
		SurveyVo vo = new SurveyVo();
		Boolean isPart = false;
		
		try {
			vo.setSurvey_idx(survey_idx);
			
			UserVo userVo = (UserVo) session.getAttribute("login");
			if (userVo != null)	{
				vo.setCreate_user(userVo.getUser_id());
				
				int partCnt = surveyService.selectSurveyParticipationUserCount(vo); 
				isPart = partCnt > 0 ? true : false;
			}
			
			vo = surveyService.getSurveyDetail(vo);
			
			vo.setCreate_date(vo.getCreate_date().substring(0,10));
			vo.setS_date(vo.getS_date().substring(0,10));
			vo.setE_date(vo.getE_date().substring(0,10));
		}catch(Exception e) {
			log.debug("[설문조사] 설문조사 상세보기 조회 실패");
		}
		
		model.addAttribute("surveyVo", vo);
		model.addAttribute("isPart", isPart);
		
		return "survey/surveyDetail";
	}
	
	@RequestMapping(value="/surveyOpinionList.do")
	public ResponseEntity<?> surveyOpinionList(@RequestParam("survey_idx") String survey_idx, @RequestParam(defaultValue = "1") int curPage) throws Exception {
		Map<String, Object> resMap = new HashMap<>();
		List<Map<String, String>> surveyOpinionList = null;
		
		try {
			SurveyOpinionVo vo = new SurveyOpinionVo();
			vo.setSurvey_idx(survey_idx);
			log.debug("[설문조사] 설문조사 의견 목록 카운트 조회");
			String opnListCnt = surveyService.selectSurveyOpinionCount(vo);
			
			vo.setPageSize(10);
			vo.setPagination(Integer.valueOf(opnListCnt), curPage);
			
			log.debug("[설문조사] 설문조사 의견 목록 조회");
			surveyOpinionList = surveyService.getSurveyOpinionList(vo);
			
			resMap.put("surveyOpnList", surveyOpinionList);
			resMap.put("pagination", vo);
		} catch (Exception e) {
			log.debug("[설문조사] 설문조사 의견 목록 조회 실패");
			e.printStackTrace();
		}
		
		log.debug("[설문조사] 설문조사 의견 목록 조회 완료");
		return new ResponseEntity<>(resMap, HttpStatus.OK);
	}
	
	@RequestMapping(value="/surveyOpinionRegist.do", method=RequestMethod.POST, produces="application/text;chartset=utf8")
	public ResponseEntity<?> surveyOpinionRegist(SurveyOpinionVo vo, BindingResult bindingResult, HttpSession session) throws Exception {
		String opinionCount = "";
		
		try {
			SurveyOpinionValidator surveyOpinionValidator = new SurveyOpinionValidator();
			surveyOpinionValidator.validate(vo, bindingResult);
			MileageVo mileageVo = new MileageVo();
			
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
				
				//opinionIdx = surveyService.selectSurveyOpinionIdx();
				opinionIdx = CmmnUtil.generateKeyWithPrefix("SVOP");
				vo.setOpinion_idx(opinionIdx);
				vo.setSurvey_ref(topOpnVo.getSurvey_ref());
				vo.setSurvey_indent(topOpnVo.getSurvey_indent() + 1);
				vo.setSurvey_step(topOpnVo.getSurvey_step() + 1);
				
				log.debug("[설문조사] 설문조사 대댓글 등록");
				surveyService.insertSurveyOpinion(vo);
			} else {
				// opinionIdx가 없는 경우 -> 제안의 댓글을 등록
				//opinionIdx = surveyService.selectSurveyOpinionIdx();
				opinionIdx = CmmnUtil.generateKeyWithPrefix("SVOP");
				vo.setOpinion_idx(opinionIdx);
				vo.setSurvey_ref(opinionIdx);
				
				log.debug("[설문조사] 설문조사 댓글 등록");
				surveyService.insertSurveyOpinion(vo);
			}
			
			opinionCount = surveyService.selectSurveyOpinionCount(vo);
			
			mileageVo.setAction_id("SVOP01"); 
			mileageVo.setBoard_id(vo.getOpinion_idx());
			mileageVo.setUser_id(userVo.getPhone());
			mileageController.AccumulateMileage(mileageVo);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<>(opinionCount, HttpStatus.OK);
	}
	
	@RequestMapping(value="/surveyOpinionDelete.do", method=RequestMethod.POST)
	public ResponseEntity<?> surveyOpinionDelete(SurveyOpinionVo vo) throws Exception {
		try {
			MileageVo mileageVo = new MileageVo();
			
			log.debug("[설문조사] 설문조사 댓글 삭제");
			surveyService.deleteSurveyOpinion(vo);
			
			mileageVo.setBoard_id(vo.getOpinion_idx());
			mileageController.deleteMileage(mileageVo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value="/getQuestionList.do")
	public ResponseEntity<?> getParticipationList( @RequestParam("survey_idx") String survey_idx) throws Exception{
		List<Map<String, Object>> surveyQuestionList = null;
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
			MileageVo mileageVo = new MileageVo();
		    
		    List<String> answer_arr = vo.getAnswer_arr();
			survey_idx = vo.getSurvey_idx();
			
			for(int i = 0; i < answer_arr.size(); i++) {
				question_idx = answer_arr.get(i);
				
				String[] question_idx_arr = question_idx.split(",");
				
				for (int j = 0; j < question_idx_arr.length; j++) {
					Map<String,Object> answerInfo = new HashMap<String,Object>();
					
					answerInfo.put("survey_idx", survey_idx);
					answerInfo.put("question_idx", question_idx_arr[j]);
					answerInfo.put("participation_user", vo.getCreate_user());
					answerList.add(answerInfo);
				}
			}
			for(int answerListCnt = 0; answerListCnt < answerList.size(); answerListCnt++) {
				System.out.println(answerList.get(answerListCnt));
				surveyService.insertVote(answerList.get(answerListCnt));
				
			}
			
			mileageVo.setAction_id("SV04"); 
			mileageVo.setBoard_id(vo.getSurvey_idx());
			mileageVo.setUser_id(userVo.getPhone());
			mileageController.AccumulateMileage(mileageVo);
			
			
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
	
	@RequestMapping(value="/getBeforeNotice.do")
	public ResponseEntity<?> getBeforeNotice( @RequestParam("notice_idx") String notice_idx) throws Exception{
		NoticeVo vo = new NoticeVo();
		vo.setNotice_idx(notice_idx);
		vo = surveyService.getBeforeNotice(vo);
		
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}
	
	@RequestMapping(value="/getAfterNotice.do")
	public ResponseEntity<?> getAfterNotice( @RequestParam("notice_idx") String notice_idx) throws Exception{
		NoticeVo vo = new NoticeVo();
		vo.setNotice_idx(notice_idx);
		vo = surveyService.getAfterNotice(vo);
		
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/downloadSurveyNoticeFile.do", method = RequestMethod.GET)
	public void downloadFile(HttpServletResponse response, @RequestParam("save_file_name") String save_file_name)
			throws Exception {
		try {
			FileVo fileVo = new FileVo();
			fileVo.setIdx(save_file_name);
			fileVo = surveyService.selectDownloadFile(fileVo);

			log.debug("[설문조사공지사항] 설문조사공지사항 첨부파일 다운로드");
			fileUtil.downloadFile(response, fileVo);
		} catch (Exception e) {
			log.debug("[설문조사공지사항] 설문조사공지사항 첨부파일 다운로드 실패");
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/getImg.do")
	public void getImage(@RequestParam("survey_idx") String survey_idx, HttpServletResponse response) throws Exception {
		Map<String, String> file = new HashMap<>();
		
		try {
			file = surveyService.selectImageFile(survey_idx);
			
			try {
				if (!file.isEmpty()) {
					fileUtil.getImgFile(response, file.get("save_file_name"));
				}
			}catch(NullPointerException e){
				fileUtil.getImgFile(response, "placeholder.png");
				log.debug("이미지없음.");
			}
			
		} catch (Exception e) {
			log.debug("ChatbotController - getImg.do - Exception");
			e.printStackTrace();
		}
	}
	
}





















