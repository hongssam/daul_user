package egovframework.com.suggestion.service;

import java.util.List;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.suggestion.vo.SuggestionOpinionVo;
import egovframework.com.suggestion.vo.SuggestionVo;

public interface SuggestionService {

	String selectSuggestionIdx() throws Exception;

	int registSuggestion(SuggestionVo vo) throws Exception;

	void insertFile(FileVo fileVo) throws Exception;
	
	List<SuggestionVo> selectSuggestionList(SuggestionVo vo) throws Exception;

	SuggestionVo selectSuggestion(String suggestion_idx) throws Exception;

	List<SuggestionOpinionVo> selectSuggestionOpinionList(String suggestion_idx) throws Exception;

	SuggestionOpinionVo selectParentSuggestionOpinion(SuggestionOpinionVo vo) throws Exception;
	
	void updateChildSuggestionOpinion(SuggestionOpinionVo topOpnVo) throws Exception;

	String selectSuggestionOpinionIdx() throws Exception;

	void insertSuggestionOpinion(SuggestionOpinionVo vo) throws Exception;

	void deleteSuggestionOpinion(SuggestionOpinionVo vo) throws Exception;
}
