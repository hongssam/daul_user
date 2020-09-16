package egovframework.com.notice.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.notice.mapper.NoticeMapper;
import egovframework.com.notice.service.NoticeService;
import egovframework.com.notice.vo.NoticeVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("noticeService")
public class NoticeServiceImpl extends EgovAbstractServiceImpl implements NoticeService  {

	@Resource(name="noticeMapper")
	private NoticeMapper noticeMapper;
	
	@Override
	public List<NoticeVo> getNoticeList(NoticeVo vo) throws Exception {
		return noticeMapper.getNoticeList(vo);
	}

	@Override
	public int getNoticeListCnt(NoticeVo vo) throws Exception {
		return noticeMapper.getNoticeListCnt(vo);
	}

	@Override
	public void increaseViewCount(String notice_idx) throws Exception {
		noticeMapper.increaseViewCount(notice_idx);
	}

	@Override
	public NoticeVo getNoticeDetail(NoticeVo vo) throws Exception {
		return noticeMapper.getNoticeDetail(vo);
	}

	@Override
	public List<Map<String, String>> getNoticeFile(NoticeVo vo) throws Exception {
		return noticeMapper.getNoticeFile(vo);
	}

	@Override
	public NoticeVo getBeforeNotice(NoticeVo vo) throws Exception {
		return noticeMapper.getBeforeNotice(vo);
	}
	@Override
	public NoticeVo getAfterNotice(NoticeVo vo) throws Exception {
		return noticeMapper.getAfterNotice(vo);
	}

	@Override
	public FileVo selectDownloadFile(FileVo vo) throws Exception {
		return noticeMapper.selectDownloadFile(vo);
	}

}
