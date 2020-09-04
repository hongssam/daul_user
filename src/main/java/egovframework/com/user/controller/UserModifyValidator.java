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
		
		String user_id = userVo.getUser_id();
		String auth_type = userVo.getAuth_type();
		String name = userVo.getName();
		String email = userVo.getEmail();
		String phone = userVo.getPhone();
		
		String emailRegExp = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";
		String phoneRegExp = "^[0-9]{2,3}\\-[0-9]{3,4}\\-[0-9]{4}";
		
		if (user_id == null || user_id.trim().isEmpty()) {
			errors.rejectValue("user_id", "user_id", "이 항목은 필수값 입니다.");
		} else {
			if (user_id.length() < 4 || user_id.length() > 10) {
				errors.rejectValue("user_id", "user_id", "4~10자리로 입력해주세요.");
			}
		}
		
		if (auth_type == null || auth_type.trim().isEmpty()) {
			errors.rejectValue("auth_type", "auth_type", "이 항목은 필수값 입니다.");
		}
		
		if (name == null || name.trim().isEmpty()) {
			errors.rejectValue("name", "name", "이 항목은 필수값 입니다.");
		}
		
		if (email == null || email.trim().isEmpty()) {
			errors.rejectValue("email", "email", "이 항목은 필수값 입니다.");
		} else {
			if (!email.matches(emailRegExp)) {
				errors.rejectValue("email", "email", "양식에 맞는 이메일을 입력해주세요. ex) example@email.com");
			}
		}
		
		if (phone == null || phone.trim().isEmpty()) {
			errors.rejectValue("phone", "phone", "이 항목은 필수값 입니다.");
		} else {
			if (!phone.matches(phoneRegExp)) {
				errors.rejectValue("phone", "phone", "양식에 맞는 전화번호를 입력해주세요. ex) xxx-xxxx-xxxx");
			}
		}
	}

}
