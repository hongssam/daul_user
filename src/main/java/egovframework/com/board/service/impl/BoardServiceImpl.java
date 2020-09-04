package egovframework.com.board.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.board.mapper.BoardMapper;
import egovframework.com.board.service.BoardService;
import egovframework.com.board.vo.BoardVo;
import egovframework.com.cmmn.util.FileVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {
	
	@Resource(name="boardMapper")
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardVo> selectBoardList(BoardVo vo) throws Exception{
		return boardMapper.selectBoardList(vo);
		
	}
	
	@Override
	public List<Map<String,String>> selectBoardFile(BoardVo vo) throws Exception{
		List<Map<String,String>> list = new ArrayList<Map<String, String>>();
		
		boardMapper.increaseViewCount(vo);
		return boardMapper.selectBoardFile(vo);
		
	}
	

	@Override
	public BoardVo selectBoard(BoardVo vo) throws Exception{
		return boardMapper.selectBoard(vo);
	}
	
	@Override
	public void insertBoard(BoardVo vo) throws Exception{

	boardMapper.insertBoard(vo);

		
	}
	
	@Override
	public FileVo selectDownloadFile(FileVo vo) throws Exception{
		return boardMapper.selectDownloadFile(vo);
	}

	@Override
	public void insertFile(FileVo fileVo) throws Exception {
		boardMapper.insertFile(fileVo);
		
	}

	@Override
	public String selectNoticeIdx() throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectNoticeIdx();
	}

	@Override
	public int updateNotice(BoardVo vo) throws Exception {
		return boardMapper.updateNotice(vo);
	}

	@Override
	public void deleteFile(FileVo fileVo) throws Exception {
		boardMapper.deleteFile(fileVo);
	}

	@Override
	public void deleteNotice(BoardVo vo) throws Exception {
		boardMapper.deleteNotice(vo);
		
	}
	
	
}
























