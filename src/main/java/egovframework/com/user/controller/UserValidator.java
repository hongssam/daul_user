package egovframework.com.user.controller;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import egovframework.com.user.vo.UserVo;

@Component
public class UserValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return UserVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		UserVo userVo = (UserVo) target;
		
		String user_id = userVo.getUser_id();
		//String channel = userVo.getChannel();
		String auth_type = userVo.getAuth_type();
		String name = userVo.getName();
		String pw = userVo.getPw();
		//String email = userVo.getEmail();
		String phone = userVo.getPhone();
		
		//String emailRegExp = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";
		//String phoneRegExp = "^[0-9]{2,3}\\-[0-9]{3,4}\\-[0-9]{4}";
		String pwRegExp = "^(?=.*[a-z])(?=.*[0-9])(?=.*\\d)(?=.*[~`!@#$%\\^&*()-]).{8,15}$";
		String idRegExp = "^[a-zA-Z0-9_]{5,15}";
		
		if (user_id == null || user_id.trim().isEmpty()) {
			errors.rejectValue("user_id", "user_id", "이 항목은 필수값 입니다.");
		} else {
			if (!user_id.matches(idRegExp)) {
				errors.rejectValue("user_id", "user_id", "영문자, 숫자, 특수문자 _만 사용 가능하며 5~15자리로 입력해 주세요.");
			}
		}
		
//		if (channel == null || channel.trim().isEmpty()) {
//			errors.rejectValue("channel", "channel", "이 항목은 필수값 입니다.");
//		}
		
		if (auth_type == null || auth_type.trim().isEmpty()) {
			errors.rejectValue("auth_type", "auth_type", "이 항목은 필수값 입니다.");
		}
		
		if (name == null || name.trim().isEmpty()) {
			errors.rejectValue("name", "name", "이 항목은 필수값 입니다.");
		}
		
		if (pw == null || pw.trim().isEmpty()) {
			errors.rejectValue("pw", "pw", "이 항목은 필수값 입니다.");
		} else {
			if (!pw.matches(pwRegExp)) {
				errors.rejectValue("pw", "pw", "영문자, 숫자, 특수문자가 포함된 8~15자리로 입력해 주세요.");
			}
		}
		
//		if (email == null || email.trim().isEmpty()) {
//			errors.rejectValue("email", "email", "이 항목은 필수값 입니다.");
//		} else {
//			if (!email.matches(emailRegExp)) {
//				errors.rejectValue("email", "email", "양식에 맞는 이메일을 입력해주세요. ex) example@email.com");
//			}
//		}
		
		if (phone == null || phone.trim().isEmpty()) {
			errors.rejectValue("phone", "phone", "이 항목은 필수값 입니다.");
		}
	}
}
