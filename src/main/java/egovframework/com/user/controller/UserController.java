package egovframework.com.user.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.com.cmmn.CallNotificationTalkAPI;
import egovframework.com.cmmn.NotificationVo;
import egovframework.com.cmmn.SecurityUtil;
import egovframework.com.contest.vo.ContestVo;
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

	@Resource(name="callNotificationTalkAPI")
	private CallNotificationTalkAPI callNotificationTalkAPI;
	
	@RequestMapping(value="/userRegistTermPage.do")
	public String userRegistTermPage() throws Exception {
		return "user/userRegistTerm";
	}
	
	@RequestMapping(value="/userRegistAuthPage.do")
	public String userRegistAuthPage() throws Exception {
		return "user/userRegistAuth";
	}
	
	@RequestMapping(value="/userRegistPage.do", method=RequestMethod.POST)
	public String userRegistPage(ModelMap model, UserVo vo) throws Exception {
		try {
			System.out.println(vo);
			vo.setPhone(vo.getMobileNo());
			
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
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/checkKakaoAccount.do")
	public ResponseEntity<?> checkKakaoAccount(@RequestParam Map<String, Object> params) throws Exception {
		Map<String, Object> resMap = new HashMap<>();
		
		try {
			Map<String, Object> kakao_account = (Map<String, Object>) params.get("kakao_account");
			
			String phone_number = (String) kakao_account.get("phone_number");
			phone_number = phone_number.replaceAll(" ", "").replaceAll("-", "").replace("+82", "0");
			
			log.debug("[카카오 사용자] 카카오 사용자 핸드폰번호 중복 확인");
			int phoneChk = userService.selectCheckUserPhone(phone_number);
			
			UserVo vo = new UserVo();
			vo.setKakao_key(String.valueOf(params.get("id")));
			vo.setPhone(phone_number);
			
			if (phoneChk > 0) {
				log.debug("[카카오 사용자] 카카오 사용자 핸드폰번호 + kakaokey 중복 확인");
				int kakaokeyChk = userService.selectCheckUserKakaokeyPhone(vo);
				
				resMap.put("exist", kakaokeyChk > 0 ? true : false);
			} else {
				resMap.put("exist", false);
			}
			//log.debug("[카카오 사용자] 카카오 사용자 계정 중복 확인");
			//int count = userService.selectKakaoAccount(params);
			//resMap.put("exist", count > 0 ? true : false);
		} catch (Exception e) {
			log.debug("[카카오 사용자] 카카오 사용자 중복 확인 실패");
			e.printStackTrace();
		}
		
		log.debug("[카카오 사용자] 카카오 사용자 중복 확인 완료");
		return new ResponseEntity<>(resMap, HttpStatus.OK);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/kakaoUserRegist.do", method=RequestMethod.POST)
	public ResponseEntity<?> kakaoUserRegist(@RequestBody Map<String, Object> params, HttpServletResponse response) throws Exception {
		try {
			System.out.println(params);
			Map<String, Object> kakao_account = (Map<String, Object>) params.get("kakao_account");
			Map<String, String> profile = (Map<String, String>) kakao_account.get("profile");
			
			String phone_number = (String) kakao_account.get("phone_number");
			phone_number = phone_number.replaceAll(" ", "").replaceAll("-", "").replace("+82", "0");
					
			UserVo vo = new UserVo();
			NotificationVo notificationVo = new NotificationVo();
			notificationVo.setAction_id("U01");
			String kakaoUserID  = String.valueOf(params.get("id")) + "@k";
			
			vo.setKakao_key(String.valueOf(params.get("id")));
			vo.setName(profile.get("nickname"));
			vo.setPhone(phone_number);
			vo.setUser_id(kakaoUserID);
			vo.setPw(" ");
			vo.setAuth_type("public");
			vo.setEmail_chk("Y");
			vo.setSms_chk("Y");
			vo.setTalk_chk("N");
			
			String scope = (String) params.get("scope");
			String[] scopeArr = scope.split(" ");
			
			for (int i = 0; i < scopeArr.length; i++) {
				if ("talk_message".equals(scopeArr[i])) {
					vo.setTalk_chk("Y");
				}
			}
			
			int phoneChk = userService.selectCheckUserPhone(phone_number);
			
			log.debug("[카카오 사용자] 카카오 사용자 등록 vo" + vo);
			if (phoneChk > 0) {
				// update
				userService.updateKakaoUser(vo);
			} else {
				// insert
				log.debug("[카카오 사용자] 카카오 사용자 등록");
				userService.insertKakaoUser(vo);
				
				//사용자 및 알람톡ON-OFF여부 확인 
				String user_noti_yn = userService.getUserNotificationYN(vo);
				String action_noti_yn = userService.getActionYN(notificationVo);
				
				if(user_noti_yn.equals("Y") && action_noti_yn.equals("Y")) {
					System.out.println("user_noti_yn = " + user_noti_yn);
					System.out.println("action_noti_yn = " + action_noti_yn);
					notificationVo.setName(vo.getName());
					notificationVo.setPhone(vo.getPhone());
					callNotificationTalkAPI.CallAPI(notificationVo);
					
				}else {
					System.out.println("user_noti_yn222 = " + user_noti_yn);
					System.out.println("action_noti_yn222 = " + action_noti_yn);
				}
			}
			
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
	public String publicUserRegist(UserVo vo, BindingResult result, RedirectAttributes redirectAttributes,HttpServletResponse response) throws Exception {
		try {
			//vo.setChannel("public");
			vo.setAuth_type("public");
			
			UserValidator userValidator = new UserValidator();
			NotificationVo notificationVo = new NotificationVo();
			notificationVo.setAction_id("U01");
			
			userValidator.validate(vo, result);
			
			if (result.hasErrors()) {
				log.debug("[일반 사용자] 일반 사용자 등록 validator ERROR");
				log.debug(result.getFieldError().getDefaultMessage());
				
				return "/user/userRegist";
			}
			
			SecurityUtil securityUtil = new SecurityUtil();
			String encryptPw = securityUtil.encryptSHA256(vo.getPwKey());
			vo.setPw(encryptPw);
			
			String phone = vo.getPhone();
			int phoneChk = userService.selectCheckUserPhone(phone);
			
			log.debug("[일반 사용자] 일반 사용자 정보" + vo);
			if (phoneChk > 0) {
				//update
				log.debug("[일반 사용자] 일반 사용자 수정");
				userService.updatePublicUser(vo);
			} else {
				//insert
				log.debug("[일반 사용자] 일반 사용자 등록");
				userService.insertPublicUser(vo);
				
				//사용자 및 알람톡ON-OFF여부 확인 
				String user_noti_yn = userService.getUserNotificationYN(vo);
				String action_noti_yn = userService.getActionYN(notificationVo);
				
				if(user_noti_yn.equals("Y") && action_noti_yn.equals("Y")) {
					System.out.println("user_noti_yn = " + user_noti_yn);
					System.out.println("action_noti_yn = " + action_noti_yn);
					notificationVo.setName(vo.getName());
					notificationVo.setPhone(vo.getPhone());
					callNotificationTalkAPI.CallAPI(notificationVo);
					
				}else {
					System.out.println("user_noti_yn = " + user_noti_yn);
					System.out.println("action_noti_yn = " + action_noti_yn);
				}
				
			}
		} catch (Exception e) {
			log.debug("[일반 사용자] 일반 사용자 등록 실패");
			e.printStackTrace();
		}
		
		log.debug("[일반 사용자] 일반 사용자 등록 완료");
		redirectAttributes.addFlashAttribute("user_id", vo.getUser_id());
		return "redirect:/user/userRegistCmplPage.do";
	}
	
	@RequestMapping(value="/mypageAccountInfo.do", method=RequestMethod.POST)
	public String mypageAccountInfo(UserVo vo, ModelMap model, HttpSession session) throws Exception {
		try {

			if(session.getAttribute("login") == null) {
				 return "login/login";
			 }
			
			log.debug("[사용자] 사용자 조회");
			vo = userService.selectUser(vo);
		} catch (Exception e) {
			log.debug("[사용자] 사용자 조회 실패");
			e.printStackTrace();
		}
		
		model.addAttribute("userVo", vo);
		
		log.debug("[사용자] 사용자 조회 완료");
		return "user/mypageAccountInfo";
	}
	
	@RequestMapping(value="/publicUserModify.do", method=RequestMethod.POST)
	public String publicUserModify(UserVo vo, BindingResult result, HttpSession session) throws Exception {
		try {
			UserModifyValidator userModifyValidator = new UserModifyValidator();
			userModifyValidator.validate(vo, result);

			if (result.hasErrors()) {
				log.debug("[사용자] 사용자 수정 validator ERROR");
				log.debug(result.getFieldError());
				
				return "/user/mypageAccountInfo";
			}
			
			//if (vo.getEmail_chk() == null)	vo.setEmail_chk("N");
			if (vo.getTalk_chk() == null)	vo.setTalk_chk("N");
			if (vo.getSms_chk() == null)	vo.setSms_chk("N");
			
			SecurityUtil securityUtil = new SecurityUtil();
			//String encryptPw = securityUtil.encryptSHA256(vo.getPwKey());
			//vo.setPw(encryptPw);
			
			log.debug("[사용자] 사용자 수정");
			userService.updateUser(vo);
			
			session.setAttribute("login", vo);
		} catch (Exception e) {
			log.debug("[사용자] 사용자 수정 실패");
			e.printStackTrace();
		}
		
		log.debug("[사용자] 사용자 수정 완료");
		return "/user/mypageAccountInfo";
	}
	
	@RequestMapping(value="/mypageSuggestionListPage.do")
	public String mypageSuggestionListpage(ModelMap model, SuggestionVo vo, @RequestParam(defaultValue = "1") int curPage, HttpSession session) throws Exception {
		List<SuggestionVo> suggestionList = null;
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
		model.addAttribute("sgstListSize", suggestionList.size());
		model.addAttribute("pagination", vo);
		
		return "/user/mypageSuggestionList";
	}
	
	@RequestMapping(value="/mypageSurveyListPage.do")
	public String mypageSurveyListPage(ModelMap model, SurveyVo vo, @RequestParam(defaultValue = "1") int curPage, HttpSession session) throws Exception {
		List<SurveyVo> surveyList = null;
		
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
		model.addAttribute("surveyListSize", surveyList.size());
		model.addAttribute("pagination", vo);
		
		return "/user/mypageSurveyList";
	}
	
	@RequestMapping(value="/mypageContestListPage.do")
	public String mypageContestListPage(ModelMap model, ContestVo vo, @RequestParam(defaultValue = "1") int curPage, HttpSession session) throws Exception {
		List<ContestVo> contestList = null;
		
		try {
			UserVo userVo = (UserVo) session.getAttribute("login");
			
			vo.setCreate_user(userVo.getUser_id());
			
			int listCnt = userService.selectContestListCntByMypage(vo);
			
			vo.setPagination(listCnt, curPage);
			
			contestList = userService.selectContestListByMypage(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("contestList", contestList);
		model.addAttribute("contestListSize", contestList.size());
		model.addAttribute("pagination", vo);
		
		return "/user/mypageContestList";
	}
	
	@RequestMapping(value="/smsAuthChk.do")
	public ResponseEntity<?> smsAuthTest(HttpSession session) throws Exception {
		Map<String, Object> resMap = new HashMap<>();
		
		try {
			NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();
			
			String sSiteCode = "BS821";							// NICE로부터 부여받은 사이트 코드
		    String sSitePassword = "FQjooBjIbgKQ";				// NICE로부터 부여받은 사이트 패스워드
		    
		    String sRequestNumber = "REQ0000000001";        	// 요청 번호, 이는 성공/실패후에 같은 값으로 되돌려주게 되므로 
		                                                    	// 업체에서 적절하게 변경하여 쓰거나, 아래와 같이 생성한다.
		    sRequestNumber = niceCheck.getRequestNO(sSiteCode);
		  	session.setAttribute("REQ_SEQ" , sRequestNumber);	// 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.
		  	
		   	String sAuthType = "M";      						// 없으면 기본 선택화면, M: 핸드폰, C: 신용카드, X: 공인인증서
		   	
		   	String popgubun 	= "N";							//Y : 취소버튼 있음 / N : 취소버튼 없음
			String customize 	= "";							//없으면 기본 웹페이지 / Mobile : 모바일페이지
			
			String sGender = ""; 								//없으면 기본 선택 값, 0 : 여자, 1 : 남자 
			
		    // CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
			//리턴url은 인증 전 인증페이지를 호출하기 전 url과 동일해야 합니다. ex) 인증 전 url : http://www.~ 리턴 url : http://www.~
		    String sReturnUrl = "http://soslab.jica.or.kr/user/smsAuthChkSuccess.do";      // 성공시 이동될 URL
		    String sErrorUrl = "http://soslab.jica.or.kr/checkplus_fail.jsp";          // 실패시 이동될 URL

		    // 입력될 plain 데이타를 만든다.
		    String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber +
		                        "8:SITECODE" + sSiteCode.getBytes().length + ":" + sSiteCode +
		                        "9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType +
		                        "7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl +
		                        "7:ERR_URL" + sErrorUrl.getBytes().length + ":" + sErrorUrl +
		                        "11:POPUP_GUBUN" + popgubun.getBytes().length + ":" + popgubun +
		                        "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize + 
								"6:GENDER" + sGender.getBytes().length + ":" + sGender;
		    
		    String sMessage = "";
		    String sEncData = "";
		    
		    int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
		    if( iReturn == 0 ) { sEncData = niceCheck.getCipherData(); }
		    else if( iReturn == -1) { sMessage = "암호화 시스템 에러입니다."; }    
		    else if( iReturn == -2) { sMessage = "암호화 처리오류입니다."; }    
		    else if( iReturn == -3) { sMessage = "암호화 데이터 오류입니다."; }    
		    else if( iReturn == -9) { sMessage = "입력 데이터 오류입니다."; }    
		    else { sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn; }
		    
		    resMap.put("resData", sEncData);
		    resMap.put("resMsg", sMessage);
	    } catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(resMap, HttpStatus.OK);
	}
	
	@RequestMapping(value="/smsAuthChkSuccess.do")
	public String smsAuthChkSuccess(ModelMap model, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, String> resMap = new HashMap<>();
		
		try {
			NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();

		    String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");

		    String sSiteCode = "BS821";					// NICE로부터 부여받은 사이트 코드
		    String sSitePassword = "FQjooBjIbgKQ";		// NICE로부터 부여받은 사이트 패스워드

		    //String sCipherTime = "";			// 복호화한 시간
		    String sRequestNumber = "";			// 요청 번호
		    String sMessage = "";
		    String sPlainData = "";
		    
		    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

		    if( iReturn == 0 ) {
		        sPlainData = niceCheck.getPlainData();
		        //sCipherTime = niceCheck.getCipherDateTime();
		        
		        // 데이타를 추출합니다.
		        Map<String, Object> mapresult = niceCheck.fnParse(sPlainData);
		        
		        resMap.put("sRequestNumber"	, (String)mapresult.get("REQ_SEQ"));
		        resMap.put("sResponseNumber", (String)mapresult.get("RES_SEQ"));
		        resMap.put("sAuthType"		, (String)mapresult.get("AUTH_TYPE"));
		        resMap.put("sName"			, (String)mapresult.get("NAME"));
		        resMap.put("sBirthDate"		, (String)mapresult.get("BIRTHDATE"));
		        resMap.put("sGender"		, (String)mapresult.get("GENDER"));
		        resMap.put("sNationalInfo"	, (String)mapresult.get("NATIONALINFO"));
		        resMap.put("sDupInfo"		, (String)mapresult.get("DI"));
		        resMap.put("sConnInfo"		, (String)mapresult.get("CI"));
		        resMap.put("sMobileNo"		, (String)mapresult.get("MOBILE_NO"));
		        resMap.put("sMobileCo"		, (String)mapresult.get("MOBILE_CO"));
		        
		        sRequestNumber  = (String)mapresult.get("REQ_SEQ");
		        
		        String session_sRequestNumber = (String)session.getAttribute("REQ_SEQ");
		        if(!sRequestNumber.equals(session_sRequestNumber)) {
		            sMessage = "세션값 불일치 오류입니다.";
		            resMap.put("sResponseNumber", "");
		            resMap.put("sAuthType", "");
		        }
		        
		    } 
		    else if( iReturn == -1) { sMessage = "복호화 시스템 오류입니다."; }    
		    else if( iReturn == -4) { sMessage = "복호화 처리 오류입니다."; }    
		    else if( iReturn == -5) { sMessage = "복호화 해쉬 오류입니다."; }    
		    else if( iReturn == -6) { sMessage = "복호화 데이터 오류입니다."; }    
		    else if( iReturn == -9) { sMessage = "입력 데이터 오류입니다."; }    
		    else if( iReturn == -12) { sMessage = "사이트 패스워드 오류입니다."; }    
		    else { sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn; }
		    
		    resMap.put("resMsg", sMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("res", resMap);
		
		return "user/smsAuthChkSuccess";
	} 
	
	private String requestReplace(String paramValue, String gubun) {
		String result = "";

		if (paramValue != null) {
			paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

			paramValue = paramValue.replaceAll("\\*", "");
			paramValue = paramValue.replaceAll("\\?", "");
			paramValue = paramValue.replaceAll("\\[", "");
			paramValue = paramValue.replaceAll("\\{", "");
			paramValue = paramValue.replaceAll("\\(", "");
			paramValue = paramValue.replaceAll("\\)", "");
			paramValue = paramValue.replaceAll("\\^", "");
			paramValue = paramValue.replaceAll("\\$", "");
			paramValue = paramValue.replaceAll("'", "");
			paramValue = paramValue.replaceAll("@", "");
			paramValue = paramValue.replaceAll("%", "");
			paramValue = paramValue.replaceAll(";", "");
			paramValue = paramValue.replaceAll(":", "");
			paramValue = paramValue.replaceAll("-", "");
			paramValue = paramValue.replaceAll("#", "");
			paramValue = paramValue.replaceAll("--", "");
			paramValue = paramValue.replaceAll("-", "");
			paramValue = paramValue.replaceAll(",", "");

			if (gubun != "encodeData") {
				paramValue = paramValue.replaceAll("\\+", "");
				paramValue = paramValue.replaceAll("/", "");
				paramValue = paramValue.replaceAll("=", "");
			}

			result = paramValue;

		}
		return result;
	}
	

	@RequestMapping(value="/idInquiryPage.do", method=RequestMethod.GET)
	public String idInquiry() throws Exception{
		return "/user/idInquiryPage";
	}
	

	@RequestMapping(value="/pwInquiryPage.do", method=RequestMethod.GET)	
	public String pwInquiry() throws Exception{
		return "/user/pwInquiryPage";
	}
	
	@RequestMapping(value="/checkDI.do" , method=RequestMethod.GET)
	public ResponseEntity<?> checkDI(@RequestParam("user_di") String user_di) throws Exception {
		UserVo vo = new UserVo();
		try {
			System.out.println("user_di = " + user_di);
			//해당di로 가입된 유저가 있는지 체크
			vo = userService.checkUserDi(user_di);
		} catch (Exception e) {
			log.debug("[일반사용자] 일반사용자 아이디 중복 확인 실패");
			e.printStackTrace();
		}
		
		log.debug("[일반사용자] 일반사용자 아이디 중복 확인 완료");
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}
	
	@RequestMapping(value="/changeNewPw.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> changeNewPw(UserVo vo) throws Exception {
		try {
		    System.out.println(vo);
		       
		    SecurityUtil securityUtil = new SecurityUtil();
		    String encryptPw = securityUtil.encryptSHA256(vo.getPwKey());
		    vo.setPw(encryptPw);
		    userService.changeNewPw(vo);
		    
			return new ResponseEntity<>("success", HttpStatus.OK);
		}catch(Exception e) {
			return new ResponseEntity<>("error.", HttpStatus.OK);
		}		
	}
	
	@RequestMapping(value="/changeNewPw2.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> changeNewPw2(UserVo vo) throws Exception {
		try {
		    System.out.println(vo);
		       
		    SecurityUtil securityUtil = new SecurityUtil();
		    String encryptPw = securityUtil.encryptSHA256(vo.getPwKey());
		    vo.setPw(encryptPw);
		    userService.changeNewPw2(vo);
		    
			return new ResponseEntity<>("success", HttpStatus.OK);
		}catch(Exception e) {
			return new ResponseEntity<>("error.", HttpStatus.OK);
		}		
	}
	
	@RequestMapping(value="/connectKakao.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> connectKakao(UserVo vo) throws Exception {
		try {
			System.out.println(vo);
			
			//핸드폰번호 유무 체크
			String phoneNum = vo.getPhone();
			phoneNum.replaceAll("-", "");
			vo.setPhone(phoneNum);
			
			int chk = userService.chkPhoneNum(vo);
			if(chk == 0) {
				return new ResponseEntity<>("noData", HttpStatus.OK);
			}else {
				userService.connectKakao(vo);
				return new ResponseEntity<>(vo, HttpStatus.OK);
			}
		}catch(Exception e) {
			return new ResponseEntity<>("error.", HttpStatus.OK);
		}		
	}
	
	@RequestMapping(value="/checkExistUser.do" , method=RequestMethod.GET)
	public ResponseEntity<?> checkExistUser(@RequestParam Map<String, String> params) throws Exception {
		Map<String, Object> resMap = new HashMap<>();
		System.out.println("-=-=-=-=-=-=-=-=-=-=-=-" + params);
		
		try {
			String phone = params.get("mobileNo");
			log.debug("[사용자] 사용자 핸드폰번호 중복 확인");
			int phoneChk = userService.selectCheckUserPhone(phone);
			
			if (phoneChk > 0) {
				log.debug("[사용자] 사용자 핸드폰번호 + dupInfo 중복 확인");
				int diChk = userService.selectCheckUserDiPhone(params);
				
				resMap.put("exist", diChk > 0 ? true : false);
			} else {
				resMap.put("exist", false);
			}
		} catch (Exception e) {
			log.debug("[사용자] 사용자 중복 확인 실패");
			e.printStackTrace();
		}
		
		log.debug("[사용자] 사용자 핸드폰번호 중복 확인 완료");
		return new ResponseEntity<>(resMap, HttpStatus.OK);
	}
} 
