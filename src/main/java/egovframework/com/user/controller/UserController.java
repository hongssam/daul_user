package egovframework.com.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.com.cmmn.SecurityUtil;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.com.user.service.UserService;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value="/user")
public class UserController {
	protected Log log = LogFactory.getLog(UserController.class);
	
	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping(value="/userRegistTermPage.do")
	public String userRegistTermPage() throws Exception {
		return "user/userRegistTerm";
	}
	
	@RequestMapping(value="/userRegistAuthPage.do")
	public String userRegistAuthPage() throws Exception {
		return "user/userRegistAuth";
	}
	
	@RequestMapping(value="/userRegistPage.do")
	public String userRegistPage(ModelMap model, UserVo vo) throws Exception {
		try {
			System.out.println(vo);
			
			model.addAttribute("userVo", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "user/userRegist";
	}
	
	@RequestMapping(value="/userRegistCmplPage.do")
	public String userRegistCmplPage() throws Exception {
		return "user/userRegistCmpl";
	}
	
	@RequestMapping(value="/checkKakaoAccount.do")
	public ResponseEntity<?> checkKakaoAccount(@RequestParam Map<String, Object> params) throws Exception {
		Map<String, Object> resMap = new HashMap<>();
		
		try {
			log.debug("[카카오 사용자] 카카오 사용자 계정 중복 확인");
			int count = userService.selectKakaoAccount(params);
			
			resMap.put("exist", count > 0 ? true : false);
		} catch (Exception e) {
			log.debug("[카카오 사용자] 카카오 사용자 계정 중복 확인 실패");
			e.printStackTrace();
		}
		
		log.debug("[카카오 사용자] 카카오 사용자 계정 중복 확인 완료");
		return new ResponseEntity<>(resMap, HttpStatus.OK);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/kakaoUserRegist.do", method=RequestMethod.POST)
	public ResponseEntity<?> kakaoUserRegist(@RequestBody Map<String, Object> params) throws Exception {
		try {
			System.out.println(params);
			Map<String, Object> kakao_account = (Map<String, Object>) params.get("kakao_account");
			Map<String, String> profile = (Map<String, String>) kakao_account.get("profile");
			
			UserVo vo = new UserVo();
			vo.setKakao_key(String.valueOf(params.get("id")));
			vo.setName(profile.get("nickname"));
			vo.setEmail((String) kakao_account.get("email"));
			vo.setUser_id((String) kakao_account.get("email"));
			vo.setPw("kakao");
			vo.setChannel("kakao");
			vo.setAuth_type("public");
			
			log.debug("[카카오 사용자] 카카오 사용자 등록 vo" + vo);
			log.debug("[카카오 사용자] 카카오 사용자 등록");
			userService.insertKakaoUser(vo);
		} catch (Exception e) {
			log.debug("[카카오 사용자] 카카오 사용자 등록 실패");
			e.printStackTrace();
		}
		
		log.debug("[카카오 사용자] 카카오 사용자 등록 완료");
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value="/userIdCheck.do")
	public ResponseEntity<?> userIdCheck(@RequestParam("user_id") String user_id) throws Exception {
		Map<String, Object> resMap = new HashMap<>();
		
		try {
			log.debug("[일반사용자] 일반사용자 아이디 중복 확인");
			int iRes = userService.selectUserIdCheck(user_id);
			
			resMap.put("exist", iRes > 0);
		} catch (Exception e) {
			log.debug("[일반사용자] 일반사용자 아이디 중복 확인 실패");
			e.printStackTrace();
		}
		
		log.debug("[일반사용자] 일반사용자 아이디 중복 확인 완료");
		return new ResponseEntity<>(resMap, HttpStatus.OK);
	}
	
	@RequestMapping(value="/publicUserRegist.do", method=RequestMethod.POST)
	public String publicUserRegist(UserVo vo, BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
		try {
			vo.setChannel("public");
			vo.setAuth_type("public");
			
			UserValidator userValidator = new UserValidator();
			userValidator.validate(vo, result);
			
			if (result.hasErrors()) {
				log.debug("[일반 사용자] 일반 사용자 등록 validator ERROR");
				log.debug(result.getFieldError().getDefaultMessage());
				
				return "/user/userRegist";
			}
			
			SecurityUtil securityUtil = new SecurityUtil();
			String encryptPw = securityUtil.encryptSHA256(vo.getPwKey());
			vo.setPw(encryptPw);
			
			log.debug("[일반 사용자] 일반 사용자 등록 vo" + vo);
			log.debug("[일반 사용자] 일반 사용자 등록");
			userService.insertPublicUser(vo);
		} catch (Exception e) {
			log.debug("[일반 사용자] 일반 사용자 등록 실패");
			e.printStackTrace();
		}
		
		log.debug("[일반 사용자] 일반 사용자 등록 완료");
		redirectAttributes.addFlashAttribute("user_id", vo.getUser_id());
		return "redirect:/user/userRegistCmplPage.do";
	}
	
	@RequestMapping(value="/mypageDetailPage.do", method=RequestMethod.POST)
	public String mypageDetailPage(UserVo vo, ModelMap model) throws Exception {
		try {
			log.debug("[사용자] 사용자 조회");
			vo = userService.selectUser(vo);
		} catch (Exception e) {
			log.debug("[사용자] 사용자 조회 실패");
			e.printStackTrace();
		}
		
		model.addAttribute("userVo", vo);
		
		log.debug("[사용자] 사용자 조회 완료");
		return "user/mypage";
	}
	
	@RequestMapping(value="/publicUserModify.do", method=RequestMethod.POST)
	public String publicUserModify(UserVo vo, BindingResult result, HttpSession session) throws Exception {
		try {
			UserModifyValidator userModifyValidator = new UserModifyValidator();
			userModifyValidator.validate(vo, result);

			if (result.hasErrors()) {
				log.debug("[사용자] 사용자 수정 validator ERROR");
				log.debug(result.getFieldError());
				
				return "/user/mypage";
			}
			
			if (vo.getEmail_chk() == null)	vo.setEmail_chk("N");
			if (vo.getTalk_chk() == null)	vo.setTalk_chk("N");
			if (vo.getSms_chk() == null)	vo.setSms_chk("N");
			
			SecurityUtil securityUtil = new SecurityUtil();
			String encryptPw = securityUtil.encryptSHA256(vo.getPwKey());
			vo.setPw(encryptPw);
			
			log.debug("[사용자] 사용자 수정");
			userService.updateUser(vo);
			
			session.setAttribute("login", vo);
		} catch (Exception e) {
			log.debug("[사용자] 사용자 수정 실패");
			e.printStackTrace();
		}
		
		log.debug("[사용자] 사용자 수정 완료");
		return "/user/mypage";
	}
	
	@RequestMapping(value="/mypageSuggestionListPage.do")
	public String mypageSuggestionListpage(ModelMap model, @RequestParam(defaultValue = "1") int curPage, HttpSession session) throws Exception {
		List<SuggestionVo> suggestionList = null;
		SuggestionVo vo = new SuggestionVo();
		
		try {
			UserVo userVo = (UserVo) session.getAttribute("login");
			
			vo.setCreate_user(userVo.getUser_id());
			
			int listCnt = userService.selectSuggestionListCntByMypage(vo);
			
			vo.setPagination(listCnt, curPage);
			
			suggestionList = userService.selectSuggestionListByMypage(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("sgstList", suggestionList);
		model.addAttribute("pagination", vo);
		
		return "/user/mypageSuggestionList";
	}
	
	@RequestMapping(value="/mypageSurveyListPage.do")
	public String mypageSurveyListPage(ModelMap model, @RequestParam(defaultValue = "1") int curPage, HttpSession session) throws Exception {
		List<SurveyVo> surveyList = null;
		SurveyVo vo = new SurveyVo();
		
		try {
			UserVo userVo = (UserVo) session.getAttribute("login");
			
			vo.setCreate_user(userVo.getUser_id());
			
			int listCnt = userService.selectSurveyListCntByMypage(vo);
			
			vo.setPagination(listCnt, curPage);
			
			surveyList = userService.selectSurveyListByMypage(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("surveyList", surveyList);
		model.addAttribute("pagination", vo);
		
		return "/user/mypageSurveyList";
	}
} 
