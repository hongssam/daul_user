package egovframework.com.faq.service;

import java.util.List;

import egovframework.com.faq.vo.FaqVo;

public interface FaqService {
	
	public List<FaqVo> selectFaqList(FaqVo vo) throws Exception;
	void insertFaq(FaqVo vo) throws Exception;
	void updateFaq(FaqVo vo) throws Exception;
	void deleteFaq(FaqVo vo) throws Exception;
}
