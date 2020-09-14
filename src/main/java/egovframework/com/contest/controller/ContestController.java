package egovframework.com.contest.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmmn.util.CmmnUtil;
import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.contest.service.ContestService;
import egovframework.com.contest.vo.ContestVo;
import egovframework.com.notice.vo.NoticeVo;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value = "/contest")
public class ContestController {
	protected Log log = LogFactory.getLog(ContestController.class);

	@Resource(name = "contestService")
	private ContestService contestService;

	@Resource(name = "fileUtil")
	private FileUtil fileUtil;

	@Resource(name = "cmmnUtil")
	private CmmnUtil cmmnUtil;

	@RequestMapping(value = "/contestListPage.do")
	public String contestListPage(ContestVo contestvo, ModelMap model, @RequestParam(defaultValue = "1") int curPage) throws Exception {
		List<ContestVo> contestList = null;

		try {
			log.debug("[공모제안] 공모제안 목록 조회");
			
			int listCnt = contestService.getContestListCnt(contestvo);
			
			contestvo.setPagination(listCnt, curPage);
			
			contestList = contestService.getContestList(contestvo);
			model.addAttribute("contestList", contestList);
			model.addAttribute("pagination",contestvo);

		} catch (Exception e) {
			log.debug("[설문조사] 설문조사 목록 조회 실패");
		}
		return "contest/contestList";
	}

	@RequestMapping(value = "/contestDetailPage.do")
	public String contestDetailPage(ModelMap model, @RequestParam("admin_contest_idx") String admin_contest_idx,
			HttpSession session, @RequestParam(defaultValue = "1") int curPage) throws Exception {

		ContestVo contestVo = new ContestVo();
		List<Map<String, String>> fileList = null;
		List<Map<String, String>> userFileList = null;
		List<ContestVo> userContestList = null;
		ContestVo userContestVo = new ContestVo();
		
		int chk = 0;
		try {
			UserVo userVo = (UserVo) session.getAttribute("login");
			String user_id = userVo.getUser_id();
			
			contestVo.setAdmin_contest_idx(admin_contest_idx);
			contestVo = contestService.getAdminContest(contestVo);

			int UserlistCnt = contestService.getUserContestListCnt(contestVo);

			contestVo.setPagination(UserlistCnt, curPage);
			contestVo.setPageSize(10);
			
			fileList = contestService.selectContestFile(contestVo);
			userContestList = contestService.getUserContestList(contestVo);
			// 해당유저가 공모에 참여했는지 유무chk
			chk = contestService.checkSubmit(contestVo);

			if (chk > 0) {
				// 작성한 글 가져오기
				userContestVo = contestService.getUserContest(contestVo);
				userFileList = contestService.selectUserFileList(userContestVo);
			}
		} catch (Exception e) {

		}
		model.addAttribute("contestVo", contestVo);
		model.addAttribute("fileList", fileList);
		model.addAttribute("userFileList", userFileList);
		model.addAttribute("checkSubmit", chk);
		model.addAttribute("userContestVo", userContestVo);
		model.addAttribute("userContestList", userContestList);
		model.addAttribute("pagination", contestVo);

		return "contest/contestDetail";
	}

	@RequestMapping(value="/contestNoticeListPage")
	public String contestNoticeListPage(ContestVo vo, ModelMap model) throws Exception{
		List<NoticeVo> contestNoticeList = null;
		try {
			contestNoticeList = contestService.getContestNoticeList(vo);
			model.addAttribute("contestNoticeList", contestNoticeList);
		}catch(Exception e) {
			
		}
		return "contest/contestNotice";
	}
	
	@RequestMapping(value="contestNoticeDetail.do", method=RequestMethod.GET)
	public String contestNoticeDetail(ModelMap model, @RequestParam("notice_idx") String notice_idx) throws Exception{
		NoticeVo vo = new NoticeVo();
		
		try {
			vo.setNotice_idx(notice_idx);
			vo = contestService.getContestNoticeDetail(vo);
			
			contestService.increaseViewCount(vo.getNotice_idx());
			
		}catch(Exception e) {
			
		}
		
		model.addAttribute("contestNoticeVo", vo);
		
		return "contest/contestNoticeDetail";
	}
	
	@RequestMapping(value = "/downloadFile.do", method = RequestMethod.GET)
	public void downloadFile(HttpServletResponse response, @RequestParam("save_file_name") String save_file_name)
			throws Exception {
		try {
			FileVo fileVo = new FileVo();
			fileVo.setIdx(save_file_name);
			fileVo = contestService.selectDownloadFile(fileVo);

			log.debug("[나눔공모] 나눔공모 첨부파일 다운로드");
			fileUtil.downloadFile(response, fileVo);
		} catch (Exception e) {
			log.debug("[나눔공모] 나눔공모 첨부파일 다운로드 실패");
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/contestUserRegist.do", method = RequestMethod.POST)
	public String contestUserRegist(HttpSession session, ContestVo vo, HttpServletRequest request,
			BindingResult bindingResult) throws Exception {
		try {
			String user_contest_idx = contestService.selectUserContestIdx();
			vo.setUser_contest_idx(user_contest_idx);
			UserVo userVo = (UserVo) session.getAttribute("login");
			vo.setCreate_user(userVo.getUser_id());

			int result = contestService.registUserContest(vo);

			FileVo fileVo = new FileVo();

			fileVo.setCreate_user(vo.getCreate_user());
			fileVo.setIdx(vo.getUser_contest_idx());

			List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);

			for (int i = 0; i < fileList.size(); i++) {
				contestService.insertFile(fileList.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/contest/contestDetailPage.do?admin_contest_idx=" + vo.getAdmin_contest_idx();
	}

	@RequestMapping(value = "/contestUserUpdate.do", method = RequestMethod.POST)
	public String contestUserUpdate(HttpSession session, ContestVo vo, HttpServletRequest request,
			BindingResult bindingResult) throws Exception {
		try {
			System.out.println(vo);
			UserVo userVo = (UserVo) session.getAttribute("login");
			vo.setUpdate_user(userVo.getUser_id());

			int result = contestService.updateUserContest(vo);

			FileVo fileVo = new FileVo();

			fileVo.setCreate_user(vo.getCreate_user());
			fileVo.setIdx(vo.getUser_contest_idx());

			List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);

			for (int i = 0; i < fileList.size(); i++) {
				contestService.insertFile(fileList.get(i));
			}

		} catch (Exception e) {

		}
		return "redirect:/contest/contestDetailPage.do?admin_contest_idx=" + vo.getAdmin_contest_idx();
	}

	@RequestMapping(value = "/userContestFileDelete.do", method = RequestMethod.POST)
	public ResponseEntity<?> userContestFileDelete(HttpServletRequest request) throws Exception {
		String s_file_name = request.getParameter("file_name");
		FileVo fileVo = new FileVo();
		try {
			fileVo.setSave_file_name(s_file_name);

			contestService.userContestFileDelete(fileVo);
		} catch (Exception e) {

		}
		return new ResponseEntity<>("success", HttpStatus.OK);
	}

	@RequestMapping(value = "/getUserContestList.do")
	public ResponseEntity<?> getUserContestList(HttpServletRequest request,
			@RequestParam("admin_contest_idx") String admin_contest_idx) throws Exception {
		List<ContestVo> userContestList = null;

		try {
			ContestVo contestVo = new ContestVo();
			contestVo.setAdmin_contest_idx(admin_contest_idx);
			userContestList = contestService.getUserContestList(contestVo);
		} catch (Exception e) {

		}

		return new ResponseEntity<>(userContestList, HttpStatus.OK);
	}
}
