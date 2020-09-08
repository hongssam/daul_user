package egovframework.com.contest.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import egovframework.com.contest.service.ContestService;
import egovframework.com.contest.vo.ContestVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("contestService")
public class ContestServiceImpl extends EgovAbstractServiceImpl implements ContestService{

	@Override
	public List<ContestVo> getContestList(ContestVo vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
