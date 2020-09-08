package egovframework.com.contest.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmmn.util.CmmnUtil;
import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.contest.service.ContestService;
import egovframework.com.contest.vo.ContestVo;

@Controller
@RequestMapping(value="/contest")
public class ContestController {
	protected Log log = LogFactory.getLog(ContestController.class);

	@Resource(name = "contestService")
	private ContestService contestService;

	@Resource(name = "fileUtil")
	private FileUtil fileUtil;

	@Resource(name = "cmmnUtil")
	private CmmnUtil cmmnUtil;
	
	@RequestMapping(value="/contestListPage.do")
	public String contestListPage(ModelMap model) throws Exception {
		List<ContestVo> contestList = null;
		ContestVo vo = new ContestVo();
		
		try {
			log.debug("[공모제안] 공모제안 목록 조회");
			contestList = contestService.getContestList(vo);
			System.out.println(contestList);
			
			model.addAttribute("contestList",contestList);
			
		}catch(Exception e) {
			log.debug("[설문조사] 설문조사 목록 조회 실패");
		}
		return "contest/contestList";
	}
	
	@RequestMapping(value="/contestDetailPage.do")
	public String contestDetailPage(ModelMap model, @RequestParam("admin_contest_idx") String admin_contest_idx) throws Exception {
		ContestVo contestVo = new ContestVo();
		List<Map<String, String>> fileList = null;
		try {
			contestVo.setAdmin_contest_idx(admin_contest_idx);
			contestVo = contestService.getAdminContest(contestVo);
			fileList = contestService.selectContestFile(contestVo);
		}catch(Exception e) {
			
		}
		System.out.println("fileList = " + fileList.size());
		model.addAttribute("contestVo", contestVo);
		model.addAttribute("fileList", fileList);
		
		return "contest/contestDetail";
	}
}




















