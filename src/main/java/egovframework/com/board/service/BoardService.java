package egovframework.com.board.service;

import java.util.List;
import java.util.Map;

import egovframework.com.board.vo.BoardVo;
import egovframework.com.cmmn.util.FileVo;

public interface BoardService {
	
	List<BoardVo> selectBoardList(BoardVo vo) throws Exception;
	BoardVo selectBoard(BoardVo vo) throws Exception;
	void insertBoard(BoardVo vo)throws Exception;
	List<Map<String,String>> selectBoardFile(BoardVo vo) throws Exception;
	FileVo selectDownloadFile(FileVo vo) throws Exception;
	void insertFile(FileVo fileVo) throws Exception ;	
	String selectNoticeIdx() throws Exception;
	int updateNotice(BoardVo vo) throws Exception;
	void deleteFile(FileVo fileVo) throws Exception;
	void deleteNotice(BoardVo vo) throws Exception;
}
