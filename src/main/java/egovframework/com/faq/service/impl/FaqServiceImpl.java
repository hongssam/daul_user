package egovframework.com.faq.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.faq.mapper.FaqMapper;
import egovframework.com.faq.service.FaqService;
import egovframework.com.faq.vo.FaqVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("faqService")
public class FaqServiceImpl  extends EgovAbstractServiceImpl implements FaqService{
	
	@Resource(name="faqMapper")
	private FaqMapper faqMapper;

	@Override
	public List<FaqVo> getFaqListMain() throws Exception {
		return faqMapper.getFaqListMain();
	}

	@Override
	public List<FaqVo> getFaqListSuggestion() throws Exception {
		return faqMapper.getFaqListSuggestion();
	}

	@Override
	public List<FaqVo> getFaqListContest() throws Exception {
		return faqMapper.getFaqListContest();
	}

	@Override
	public List<FaqVo> getFaqListSurvey() throws Exception {
		return faqMapper.getFaqListSurvey();
	}
	
	

}
