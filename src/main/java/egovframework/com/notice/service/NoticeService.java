package egovframework.com.notice.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.notice.vo.NoticeVo;

public interface NoticeService {
	List<NoticeVo> getNoticeList(NoticeVo vo) throws Exception;
	int getNoticeListCnt(NoticeVo vo) throws Exception;
	void increaseViewCount(String notice_idx) throws Exception;
	NoticeVo getNoticeDetail(NoticeVo vo) throws Exception;
	List<Map<String, String>> getNoticeFile(NoticeVo vo) throws Exception;

	NoticeVo getBeforeNotice(NoticeVo vo) throws Exception;
	NoticeVo getAfterNotice(NoticeVo vo) throws Exception;
	FileVo selectDownloadFile(FileVo vo) throws Exception;
}
