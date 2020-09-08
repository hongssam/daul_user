package egovframework.com.contest.service;

import java.util.List;
import java.util.Map;

import egovframework.com.contest.vo.ContestVo;

public interface ContestService {
	List<ContestVo> getContestList(ContestVo vo) throws Exception;
	ContestVo getAdminContest(ContestVo vo) throws Exception;
	List<Map<String, String>> selectContestFile(ContestVo vo) throws Exception;
}
