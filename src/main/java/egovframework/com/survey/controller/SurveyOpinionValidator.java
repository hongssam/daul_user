package egovframework.com.survey.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import egovframework.com.survey.vo.SurveyOpinionVo;


public class SurveyOpinionValidator implements Validator {
	@Override
	public boolean supports(Class<?> arg0) {
		return SurveyOpinionVo.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		SurveyOpinionVo surveyOpinionVo = (SurveyOpinionVo) obj;
		
		String opinion_content = surveyOpinionVo.getOpinion_content();
		
		if(opinion_content == null || opinion_content.trim().isEmpty()) {
			errors.rejectValue("opinion_content","opinion_content","이 항목은 필수값 입니다.");
		}
		
		if(opinion_content.length() > 5000) {
			errors.rejectValue("opinion_content","opinion_content","내용은 5000자 이내로 작성해주세요.");
		}
		
	}
}
