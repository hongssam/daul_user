package egovframework.com.faq.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.faq.vo.FaqVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("faqMapper")
public interface FaqMapper {
	List<FaqVo> selectFaqList(FaqVo vo);
	void insertFaq(FaqVo vo) throws Exception;
	String selectFaqIdx() throws Exception;
	void updateFaq(FaqVo vo) throws Exception;
	void deleteFaq(FaqVo vo) throws Exception;
}
