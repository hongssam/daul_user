package egovframework.com.qna.service;

import java.util.List;
import java.util.Map;

import egovframework.com.qna.vo.QnaVo;

public interface QnaService {
	public List<QnaVo> selectQnaList(QnaVo vo) throws Exception;
	void insertQnaReply(QnaVo vo) throws Exception; 
	void updateQnaReply(QnaVo vo) throws Exception;
	void deleteQnaReply(QnaVo vo) throws Exception;
	void deleteQnaAll(QnaVo vo) throws Exception;
	void increaseViewCount(QnaVo vo)throws Exception;
}
