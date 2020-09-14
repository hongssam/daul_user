package egovframework.com.contest.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.contest.mapper.ContestMapper;
import egovframework.com.contest.service.ContestService;
import egovframework.com.contest.vo.ContestVo;
import egovframework.com.notice.vo.NoticeVo;
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

	@Override
	public FileVo selectDownloadFile(FileVo vo) throws Exception {
		return contestMapper.selectDownloadFile(vo);
	}

	@Override
	public String selectUserContestIdx() throws Exception {
		return contestMapper.selectUserContestIdx();
	}

	@Override
	public void insertFile(FileVo fileVo) throws Exception {
		contestMapper.insertFile(fileVo);
	}

	@Override
	public int registUserContest(ContestVo vo) throws Exception {
		return contestMapper.registUserContest(vo);
	}

	@Override
	public int checkSubmit(ContestVo vo) throws Exception {
		return contestMapper.checkSubmit(vo);
	}

	@Override
	public ContestVo getUserContest(ContestVo vo) throws Exception {
		return contestMapper.getUserContest(vo);
	}
	
	@Override
	public List<Map<String, String>> selectUserFileList(ContestVo vo) throws Exception {
		return contestMapper.selectUserFileList(vo);
	}

	@Override
	public int updateUserContest(ContestVo vo) throws Exception {
		return contestMapper.updateUserContest(vo);
	}

	@Override
	public void userContestFileDelete(FileVo fileVo) throws Exception {
		contestMapper.userContestFileDelete(fileVo);
	}

	@Override
	public List<ContestVo> getUserContestList(ContestVo vo) throws Exception {
		return contestMapper.getUserContestList(vo);
	}

	@Override
	public int getContestListCnt(ContestVo vo) throws Exception {
		return contestMapper.getContestListCnt(vo);
	}
	
	@Override
	public int getUserContestListCnt(ContestVo vo) throws Exception{
		return contestMapper.getUserContestListCnt(vo);
	}

	@Override
	public List<NoticeVo> getContestNoticeList(ContestVo vo) throws Exception {
		return contestMapper.getContestNoticeList(vo);
	}

	@Override
	public NoticeVo getContestNoticeDetail(NoticeVo vo) throws Exception {
		return contestMapper.getContestNoticeDetail(vo);
	}

	@Override
	public void increaseViewCount(String notice_idx) throws Exception {
		contestMapper.increaseViewCount(notice_idx);
	}

}















