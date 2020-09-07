package egovframework.com.suggestion.mapper;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("suggestionMapper")
public interface SuggestionMapper {

	String selectSuggestionIdx() throws Exception;

	int registSuggestion(SuggestionVo vo) throws Exception;

	void insertFile(FileVo fileVo) throws Exception;

}
