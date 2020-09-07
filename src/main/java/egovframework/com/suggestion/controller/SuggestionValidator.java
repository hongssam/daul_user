package egovframework.com.suggestion.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import egovframework.com.suggestion.vo.SuggestionVo;

public class SuggestionValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> arg0) {
		return SuggestionVo.class.isAssignableFrom(arg0);
	}
	
	@Override
	public void validate(Object obj, Errors errors) {
		SuggestionVo suggestionVo = (SuggestionVo) obj;
		
		String title = suggestionVo.getTitle();
		String content = suggestionVo.getContent();
		System.out.println("제목길이 = " + title.length() + ", 내용길이 = " + content.length());
		if(title == null || title.trim().isEmpty()) {
			errors.rejectValue("title","title","이 항목은 필수값 입니다.");
		}
		if(content == null || content.trim().isEmpty()) {
			errors.rejectValue("content","content","이 항목은 필수값 입니다.");
		}		
		if(title.length() > 100) {
			errors.rejectValue("title","title","제목은 100자 이내로 작성해주세요.");
		}
		if(content.length() > 5000) {
			errors.rejectValue("content","content","제안은 5000자 이내로 작성해주세요.");
		}
	}
}
