package egovframework.com.user.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.com.user.vo.UserVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userMapper")
public interface UserMapper {

	int selectKakaoAccount(Map<String, Object> params) throws Exception;

	void insertKakaoUser(UserVo vo) throws Exception;

	int selectUserIdCheck(String user_id) throws Exception;

	void insertPublicUser(UserVo vo) throws Exception;

	UserVo selectUser(UserVo vo) throws Exception;

	void updateUser(UserVo vo) throws Exception;

	List<SuggestionVo> selectSuggestionListByMypage(SuggestionVo vo) throws Exception;

	int selectSuggestionListCntByMypage(SuggestionVo vo) throws Exception;

}
