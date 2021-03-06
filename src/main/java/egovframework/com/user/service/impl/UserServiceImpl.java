package egovframework.com.user.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmmn.NotificationVo;
import egovframework.com.cmmn.util.LogVo;
import egovframework.com.contest.vo.ContestVo;
import egovframework.com.suggestion.vo.SuggestionOpinionVo;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.com.user.mapper.UserMapper;
import egovframework.com.user.service.UserService;
import egovframework.com.user.vo.UserVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("userService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements UserService {

	@Resource(name="userMapper")
	private UserMapper userMapper;
	
	@Override
	public int selectKakaoAccount(Map<String, Object> params) throws Exception {
		return userMapper.selectKakaoAccount(params);
	}

	@Override
	public void insertKakaoUser(UserVo vo) throws Exception {
		userMapper.insertKakaoUser(vo);
	}

	@Override
	public int selectUserIdCheck(String user_id) throws Exception {
		return userMapper.selectUserIdCheck(user_id);
	}

	@Override
	public void insertPublicUser(UserVo vo) throws Exception {
		userMapper.insertPublicUser(vo);
	}

	@Override
	public UserVo selectUser(UserVo vo) throws Exception {
		return userMapper.selectUser(vo);
	}

	@Override
	public void updateUser(UserVo vo) throws Exception {
		userMapper.updateUser(vo);
	}

	@Override
	public List<SuggestionVo> selectSuggestionListByMypage(SuggestionVo vo) throws Exception {
		return userMapper.selectSuggestionListByMypage(vo);
	}

	@Override
	public int selectSuggestionListCntByMypage(SuggestionVo vo) throws Exception {
		return userMapper.selectSuggestionListCntByMypage(vo);
	}

	@Override
	public int selectSurveyListCntByMypage(SurveyVo vo) throws Exception {
		return userMapper.selectSurveyListCntByMypage(vo);
	}

	@Override
	public List<SurveyVo> selectSurveyListByMypage(SurveyVo vo) throws Exception {
		return userMapper.selectSurveyListByMypage(vo);
	}

	@Override
	public int selectContestListCntByMypage(ContestVo vo) throws Exception {
		return userMapper.selectContestListCntByMypage(vo);
	}

	@Override
	public List<ContestVo> selectContestListByMypage(ContestVo vo) throws Exception {
		return userMapper.selectContestListByMypage(vo);
	}

	@Override
	public UserVo checkUserDi(String user_di) throws Exception {
		return userMapper.checkUserDi(user_di);
	}

	@Override
	public void changeNewPw(UserVo vo) throws Exception {
			userMapper.changeNewPw(vo);
	}
	

	@Override
	public void changeNewPw2(UserVo vo) throws Exception {
			userMapper.changeNewPw2(vo);
	}

	@Override
	public int chkKakaoKey(String user_key) throws Exception {
		return userMapper.chkKakaoKey(user_key);
	}

	@Override
	public void connectKakao(UserVo vo) throws Exception {
		userMapper.connectKakao(vo);	
	}

	@Override
	public int chkPhoneNum(UserVo vo) throws Exception {
		return userMapper.chkPhoneNum(vo);
	}

	@Override
	public int selectCheckUserPhone(String phone) throws Exception {
		return userMapper.selectCheckUserPhone(phone);
	}

	@Override
	public int selectCheckUserDiPhone(Map<String, String> params) throws Exception {
		return userMapper.selectCheckUserDiPhone(params);
	}

	@Override
	public void updatePublicUser(UserVo vo) throws Exception {
		userMapper.updatePublicUser(vo);
	}

	@Override
	public int selectCheckUserKakaokeyPhone(UserVo vo) throws Exception {
		return userMapper.selectCheckUserKakaokeyPhone(vo);
	}

	@Override
	public void updateKakaoUser(UserVo vo) throws Exception {
		userMapper.updateKakaoUser(vo);
	}

	@Override
	public void saveUserLog(LogVo vo) throws Exception {
		userMapper.saveUserLog(vo);
	}

	@Override
	public String getUserNotificationYN(UserVo vo) throws Exception {
		return userMapper.getUserNotificationYN(vo);
	}

	@Override
	public String getActionYN(NotificationVo vo) throws Exception {
		return userMapper.getActionYN(vo);
	}

	@Override
	public String getTmpNum(String action_id) throws Exception {
		return userMapper.getTmpNum(action_id);
	}

	@Override
	public NotificationVo getNotificationVo(SuggestionOpinionVo vo) throws Exception {
		return userMapper.getNotificationVo(vo);
	}

	@Override
	public String getUserNotificationYN2(SuggestionOpinionVo vo) throws Exception {
		return userMapper.getUserNotificationYN2(vo);
	}

	@Override
	public String getAuth(NotificationVo vo) throws Exception {
		return userMapper.getAuth(vo);
	}
	
	
}
