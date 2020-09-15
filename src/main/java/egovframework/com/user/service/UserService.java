package egovframework.com.user.service;

import java.util.Map;

import egovframework.com.user.vo.UserVo;

public interface UserService {

	int selectKakaoAccount(Map<String, Object> params) throws Exception;

	void insertKakaoUser(UserVo vo) throws Exception;

}
