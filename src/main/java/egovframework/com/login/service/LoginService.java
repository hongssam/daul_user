package egovframework.com.login.service;

import egovframework.com.user.vo.UserVo;

public interface LoginService {
	UserVo selectUser(UserVo vo) throws Exception; 
	void setLastLogin(UserVo vo) throws Exception;
	UserVo selectKakaoUser(String userKakao_key) throws Exception;
	UserVo selectKakaoUserForLogin(UserVo vo) throws Exception;
	
	String getLoginHistory(UserVo vo) throws Exception;
}
