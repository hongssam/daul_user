package egovframework.com.suggestion.mapper;

import java.util.List;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.suggestion.vo.SuggestionOpinionVo;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("suggestionMapper")
public interface SuggestionMapper {

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
}
