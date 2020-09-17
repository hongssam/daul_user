package egovframework.com.user.service;

import java.util.Map;

import egovframework.com.user.vo.UserVo;

public interface UserService {

	int selectKakaoAccount(Map<String, Object> params) throws Exception;

	void insertKakaoUser(UserVo vo) throws Exception;

	int selectUserIdCheck(String user_id) throws Exception;

	void insertPublicUser(UserVo vo) throws Exception;

	UserVo selectUser(UserVo vo) throws Exception;

}
