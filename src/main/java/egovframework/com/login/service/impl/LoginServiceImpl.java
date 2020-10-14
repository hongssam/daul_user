package egovframework.com.login.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.login.mapper.LoginMapper;
import egovframework.com.login.service.LoginService;
import egovframework.com.user.vo.UserVo;

@Service("loginService")
public class LoginServiceImpl implements LoginService{
	@Resource(name="loginMapper")
	private LoginMapper loginMapper;
	
	@Override
	public UserVo selectUser(UserVo vo) throws Exception {
		return loginMapper.selectUser(vo);
	}

	@Override
	public void setLastLogin(UserVo vo) throws Exception {
		loginMapper.setLastLogin(vo);
	}

	@Override
	public UserVo selectKakaoUser(String userKakao_key) throws Exception {
		return loginMapper.selectKakaoUser(userKakao_key);
	}

	@Override
	public UserVo selectKakaoUserForLogin(UserVo vo) throws Exception {
		return loginMapper.selectKakaoUserForLogin(vo);
	}
}
