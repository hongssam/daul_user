package egovframework.com.login.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmmn.SecurityUtil;
import egovframework.com.login.service.LoginService;
import egovframework.com.mileage.controller.MileageController;
import egovframework.com.mileage.vo.MileageVo;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	protected Log log = LogFactory.getLog(LoginController.class);
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@Resource(name="mileageController")
	private MileageController mileageController;
	
	@RequestMapping(value="/loginPage.do")
	public String loginPage() throws Exception {
		return "login/login";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> login(@ModelAttribute UserVo vo, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpHeaders resHeaders = new HttpHeaders();
		resHeaders.add("Content-Type", "text/html; charset=utf-8");		
		
		try {
			UserVo userVo = new UserVo();
			
			userVo = loginService.selectUser(vo);
			
			if (userVo == null) {
				// 존재하지 않는 사용자
				return new ResponseEntity<>("ID 또는 PASSWORD를 확인해주세요.", resHeaders, HttpStatus.OK);
			} else {
				SecurityUtil securityUtil = new SecurityUtil();
				String encryptPw = securityUtil.encryptSHA256(vo.getPwKey());
				
				if (encryptPw.equals(userVo.getPw())) {
					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("login", userVo);
					loginService.setLastLogin(userVo);
					
					//오늘 로그인한적 있는지 체크
					String cnt = loginService.getLoginHistory(userVo);
					System.out.println("cnt = " + cnt);
					return new ResponseEntity<>("success", resHeaders, HttpStatus.OK);
				} else {
					// 비번 틀림 
					return new ResponseEntity<>("ID 또는 PASSWORD를 확인해주세요.", resHeaders, HttpStatus.OK);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) throws Exception {
		System.out.println(session.getAttribute("kakao_token"));
		session.invalidate();
		
		return "redirect:/main/main.do";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/kakaoUserLogin.do", method=RequestMethod.POST)
	public ResponseEntity<?> kakaoUserLogin(@RequestBody Map<String, Object> params, HttpServletRequest request) throws Exception {
		try {
			Map<String, Object> kakao_account = (Map<String, Object>) params.get("kakao_account");
			
			String phone_number = (String) kakao_account.get("phone_number");
			phone_number = phone_number.replaceAll(" ", "").replaceAll("-", "").replace("+82", "0");
			MileageVo mileageVo = new MileageVo();
			UserVo vo = new UserVo();
			vo.setKakao_key(String.valueOf(params.get("id")));
			vo.setPhone(phone_number);
			vo = loginService.selectKakaoUserForLogin(vo);
			
			if (vo != null) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("kakao_token", params.get("access_token"));
				httpSession.setAttribute("login", vo);
				loginService.setLastLogin(vo);
				
				//오늘 로그인한적 있는지 체크
				String cnt = loginService.getLoginHistory(vo);
				System.out.println("cnt = " + cnt);
				if(cnt.equals("0")) {
					//마일리지 부여
					mileageVo.setAction_id("LOGIN01"); 
					mileageVo.setBoard_id("-");
					mileageVo.setUser_id(vo.getPhone());
					mileageController.AccumulateMileage(mileageVo);
					
				}
				
			} else {
				return new ResponseEntity<>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	
	
	@RequestMapping(value="/kakaoLogin.do", method=RequestMethod.GET)
	public String kakaLogin(@RequestParam("user_key") String userchannel_key, @RequestParam("forward") String forward, HttpServletRequest request) throws Exception {
		System.out.println("userchannel_Key = " + userchannel_key);
		UserVo vo = new UserVo();
		vo = loginService.selectKakaoUser(userchannel_key);
		System.out.println("forward = " + forward);
		if (vo != null) {
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("login", vo);
			loginService.setLastLogin(vo);
		
		} else {
			throw new Exception();
		}
		
		return "redirect:"+forward;
	}
	
	
	@RequestMapping(value="/insertPhoneNumber.do")
	public String insertPhoneNumber(@RequestParam("user_key") String userchannel_key, @RequestParam("forward") String forward , ModelMap model) throws Exception {
		System.out.println( "userchannel_key = "  + userchannel_key);
		
		model.addAttribute("userchannel_key", userchannel_key);
		model.addAttribute("forward", forward);
		
		return "user/insertPhoneNumber";
	}
}
