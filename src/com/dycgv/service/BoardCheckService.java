package com.dycgv.service;

import java.util.ArrayList;

import com.dycgv.dao.BoardDAO;
import com.dycgv.vo.BoardVO;

public class BoardCheckService {
	
	
	/**
	 * 게시물 삭제
	 */
	public boolean getResultDelete(String bno) {
		boolean result = false;
		BoardDAO dao = new BoardDAO();
		result = dao.getBoardDelete(bno);
		
		return result;
	}
	
	
	
	/**
	 * 게시물 수정
	 */
	public boolean getResultUpdate(BoardVO vo) {
		boolean result = false;
		BoardDAO dao = new BoardDAO();
		result = dao.getBoardUpdate(vo);
		
		return result;
	}
	
	/**
	 * 게시물 수정 파일없음
	 */
	public boolean getResultUpdateNoFile(BoardVO vo) {
		
		boolean result = false;
		BoardDAO dao = new BoardDAO();
		result = dao.getResultUpdateNoFile(vo);
		
		return result;
	}
	
	/**
	 * 조회수 올리기
	 */
	public void getResultHit(BoardVO vo) {
		BoardDAO dao = new BoardDAO();
		dao.getBoardHit(vo);
	}
	
	
	
	/**
	 * 게시판 상세보기
	 * @param vo
	 * @return
	 */
	public BoardVO getResultBoardContent(String bno) {
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = dao.getBoardContent(bno);
		
		return vo;
	}
	/**
	 * 게시글 등록
	 */
	public boolean getResultWrite(BoardVO vo) {
		boolean result = false;		
		BoardDAO dao = new BoardDAO();
		result = dao.getBoardWrite(vo);
		
		
		return result;
	}
	
	
	/**
	 * 게시판 리스트 출력
	 * @param vo
	 * @return
	 */
	public ArrayList<BoardVO> getResultBoard() {
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> list = dao.getBoardList();
		
		dao.close();
		return list;
	}
}
