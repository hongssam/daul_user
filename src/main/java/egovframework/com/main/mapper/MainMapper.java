package egovframework.com.main.mapper;

import java.util.List;

import egovframework.com.contest.vo.ContestVo;
import egovframework.com.notice.vo.NoticeVo;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mainMapper")
public interface MainMapper {

	List<SuggestionVo> selectSuggestionListByLately() throws Exception;
	
	List<SurveyVo> selectSurveyListByLately() throws Exception;
	
	List<ContestVo> selectContestListByLately() throws Exception;

	List<NoticeVo> selectNoticeListByLately() throws Exception;
	
	String getOnOff(String action_id) throws Exception;
}
