package egovframework.com.sub.service;

import egovframework.com.sub.vo.SubVo;

public interface SubService {
	SubVo login(SubVo vo) throws Exception;
	void singUp(SubVo vo) throws Exception;
	SubVo selectUser(SubVo vo) throws Exception;
}
