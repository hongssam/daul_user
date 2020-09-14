package egovframework.com.contest.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.contest.vo.ContestVo;
import egovframework.com.notice.vo.NoticeVo;

public interface ContestService {
	List<ContestVo> getContestList(ContestVo vo) throws Exception;
	ContestVo getAdminContest(ContestVo vo) throws Exception;
	List<Map<String, String>> selectContestFile(ContestVo vo) throws Exception;
	FileVo selectDownloadFile(FileVo vo) throws Exception;
	String selectUserContestIdx() throws Exception;
	void insertFile(FileVo fileVo) throws Exception;
	int registUserContest(ContestVo vo) throws Exception;
	int checkSubmit(ContestVo vo) throws Exception;
	ContestVo getUserContest(ContestVo vo) throws Exception;
	List<Map<String, String>> selectUserFileList(ContestVo vo) throws Exception;
	int updateUserContest(ContestVo vo) throws Exception;
	void userContestFileDelete(FileVo fileVo) throws Exception;
	List<ContestVo> getUserContestList(ContestVo vo) throws Exception;
	int getContestListCnt(ContestVo vo) throws Exception;
	int getUserContestListCnt(ContestVo vo) throws Exception;
	List<NoticeVo> getContestNoticeList(ContestVo vo) throws Exception;
	NoticeVo getContestNoticeDetail(NoticeVo vo) throws Exception;
	void increaseViewCount(String notice_idx) throws Exception;
}
