package egovframework.com.faq.service;

import java.util.List;

import egovframework.com.faq.vo.FaqVo;

public interface FaqService {
	List<FaqVo> getFaqList() throws Exception;
}
