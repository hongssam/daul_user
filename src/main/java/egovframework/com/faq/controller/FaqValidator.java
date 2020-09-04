package egovframework.com.faq.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import egovframework.com.faq.vo.FaqVo;


public class FaqValidator implements Validator{
	@Override
	public boolean supports(Class<?> arg0) {
		return FaqVo.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		FaqVo faqVo = (FaqVo) obj;
		String question = faqVo.getQuestion();
		String answer = faqVo.getAnswer();
		
		if(answer == null || answer.trim().isEmpty()) {
			errors.rejectValue("answer","answer","이 항목은 필수값 입니다.");			
		}
		if(question == null || question.trim().isEmpty()) {
			errors.rejectValue("question","question","이 항목은 필수값 입니다.");			
		}
		
		if(answer.length() > 1000) {
			errors.rejectValue("answer","answer","질의는 1000자 이내로 작성해주세요.");
		}
		if(question.length() > 1000) {
			errors.rejectValue("question","question","응답은 1000자 이내로 작성해주세요.");
		}
		
	}
}
