package egovframework.com.suggestion.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import egovframework.com.suggestion.vo.SuggestionOpinionVo;



public class SuggestionOpinionValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		return SuggestionOpinionVo.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		SuggestionOpinionVo suggestionOpinionVo = (SuggestionOpinionVo) obj;
		
		String opinion_content = suggestionOpinionVo.getOpinion_content();
		
		if(opinion_content == null || opinion_content.trim().isEmpty()) {
			errors.rejectValue("opinion_content", "opinion_content", "의견 내용을 입력해 주세요.");
		}
		
		if(opinion_content.length() > 5000) {
			errors.rejectValue("opinion_content", "opinion_content", "내용은 5000자 이내로 작성해주세요.");
		}
		
	}
}
