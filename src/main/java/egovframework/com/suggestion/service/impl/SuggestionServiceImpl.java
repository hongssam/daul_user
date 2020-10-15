package egovframework.com.suggestion.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.suggestion.mapper.SuggestionMapper;
import egovframework.com.suggestion.service.SuggestionService;
import egovframework.com.suggestion.vo.SuggestionOpinionVo;
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

	@Override
	public List<SuggestionVo> selectSuggestionList(SuggestionVo vo) throws Exception {
		return suggestionMapper.selectSuggestionList(vo);
	}

	@Override
	public SuggestionVo selectSuggestion(Map<String, String> params) throws Exception {
		return suggestionMapper.selectSuggestion(params);
	}

	@Override
	public List<Map<String, String>> selectSuggestionOpinionList(SuggestionOpinionVo vo) throws Exception {
		return suggestionMapper.selectSuggestionOpinionList(vo);
	}

	@Override
	public SuggestionOpinionVo selectParentSuggestionOpinion(SuggestionOpinionVo vo) throws Exception {
		return suggestionMapper.selectParentSuggestionOpinion(vo);
	}

	@Override
	public void updateChildSuggestionOpinion(SuggestionOpinionVo topOpnVo) throws Exception {
		suggestionMapper.updateChildSuggestionOpinion(topOpnVo);
	}

	@Override
	public String selectSuggestionOpinionIdx() throws Exception {
		return suggestionMapper.selectSuggestionOpinionIdx();
	}

	@Override
	public void insertSuggestionOpinion(SuggestionOpinionVo vo) throws Exception {
		suggestionMapper.insertSuggestionOpinion(vo);
	}

	@Override
	public void deleteSuggestionOpinion(SuggestionOpinionVo vo) throws Exception {
		suggestionMapper.deleteSuggestionOpinion(vo);
	}

	@Override
	public Map<String, String> selectSuggestionUserLike(Map<String, String> params) throws Exception {
		return suggestionMapper.selectSuggestionUserLike(params);
	}

	@Override
	public void insertSuggestionUserLike(Map<String, String> params) throws Exception {
		suggestionMapper.insertSuggestionUserLike(params);
	}

	@Override
	public int selectSuggestionLikeCount(String suggestion_idx) throws Exception {
		return suggestionMapper.selectSuggestionLikeCount(suggestion_idx);
	}

	@Override
	public void deleteSuggestionUserLike(Map<String, String> params) throws Exception {
		suggestionMapper.deleteSuggestionUserLike(params);
	}

	@Override
	public List<Map<String, String>> selectSuggestionFileList(Map<String, String> params) throws Exception {
		return suggestionMapper.selectSuggestionFileList(params);
	}

	@Override
	public FileVo selectSuggestionDownloadFile(FileVo fileVo) throws Exception {
		return suggestionMapper.selectSuggestionDownloadFile(fileVo);
	}

	@Override
	public String selectSuggestionOpinionCount(SuggestionOpinionVo vo) throws Exception {
		return suggestionMapper.selectSuggestionOpinionCount(vo);
	}

	@Override
	public int selectSuggestionListCnt(SuggestionVo vo) throws Exception {
		return suggestionMapper.selectSuggestionListCnt(vo);
	}

	@Override
	public void deleteFile(FileVo fileVo) throws Exception {
		suggestionMapper.deleteFile(fileVo);
	}

	@Override
	public int updateSuggestion(SuggestionVo vo) throws Exception {
		return suggestionMapper.updateSuggestion(vo);
	}

	@Override
	public int deleteSuggestion(SuggestionVo vo) throws Exception {
		return suggestionMapper.deleteSuggestion(vo);
	}

	@Override
	public void deleteAllOpinion(SuggestionVo vo) throws Exception {
		suggestionMapper.deleteAllOpinion(vo);
	}

	@Override
	public void deleteAllFile(SuggestionVo vo) throws Exception {
		suggestionMapper.deleteAllFile(vo);
	}

}
