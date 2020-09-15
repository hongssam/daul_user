package egovframework.com.user.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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

}
