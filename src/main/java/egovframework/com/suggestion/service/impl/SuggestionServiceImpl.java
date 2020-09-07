package egovframework.com.suggestion.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.suggestion.mapper.SuggestionMapper;
import egovframework.com.suggestion.service.SuggestionService;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("suggestionService")
public class SuggestionServiceImpl extends EgovAbstractServiceImpl implements SuggestionService {

	@Resource(name="suggestionMapper")
	private SuggestionMapper suggestionMapper;
	
	@Override
	public String selectSuggestionIdx() throws Exception {
		return suggestionMapper.selectSuggestionIdx();
	}

	@Override
	public int registSuggestion(SuggestionVo vo) throws Exception {
		return suggestionMapper.registSuggestion(vo);
	}

	@Override
	public void insertFile(FileVo fileVo) throws Exception {
		suggestionMapper.insertFile(fileVo);
	}

}
