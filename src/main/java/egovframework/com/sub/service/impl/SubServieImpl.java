package egovframework.com.sub.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.sub.mapper.SubMapper;
import egovframework.com.sub.service.SubService;
import egovframework.com.sub.vo.SubVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("subService")
public class SubServieImpl extends EgovAbstractServiceImpl implements SubService{

	@Resource(name = "subMapper")
	private SubMapper subMapper;
	
	@Override
	public SubVo login(SubVo vo) throws Exception {		
		return subMapper.selectLoginCheck(vo);
	}

	@Override
	public void singUp(SubVo vo) throws Exception {
		subMapper.signUp(vo);
		
	}
	
	@Override
	public SubVo selectUser(SubVo vo) throws Exception{
		return subMapper.selectUser(vo);
	}


}
