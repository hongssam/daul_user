package egovframework.com.login.mapper;

import egovframework.com.user.vo.UserVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("loginMapper")
public interface LoginMapper {
	UserVo selectUser(UserVo vo) throws Exception;
	void setLastLogin(UserVo vo) throws Exception;
	UserVo selectKakaoUser(String userKakao_key) throws Exception;
	UserVo selectKakaoUserForLogin(UserVo vo) throws Exception;
	String getLoginHistory(UserVo vo) throws Exception;
}
