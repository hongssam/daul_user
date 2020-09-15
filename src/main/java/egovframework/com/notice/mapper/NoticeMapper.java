package egovframework.com.notice.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.notice.vo.NoticeVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("noticeMapper")
public interface NoticeMapper {
	List<NoticeVo> getNoticeList(NoticeVo vo) throws Exception;
	int getNoticeListCnt(NoticeVo vo) throws Exception;
	void increaseViewCount(String notice_idx) throws Exception;
	NoticeVo getNoticeDetail(NoticeVo vo) throws Exception;
	List<Map<String, String>> getNoticeFile(NoticeVo vo) throws Exception;
	NoticeVo getBeforeNotice(NoticeVo vo) throws Exception;
	NoticeVo getAfterNotice(NoticeVo vo) throws Exception;
	
}
