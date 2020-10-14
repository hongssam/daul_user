package egovframework.com.user.controller;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import egovframework.com.user.vo.UserVo;

@Component
public class UserModifyValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return UserVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		UserVo userVo = (UserVo) target;
		
		//String pw = userVo.getPw();
		String name = userVo.getName();
		//String email = userVo.getEmail();
		
		String pwRegExp = "^(?=.*[a-z])(?=.*[0-9])(?=.*\\d)(?=.*[~`!@#$%\\^&*()-]).{8,15}$";
		String emailRegExp = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";
		
//		if (pw == null || pw.trim().isEmpty()) {
//			errors.rejectValue("pw", "pw", "이 항목은 필수값 입니다.");
//		} else {
//			if (!pw.matches(pwRegExp)) {
//				errors.rejectValue("pw", "pw", "영문자, 숫자, 특수문자가 포함된 8~15자리로 입력해 주세요.");
//			}
//		}
		
		if (name == null || name.trim().isEmpty()) {
			errors.rejectValue("name", "name", "이 항목은 필수값 입니다.");
		}
		
//		if (email == null || email.trim().isEmpty()) {
//			errors.rejectValue("email", "email", "이 항목은 필수값 입니다.");
//		} else {
//			if (!email.matches(emailRegExp)) {
//				errors.rejectValue("email", "email", "양식에 맞는 이메일을 입력해주세요. ex) example@email.com");
//			}
//		}
	}
}
