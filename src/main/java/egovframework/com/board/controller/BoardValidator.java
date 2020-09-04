package egovframework.com.board.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import egovframework.com.board.vo.BoardVo;


public class BoardValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> arg0) {
		return BoardVo.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		BoardVo boardVo = (BoardVo) obj;
		
		String title = boardVo.getTitle();
		String content = boardVo.getContent();
		
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
			errors.rejectValue("content","content","내용은 5000자 이내로 작성해주세요.");
		}
	}
}
