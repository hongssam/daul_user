package egovframework.com.suggestion.service;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.suggestion.vo.SuggestionVo;

public interface SuggestionService {

	String selectSuggestionIdx() throws Exception;

	int registSuggestion(SuggestionVo vo) throws Exception;

	void insertFile(FileVo fileVo) throws Exception;

}
