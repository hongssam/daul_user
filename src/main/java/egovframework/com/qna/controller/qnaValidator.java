package egovframework.com.qna.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import egovframework.com.qna.vo.QnaVo;

public class qnaValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		return QnaVo.class.isAssignableFrom(arg0);
		}

	@Override
	public void validate(Object obj, Errors errors) {
		QnaVo qnaVo = (QnaVo) obj;
		
		String question = qnaVo.getQuestion();
		String content = qnaVo.getContent();
		System.out.println("제목길이 = " + question.length() + ", 내용길이 = " + content.length());
		if(question == null || question.trim().isEmpty()) {
			errors.rejectValue("question","question","이 항목은 필수값 입니다.");
		}
		if(content == null || content.trim().isEmpty()) {
			errors.rejectValue("content","content","이 항목은 필수값 입니다.");
		}		
		if(question.length() > 100) {
			errors.rejectValue("question","question","제목은 100자 이내로 작성해주세요.");
		}
		if(content.length() > 5000) {
			errors.rejectValue("content","content","제안은 5000자 이내로 작성해주세요.");
		}		
	}

}
