package egovframework.com.qna.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.qna.mapper.QnaMapper;
import egovframework.com.qna.service.QnaService;
import egovframework.com.qna.vo.QnaVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("qnaService")
public class QnaServiceImpl extends EgovAbstractServiceImpl implements QnaService {

	@Resource(name="qnaMapper")
	private QnaMapper qnaMapper;
	
	@Override
	public List<QnaVo> getQnaList(QnaVo vo) throws Exception {
		return qnaMapper.getQnaList(vo); 
	}

	@Override
	public int getQnaListCnt(QnaVo vo) throws Exception {
		return qnaMapper.getQnaListCnt(vo);
	}

	@Override
	public String selectQnaIdx() throws Exception {
		return qnaMapper.selectQnaIdx();
	}

	@Override
	public void qnaRegist(QnaVo vo) throws Exception {
		qnaMapper.qnaRegist(vo);
	}

	@Override
	public void increaseViewCount(String qna_idx) throws Exception {
		qnaMapper.increaseViewCount(qna_idx);
	}

	@Override
	public QnaVo getQnaDetail(QnaVo vo) throws Exception {
		return qnaMapper.getQnaDetail(vo);
	}

	@Override
	public QnaVo getBeforeQna(QnaVo vo) throws Exception {
		return qnaMapper.getBeforeQna(vo);
	}

	@Override
	public QnaVo getAfterQna(QnaVo vo) throws Exception {
		return qnaMapper.getAfterQna(vo);
	}
	
}
