package egovframework.com.contest.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.contest.vo.ContestVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("contestMapper")
public interface ContestMapper {
	List<ContestVo> getContestList(ContestVo vo) throws Exception;
	ContestVo getAdminContest(ContestVo vo) throws Exception;
	List<Map<String,String>> selectContestFile(ContestVo vo) throws Exception;
}
