package egovframework.com.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.user.mapper.UserMapper;
import egovframework.com.user.service.UserService;
import egovframework.com.user.vo.UserVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("userService")
public class UserServiceImpl  extends EgovAbstractServiceImpl implements UserService{

	@Resource(name = "userMapper")
	private UserMapper userMapper;
	
	@Override
	public void updateUser(UserVo vo) throws Exception {
		userMapper.updateUser(vo);
		
	}

	@Override
	public void createUser(UserVo vo) throws Exception {
		userMapper.createUser(vo);
	}

	@Override
	public UserVo selectUser(UserVo vo) throws Exception {
		return userMapper.selectUser(vo);
	}

	@Override
	public void deleteUser(UserVo vo) throws Exception {
		userMapper.deleteUser(vo);
	}

	@Override
	public void updateUserPw(UserVo vo) throws Exception {
		userMapper.updateUserPw(vo);
	}

	@Override
	public List<UserVo> selectUserList(UserVo vo) throws Exception {
		return userMapper.selectUserList(vo);
	}

	@Override
	public int selectUserIdCheck(String user_id) throws Exception {
		return userMapper.selectUserIdCheck(user_id);
	}

	@Override
	public UserVo selectUserCnt(UserVo vo) throws Exception {
		return userMapper.selectUserCnt(vo);
	}

}
