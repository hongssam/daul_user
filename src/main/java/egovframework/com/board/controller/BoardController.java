package egovframework.com.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.board.service.BoardService;
import egovframework.com.board.vo.BoardVo;
import egovframework.com.cmmn.util.CmmnUtil;
import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.cmmn.util.ProfileCls;
import egovframework.com.user.vo.UserVo;
@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@Autowired(required=false)
	private ProfileCls profileCls;
	protected Log log = LogFactory.getLog(BoardController.class);

	@Resource(name = "boardService")
	private BoardService boardService;
	
	@Resource(name="fileUtil")
	private FileUtil fileUtil;

	@Resource(name = "cmmnUtil")
	private CmmnUtil cmmnUtil;
	
	
	@RequestMapping(value = "/boardListPage.do")
	public String boardListPage() {
		return "board/boardList";
	}
		
	@RequestMapping(value="/getBoardList.do")
	public ResponseEntity<?> boardList(ModelMap model, BoardVo vo) throws Exception{
		List<BoardVo> noticeList =null;
		log.debug(profileCls.getRootPath()); // C:/home/profile 라는 문자열이 나옵니다.
		
		try {
			 noticeList = boardService.selectBoardList(vo);
			 
			 
		}catch(Exception e){
			log.debug("BoardController > /boardList.do > Exception");
		}
		return new ResponseEntity<>(noticeList, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/boardDetail.do", method=RequestMethod.GET)
	public String boardDetail(ModelMap model, @RequestParam("notice_idx") String notice_idx) throws Exception{
		BoardVo vo = new BoardVo();
		vo.setNotice_idx(notice_idx);
		System.out.println(vo.getNotice_idx());
		BoardVo result = boardService.selectBoard(vo);
		System.out.println(result);
		
		List<Map<String, String>> boardFile  = boardService.selectBoardFile(vo);
		System.out.println(boardFile);
		model.addAttribute("boardVo", result);
		model.addAttribute("boardFile", boardFile);
		return "board/boardDetail";
	}
	
	
	
	@RequestMapping(value = "/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(ModelMap model) throws Exception {
		
	
		model.addAttribute("boardVo", new BoardVo());
		return "board/boardWrite";
	}
	
	
	@RequestMapping(value ="/boardInsert.do", method=RequestMethod.POST)
	public String boardInsert(HttpSession session,BoardVo vo, BindingResult bindingResult, HttpServletRequest request) 
    		throws Exception {
		
		try {
			BoardValidator boardValidator = new BoardValidator();
			boardValidator.validate(vo, bindingResult);
			
			if(bindingResult.hasErrors()) {
				return "board/boardWrite";
			}
			System.out.println("boardInsert.do======");
			UserVo userVo = (UserVo) session.getAttribute("login");
			   
			vo.setNotice_idx(boardService.selectNoticeIdx());
			vo.setCreate_user(userVo.getUser_id());
			
			FileVo fileVo = new FileVo();
				
			fileVo.setCreate_user(vo.getCreate_user());
			fileVo.setIdx(vo.getNotice_idx());
				
			List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);
			System.out.println("fileList == " + fileList);
			
			for(int i = 0; i<fileList.size(); i++) {
				fileVo = fileList.get(i);
				boardService.insertFile(fileVo);
			}		
			//vo.setReg_user(userVo.getUser_seq());
		    boardService.insertBoard(vo);
		}catch(Exception e){
			log.debug("BoardController > /boardList.do > Exception");
			e.printStackTrace();
			return "common/error.jsp";
		}
		
		return "redirect:/board/boardListPage.do";
    }
	
	@RequestMapping(value = "noticeModify",method = RequestMethod.POST)
	public ResponseEntity<?> noticeModify(HttpSession session, BoardVo vo, BindingResult bindingResult, HttpServletRequest request) throws Exception {
		try {
			
			BoardValidator boardValidator = new BoardValidator();
			boardValidator.validate(vo, bindingResult);
			
			
			UserVo userVo = (UserVo) session.getAttribute("login");
			vo.setUpdate_user(userVo.getUser_id());
			
			if(bindingResult.hasErrors()) {
				return new ResponseEntity<>(cmmnUtil.getValid(bindingResult), HttpStatus.OK);
			}
			log.debug("[공지사항] 공지사항 수정");
			int result = boardService.updateNotice(vo);
			
			if (result > 0) {
				FileVo fileVo = new FileVo();
				
				fileVo.setCreate_user(userVo.getUser_id());
				fileVo.setIdx(vo.getNotice_idx());
				
				List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);
				
				log.debug("[공지사항] 공지사항 파일 등록" + fileList.size());
				
				for (int i = 0; i < fileList.size(); i++) {
					boardService.insertFile(fileList.get(i));
				}
			}
		}catch(Exception e){
			log.debug("[공지사항] 공지사항 수정 실패");
		}
		
		log.debug("[공지사항] 공지사항 수정 성공");
		return new ResponseEntity<>(vo.getNotice_idx(), HttpStatus.OK);
	}
	
	@RequestMapping(value="/noticeDelete.do", method=RequestMethod.POST)
	public String noticeDelete(BoardVo vo) throws Exception{
		System.out.println(vo);
		
		boardService.deleteNotice(vo);
		
		return "redirect:/board/boardListPage.do";
	}
	
	@RequestMapping(value="/noticeAttachFileDelete.do", method=RequestMethod.POST)
	public ResponseEntity<?> noticeAttachFileDelete(HttpServletRequest request) throws Exception {
		String s_file_name = request.getParameter("file_name");
		
		FileVo fileVo = new FileVo();
		
		try {
			fileVo.setSave_file_name(s_file_name);
			
			boardService.deleteFile(fileVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value="/downloadFile.do",method = RequestMethod.GET)
	public void downloadFile(HttpServletResponse response, @RequestParam("save_file_name") String save_file_name) throws Exception{
		try {
			FileVo fileVo = new FileVo();
			fileVo.setIdx(save_file_name);
			
			fileVo = boardService.selectDownloadFile(fileVo);

			log.debug("[공지사항] 공지사항 첨부파일 다운로드");
			fileUtil.downloadFile(response, fileVo);
		} catch (Exception e) {
			log.debug("[공지사항] 공지사항 첨부파일 다운로드 실패");
			e.printStackTrace();
		}
	 }
	
}
