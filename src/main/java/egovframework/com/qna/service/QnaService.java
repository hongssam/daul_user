package egovframework.com.qna.service;

import java.util.List;

import egovframework.com.qna.vo.QnaVo;

public interface QnaService {
	List<QnaVo> getQnaList(QnaVo vo) throws Exception;
	int getQnaListCnt(QnaVo vo) throws Exception;
	String selectQnaIdx() throws Exception;
	void qnaRegist(QnaVo vo) throws Exception;
	void increaseViewCount(String qna_idx) throws Exception;
	QnaVo getQnaDetail(QnaVo vo) throws Exception;

	QnaVo getBeforeQna(QnaVo vo) throws Exception;
	QnaVo getAfterQna(QnaVo vo) throws Exception;
}
