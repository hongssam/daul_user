package egovframework.com.qna.mapper;

import java.util.List;

import egovframework.com.qna.vo.QnaVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("qnaMapper")
public interface QnaMapper {
	List<QnaVo> getQnaList(QnaVo vo) throws Exception;
	int getQnaListCnt(QnaVo vo) throws Exception;
}
