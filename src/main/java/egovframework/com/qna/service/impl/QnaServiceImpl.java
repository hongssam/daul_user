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
	public List<QnaVo> getQnaList() throws Exception {
		return qnaMapper.getQnaList(); 
	}
	
}
