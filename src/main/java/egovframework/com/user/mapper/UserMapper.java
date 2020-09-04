package egovframework.com.user.mapper;

import java.util.List;

import egovframework.com.user.vo.UserVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userMapper")
public interface UserMapper {
	void updateUser(UserVo vo) throws Exception;

	void createUser(UserVo vo) throws Exception;

	UserVo selectUser(UserVo vo) throws Exception;

	void deleteUser(UserVo vo) throws Exception;

	void updateUserPw(UserVo vo) throws Exception;

	List<UserVo> selectUserList(UserVo vo) throws Exception;

	int selectUserIdCheck(String user_id) throws Exception;
	
	UserVo selectUserCnt(UserVo vo) throws Exception;
}
