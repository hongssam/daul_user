package egovframework.com.qna.service;

import java.util.List;

import egovframework.com.qna.vo.QnaVo;

public interface QnaService {
	List<QnaVo> getQnaList(QnaVo vo) throws Exception;
	int getQnaListCnt(QnaVo vo) throws Exception;
	
}
