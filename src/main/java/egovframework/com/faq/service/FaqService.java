package egovframework.com.faq.service;

import java.util.List;

import egovframework.com.faq.vo.FaqVo;

public interface FaqService {
	List<FaqVo> getFaqListMain() throws Exception;
	List<FaqVo> getFaqListSuggestion() throws Exception;
	List<FaqVo> getFaqListContest() throws Exception;
	List<FaqVo> getFaqListSurvey() throws Exception;
}
