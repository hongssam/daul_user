package egovframework.com.user.service;

import java.util.List;
import java.util.Map;

import egovframework.com.contest.vo.ContestVo;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.com.user.vo.UserVo;

public interface UserService {

	int selectKakaoAccount(Map<String, Object> params) throws Exception;

	void insertKakaoUser(UserVo vo) throws Exception;

	int selectUserIdCheck(String user_id) throws Exception;

	void insertPublicUser(UserVo vo) throws Exception;

	UserVo selectUser(UserVo vo) throws Exception;

	void updateUser(UserVo vo) throws Exception;

	List<SuggestionVo> selectSuggestionListByMypage(SuggestionVo vo) throws Exception;

	int selectSuggestionListCntByMypage(SuggestionVo vo) throws Exception;

	int selectSurveyListCntByMypage(SurveyVo vo) throws Exception;

	List<SurveyVo> selectSurveyListByMypage(SurveyVo vo) throws Exception;

	int selectContestListCntByMypage(ContestVo vo) throws Exception;

	List<ContestVo> selectContestListByMypage(ContestVo vo) throws Exception;

}
