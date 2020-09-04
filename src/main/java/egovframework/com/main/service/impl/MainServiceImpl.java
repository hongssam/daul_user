package egovframework.com.main.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.main.mapper.MainMapper;
import egovframework.com.main.service.MainService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("mainService")
public class MainServiceImpl extends EgovAbstractServiceImpl implements MainService {

	@Resource(name = "mainMapper")
	private MainMapper mainMapper;
	
	@Override
	public List<Map<String, String>> selectDummyList() throws Exception{
		List<Map<String, String>> list = new ArrayList();
		
		list = mainMapper.selectDummyList();
		
		return list;
	}

}
