package egovframework.com.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String userRegistPage() throws Exception {
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
			int count = userService.selectKakaoAccount(params);
			
			resMap.put("exist", count > 0 ? true : false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(resMap, HttpStatus.OK);
	}
	
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
			
			userService.insertKakaoUser(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
}
