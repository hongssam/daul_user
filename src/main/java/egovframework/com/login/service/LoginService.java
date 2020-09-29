package egovframework.com.login.service;

import egovframework.com.user.vo.UserVo;

public interface LoginService {
	UserVo selectUser(UserVo vo) throws Exception; 
	void setLastLogin(UserVo vo) throws Exception;
}
