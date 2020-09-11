package egovframework.com.faq.mapper;

import java.util.List;

import egovframework.com.faq.vo.FaqVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("faqMapper")
public interface FaqMapper {
	List<FaqVo> getFaqList();

}
