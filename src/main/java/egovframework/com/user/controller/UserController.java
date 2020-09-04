package egovframework.com.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmmn.SecurityUtil;
import egovframework.com.user.service.UserService;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	protected Log log = LogFactory.getLog(UserController.class);
	
	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "userValidator")
	private UserValidator userValidator;
	
	@Resource(name = "userModifyValidator")
	private UserModifyValidator userModifyValidator;
	
	@RequestMapping(value = "/userListPage.do")
	public String suggestionListPage( @RequestParam("auth_type") String auth_type) {
		if(auth_type.equals("admin")) {
			return "user/adminUserList";
		}else {
			return "user/publicUserList";
		}
	}

	@RequestMapping(value="/getUserList.do")
	public ResponseEntity<?> userListPage(ModelMap model,UserVo userVo) throws Exception{
		List<UserVo> userList = null;
		UserVo vo = new UserVo();
		
		try {
		//	vo.setAuth_type(userVo);
			userList = userService.selectUserList(userVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(userList, HttpStatus.OK);
	}
	
	@RequestMapping(value="userDetailPage.do")
	public String publicUserDetailPage(ModelMap model, @RequestParam("id") String id) throws Exception{
		UserVo vo = new UserVo();
		UserVo userCntVo = new UserVo();
		
		
		
		try {
			vo.setUser_id(id);
			
			userCntVo = userService.selectUserCnt(vo);
			vo = userService.selectUser(vo);
			
			System.out.println("userCntVo = " + userCntVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("userCntVo", userCntVo);
		model.addAttribute("userVo", vo);
		
		if ("admin".equals(vo.getAuth_type()) ) {
			return "user/adminUserDetail";
		} else {
			return "user/publicUserDetail";
		}
	}
	
	@RequestMapping(value="/update.do", method = RequestMethod.POST)
	public String userUpdate(UserVo vo, BindingResult result) throws Exception {
		log.debug("UserVo : " + vo);
		userModifyValidator.validate(vo, result);
		
		try {
			if (result.hasErrors()) {
				log.debug("[사용자] 사용자 수정 validator ERROR");
				log.debug(result.getFieldError());
				
				if ("admin".equals(vo.getAuth_type())) {
					return "/user/adminUserDetail";
				} else {
					return "/user/publicUserDetail";
				}
			}
			
			log.debug("[사용자] 사용자 수정");
			userService.updateUser(vo);
		} catch (Exception e) {
			log.debug("[사용자] 사용자 수정 실패");
			e.printStackTrace();
		}
		
		log.debug("[사용자] 사용자 수정 완료");
		return "redirect:/user/userListPage.do?auth_type=" + vo.getAuth_type();
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public String userDelete(UserVo vo) throws Exception {
		try {
			userService.deleteUser(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/user/userListPage.do?auth_type=" + vo.getAuth_type();
	}
	
	@RequestMapping(value="/userRegistPage.do")
	public String userRegistPage(ModelMap model, @RequestParam("auth_type") String auth_type) {
		model.addAttribute("userVo", new UserVo());
		
		if ("admin".equals(auth_type)) {
			return "user/adminUserRegist";
		} else {
			return "user/publicUserRegist";
		}
	}
	
	@RequestMapping(value="/create.do", method=RequestMethod.POST)
	public String createUser(UserVo vo, BindingResult result) throws Exception {
		try {
			userValidator.validate(vo, result);
			
			if (result.hasErrors()) {
				log.debug("[사용자] 사용자 등록 validator ERROR");
				log.debug(result.getFieldError().getDefaultMessage());
				
				if ("admin".equals(vo.getAuth_type())) {
					return "/user/adminUserRegist";
				} else {
					return "/user/publicUserRegist";
				}
			}
			
			SecurityUtil securityUtil = new SecurityUtil();
			String encryptPw = securityUtil.encryptSHA256(vo.getPwKey());
			vo.setPw(encryptPw);
			
			userService.createUser(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/user/userListPage.do?auth_type=" + vo.getAuth_type();
	}
	
	@RequestMapping(value="/updateUserPw.do", method=RequestMethod.POST)
	public ResponseEntity<?> updateUserPw(UserVo vo) throws Exception{
		try {
			System.out.println(vo);
			if (vo.getPw() != null && !"".equals(vo.getPw())) {
				SecurityUtil securityUtil = new SecurityUtil();
				String encryptPw = securityUtil.encryptSHA256(vo.getPwKey());
				vo.setPw(encryptPw);
			}
			
			userService.updateUserPw(vo);
			
			return new ResponseEntity<>("success update user password", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
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
}
