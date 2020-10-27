package egovframework.com.contest.controller;

import java.util.HashMap;
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
import egovframework.com.mileage.controller.MileageController;
import egovframework.com.mileage.vo.MileageVo;
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
	
	@Resource(name="mileageController")
	private MileageController mileageController;

	@RequestMapping(value = "/contestListPage.do")
	public String contestListPage(ContestVo contestvo, ModelMap model, @RequestParam(defaultValue = "1") int curPage) throws Exception {
		List<ContestVo> contestList = null;

		try {
			log.debug("[공모제안] 공모제안 목록 조회");
			
			int listCnt = contestService.getContestListCnt(contestvo);
			
			contestvo.setPagination(listCnt, curPage);
			
			contestList = contestService.getContestList(contestvo);
			
			for(int i = 0; i < contestList.size(); i++) {
				String createDate = contestList.get(i).getCreate_date().substring(0,10);
				String contestEndDate = contestList.get(i).getContest_e_date().substring(0,10);
				String contestStartDate = contestList.get(i).getContest_s_date().substring(0,10);
				String submitEndDate = contestList.get(i).getSubmit_e_date().substring(0,10);
				String submitStartDate = contestList.get(i).getSubmit_s_date().substring(0,10);
				
				contestList.get(i).setCreate_date(createDate);
				contestList.get(i).setContest_e_date(contestEndDate);
				contestList.get(i).setContest_s_date(contestStartDate);
				contestList.get(i).setSubmit_e_date(submitEndDate);
				contestList.get(i).setSubmit_s_date(submitStartDate);
			}
			
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
			
			
			contestVo.setAdmin_contest_idx(admin_contest_idx);
			contestVo = contestService.getAdminContest(contestVo);

			int UserlistCnt = contestService.getUserContestListCnt(contestVo);
			contestVo.setPageSize(10);
			contestVo.setPagination(UserlistCnt, curPage);
			contestVo.setCreate_date(contestVo.getCreate_date().substring(0,10));
			contestVo.setContest_e_date(contestVo.getContest_e_date().substring(0,10));
			contestVo.setContest_s_date(contestVo.getContest_s_date().substring(0,10));
			contestVo.setSubmit_e_date(contestVo.getSubmit_e_date().substring(0,10));
			contestVo.setSubmit_s_date(contestVo.getSubmit_s_date().substring(0,10));
			
			try {
			
				contestVo.setLogin_user(userVo.getUser_id());
				// 해당유저가 공모에 참여했는지 유무chk
				chk = contestService.checkSubmit(contestVo);
				
				if (chk > 0) {
					//작성한 글 가져오기
					userContestVo = contestService.getUserContest(contestVo);
					userFileList = contestService.selectUserFileList(userContestVo);
				}
				
				model.addAttribute("userFileList", userFileList);
				model.addAttribute("checkSubmit", chk);
				model.addAttribute("userContestVo", userContestVo);
			}catch(NullPointerException e){
				log.debug("nullpointerException - Contestcontroller - 124");
			}
			
		
		
			
			
			fileList = contestService.selectContestFile(contestVo);
			userContestList = contestService.getUserContestList(contestVo);
			
			for(int i = 0; i < userContestList.size(); i++) {
				String date = userContestList.get(i).getCreate_date().substring(0,10);
				userContestList.get(i).setCreate_date(date);
			}
			
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("contestVo", contestVo);
		model.addAttribute("fileList", fileList);

		model.addAttribute("userContestList", userContestList);
		model.addAttribute("pagination", contestVo);

		return "contest/contestDetail";
	}

	@RequestMapping(value="/contestNoticeListPage")
	public String contestNoticeListPage(ContestVo contestVo, ModelMap model, @RequestParam(defaultValue = "1") int curPage) throws Exception{
		List<NoticeVo> contestNoticeList = null;
		try {
			int NoticeListCnt = contestService.getContestNoticeListCnt(contestVo);
			
			contestVo.setPageSize(10);
			contestVo.setPagination(NoticeListCnt, curPage);
			
			contestNoticeList = contestService.getContestNoticeList(contestVo);
			
			model.addAttribute("contestNoticeList", contestNoticeList);
			model.addAttribute("pagination",contestVo);
		}catch(Exception e) {
			
		}
		return "contest/contestNotice";
	}
	
	@RequestMapping(value="contestNoticeDetail.do", method=RequestMethod.GET)
	public String contestNoticeDetail(ModelMap model, @RequestParam("notice_idx") String notice_idx) throws Exception{
		NoticeVo vo = new NoticeVo();
		List<Map<String, String>> fileList = null;
		
		try {
			vo.setNotice_idx(notice_idx);
			
			contestService.increaseViewCount(vo.getNotice_idx());
			vo = contestService.getContestNoticeDetail(vo);
			
			fileList = contestService.getContestNoticeFile(vo);
			
		}catch(Exception e) {
			
		}
		
		model.addAttribute("contestNoticeVo", vo);
		model.addAttribute("fileList", fileList);
		
		return "contest/contestNoticeDetail";
	}


	@RequestMapping(value = "/contestUserRegist.do", method = RequestMethod.POST)
	public String contestUserRegist(HttpSession session, ContestVo vo, HttpServletRequest request,
			BindingResult bindingResult) throws Exception {
		try {
			//String user_contest_idx = contestService.selectUserContestIdx();
			String user_contest_idx = CmmnUtil.generateKeyWithPrefix("UC");
			vo.setUser_contest_idx(user_contest_idx);
			UserVo userVo = (UserVo) session.getAttribute("login");
			vo.setCreate_user(userVo.getUser_id());
			MileageVo mileageVo = new MileageVo();

			int result = contestService.registUserContest(vo);

			FileVo fileVo = new FileVo();

			fileVo.setCreate_user(vo.getCreate_user());
			fileVo.setIdx(vo.getUser_contest_idx());

			List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);

			for (int i = 0; i < fileList.size(); i++) {
				contestService.insertFile(fileList.get(i));
			}
			
			mileageVo.setAction_id("CT04"); 
			mileageVo.setBoard_id(vo.getUser_contest_idx());
			mileageVo.setUser_id(userVo.getPhone());
			mileageController.AccumulateMileage(mileageVo);
			
			
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
	

	@RequestMapping(value="/getBeforeNotice.do")
	public ResponseEntity<?> getBeforeNotice( @RequestParam("notice_idx") String notice_idx) throws Exception{
		NoticeVo vo = new NoticeVo();
		vo.setNotice_idx(notice_idx);
		vo = contestService.getBeforeNotice(vo);
		
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}
	
	@RequestMapping(value="/getAfterNotice.do")
	public ResponseEntity<?> getAfterNotice( @RequestParam("notice_idx") String notice_idx) throws Exception{
		NoticeVo vo = new NoticeVo();
		vo.setNotice_idx(notice_idx);
		vo = contestService.getAfterNotice(vo);
		
		return new ResponseEntity<>(vo, HttpStatus.OK);
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
	
	@RequestMapping(value = "/downloadFile2.do", method = RequestMethod.GET)
	public void downloadFile2(HttpServletResponse response, @RequestParam("save_file_name") String save_file_name)
			throws Exception {
		try {
			FileVo fileVo = new FileVo();
			fileVo.setIdx(save_file_name);
			fileVo = contestService.selectDownloadFile2(fileVo);

			log.debug("[나눔공모] 나눔공모 첨부파일 다운로드");
			fileUtil.downloadFile(response, fileVo);
		} catch (Exception e) {
			log.debug("[나눔공모] 나눔공모 첨부파일 다운로드 실패");
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value = "/downloadContestNoticeFile.do", method = RequestMethod.GET)
	public void downloadContestNoticeFile(HttpServletResponse response, @RequestParam("save_file_name") String save_file_name)
			throws Exception {
		try {
			FileVo fileVo = new FileVo();
			fileVo.setIdx(save_file_name);
			fileVo = contestService.selectDownloadContestNoticeFile(fileVo);

			log.debug("[나눔공모] 나눔공모 첨부파일 다운로드");
			fileUtil.downloadFile(response, fileVo);
		} catch (Exception e) {
			log.debug("[나눔공모] 나눔공모 첨부파일 다운로드 실패");
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/getImg.do")
	public void getImage(@RequestParam("admin_contest_idx") String admin_contest_idx, HttpServletResponse response) throws Exception {
		Map<String, String> file = new HashMap<>();
		
		try {
			file = contestService.selectImageFile(admin_contest_idx);
	
			try {
				if (!file.isEmpty()) {
					fileUtil.getImgFile(response, file.get("save_file_name"));
				}
			}catch(NullPointerException e){
				fileUtil.getImgFile(response, "placeholder.png");
				log.debug("이미지없음.");
			}
		
		} catch (Exception e) {
			log.debug("ChatbotController - getImg.do - Exception");
			e.printStackTrace();
		}
	}
	
}
