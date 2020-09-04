package egovframework.com.qna.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.qna.mapper.QnaMapper;
import egovframework.com.qna.service.QnaService;
import egovframework.com.qna.vo.QnaVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("qnaService")
public class QnaServiceImpl extends EgovAbstractServiceImpl implements QnaService{

	@Resource(name="qnaMapper")
	private QnaMapper qnaMapper;
	
	@Override
	public List<QnaVo> selectQnaList(QnaVo vo) throws Exception {
		
		return qnaMapper.selectQnaList(vo);
	}

	@Override
	public void insertQnaReply(QnaVo vo) throws Exception {
		vo.setQna_idx(qnaMapper.selectQnaReplyIdx(vo));
		System.out.println(vo);
		qnaMapper.insertQnaReply(vo);
		
	}

	@Override
	public void updateQnaReply(QnaVo vo) throws Exception {
		qnaMapper.updateQnaReply(vo);
		
	}

	@Override
	public void deleteQnaReply(QnaVo vo) throws Exception {
		qnaMapper.deleteQnaReply(vo);
	}

	@Override
	public void deleteQnaAll(QnaVo vo) throws Exception {
		qnaMapper.deleteQnaAll(vo);
		
	}

	@Override
	public void increaseViewCount(QnaVo vo) throws Exception {
		qnaMapper.increaseViewCount(vo);
	}
	
	
}
