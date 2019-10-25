package com.dycgv.service;

import java.util.ArrayList;

import com.dycgv.dao.BoardDAO;
import com.dycgv.vo.BoardVO;

public class BoardCheckService {
	
	
	/**
	 * �Խù� ����
	 */
	public boolean getResultDelete(String bno) {
		boolean result = false;
		BoardDAO dao = new BoardDAO();
		result = dao.getBoardDelete(bno);
		
		return result;
	}
	
	
	
	/**
	 * �Խù� ����
	 */
	public boolean getResultUpdate(BoardVO vo) {
		boolean result = false;
		BoardDAO dao = new BoardDAO();
		result = dao.getBoardUpdate(vo);
		
		return result;
	}
	
	/**
	 * �Խù� ���� ���Ͼ���
	 */
	public boolean getResultUpdateNoFile(BoardVO vo) {
		
		boolean result = false;
		BoardDAO dao = new BoardDAO();
		result = dao.getResultUpdateNoFile(vo);
		
		return result;
	}
	
	/**
	 * ��ȸ�� �ø���
	 */
	public void getResultHit(BoardVO vo) {
		BoardDAO dao = new BoardDAO();
		dao.getBoardHit(vo);
	}
	
	
	
	/**
	 * �Խ��� �󼼺���
	 * @param vo
	 * @return
	 */
	public BoardVO getResultBoardContent(String bno) {
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = dao.getBoardContent(bno);
		
		return vo;
	}
	/**
	 * �Խñ� ���
	 */
	public boolean getResultWrite(BoardVO vo) {
		boolean result = false;		
		BoardDAO dao = new BoardDAO();
		result = dao.getBoardWrite(vo);
		
		
		return result;
	}
	
	
	/**
	 * �Խ��� ����Ʈ ���
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
