package egovframework.com.user.mapper;

import java.util.Map;

import egovframework.com.user.vo.UserVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userMapper")
public interface UserMapper {

	int selectKakaoAccount(Map<String, Object> params) throws Exception;

	void insertKakaoUser(UserVo vo) throws Exception;

	int selectUserIdCheck(String user_id) throws Exception;

	void insertPublicUser(UserVo vo) throws Exception;

}
