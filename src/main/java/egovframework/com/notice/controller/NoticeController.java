package egovframework.com.notice.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.notice.service.NoticeService;
import egovframework.com.notice.vo.NoticeVo;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {
	protected Log log = LogFactory.getLog(NoticeController.class);
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	@Resource(name="fileUtil")
	private FileUtil fileUtil;
	
	@RequestMapping(value="/noticeListPage.do")
	public String noticeListPage(NoticeVo noticeVo, ModelMap model, @RequestParam(defaultValue = "1") int curPage) throws Exception {
		List<NoticeVo> noticeList = null;
		try {
			int listCnt = noticeService.getNoticeListCnt(noticeVo);
			noticeVo.setPageSize(10);
			noticeVo.setPagination(listCnt, curPage);
			noticeList = noticeService.getNoticeList(noticeVo);
			
			for(int i = 0; i < noticeList.size(); i++) {
				String date = noticeList.get(i).getCreate_date().substring(0,10);
				noticeList.get(i).setCreate_date(date);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("pagination",noticeVo);
		
		return "notice/noticeList";
	}
	
	@RequestMapping(value="/noticeDetail.do", method=RequestMethod.GET)
	public String noticeDetail(ModelMap model, @RequestParam("notice_idx") String notice_idx) throws Exception {
		NoticeVo vo = new NoticeVo();
		List<Map<String, String>> fileList = null;
		
		try {
			vo.setNotice_idx(notice_idx);
			noticeService.increaseViewCount(vo.getNotice_idx());
			
			vo = noticeService.getNoticeDetail(vo);

			vo.setCreate_date(vo.getCreate_date().substring(0,10));
			
			fileList = noticeService.getNoticeFile(vo);
			
		}catch(Exception e){
			
		}
		model.addAttribute("noticeVo", vo);
		model.addAttribute("fileList", fileList);
		
		return "notice/noticeDetail";
	}
	

	@RequestMapping(value="/getBeforeNotice.do")
	public ResponseEntity<?> getBeforeNotice( @RequestParam("notice_idx") String notice_idx) throws Exception{
		NoticeVo vo = new NoticeVo();
		vo.setNotice_idx(notice_idx);
		vo = noticeService.getBeforeNotice(vo);
		
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}
	
	@RequestMapping(value="/getAfterNotice.do")
	public ResponseEntity<?> getAfterNotice( @RequestParam("notice_idx") String notice_idx) throws Exception{
		NoticeVo vo = new NoticeVo();
		vo.setNotice_idx(notice_idx);
		vo = noticeService.getAfterNotice(vo);
		
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/downloadNoticeFile.do", method = RequestMethod.GET)
	public void downloadNoticeFile(HttpServletResponse response, @RequestParam("save_file_name") String save_file_name)
			throws Exception {
		try {
			FileVo fileVo = new FileVo();
			fileVo.setIdx(save_file_name);
			fileVo = noticeService.selectDownloadFile(fileVo);

			log.debug("[공지사항] 공지사항 첨부파일 다운로드");
			fileUtil.downloadFile(response, fileVo);
		} catch (Exception e) {
			log.debug("[공지사항] 공지사항 첨부파일 다운로드 실패");
		}
	}
	
}



