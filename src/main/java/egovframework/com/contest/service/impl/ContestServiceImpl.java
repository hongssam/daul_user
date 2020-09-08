package egovframework.com.contest.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.contest.mapper.ContestMapper;
import egovframework.com.contest.service.ContestService;
import egovframework.com.contest.vo.ContestVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("contestService")
public class ContestServiceImpl extends EgovAbstractServiceImpl implements ContestService{

	@Resource(name="contestMapper")
	private ContestMapper contestMapper;
	
	@Override
	public List<ContestVo> getContestList(ContestVo vo) throws Exception {
		return contestMapper.getContestList(vo);
	}

	@Override
	public ContestVo getAdminContest(ContestVo vo) throws Exception {
		return contestMapper.getAdminContest(vo);
	}

	@Override
	public List<Map<String, String>> selectContestFile(ContestVo vo) throws Exception {
		return contestMapper.selectContestFile(vo);
	}

}
