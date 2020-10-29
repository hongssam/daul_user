package egovframework.com.user.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.cmmn.NotificationVo;
import egovframework.com.cmmn.util.LogVo;
import egovframework.com.contest.vo.ContestVo;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.com.user.vo.UserVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userMapper")
public interface UserMapper {

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

	UserVo checkUserDi(String user_di) throws Exception;
	
	void changeNewPw(UserVo vo) throws Exception;
	
	void changeNewPw2(UserVo vo) throws Exception;

	int chkKakaoKey(String user_key) throws Exception;
	
	void connectKakao(UserVo vo) throws Exception;
	
	int chkPhoneNum(UserVo vo) throws Exception;

	int selectCheckUserPhone(String phone) throws Exception;

	int selectCheckUserDiPhone(Map<String, String> params) throws Exception;

	void updatePublicUser(UserVo vo) throws Exception;

	int selectCheckUserKakaokeyPhone(UserVo vo) throws Exception;

	void updateKakaoUser(UserVo vo) throws Exception;
	
	void saveUserLog(LogVo vo) throws Exception;
	
	String getUserNotificationYN(UserVo vo) throws Exception;
	
	String getActionYN(NotificationVo vo) throws Exception;
}

