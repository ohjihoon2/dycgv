package com.dycgv.service;

import java.util.ArrayList;

import com.dycgv.dao.NoticeDAO;
import com.dycgv.vo.NoticeVO;

public class NoticeCheckService {
	
	/**
	 * 전체 row count 출력
	 * @return
	 */
	public int execTotalCount(){
		int result =0;
		NoticeDAO dao = new NoticeDAO();
		result = dao.execTotalCount();
		return result;
	}
	
	/**
	 * 공지사항 삭제
	 */
	public boolean getResultDelete(String nid) {
		boolean result = false;
		NoticeDAO dao = new NoticeDAO();
		result = dao.getNoticeDelete(nid);
		
		return result;
	}
	
	/**
	 * 공지사항 수정
	 * @param nid
	 */
	public boolean getResultUpdate(NoticeVO vo) {
		boolean result = false;
		NoticeDAO dao = new NoticeDAO();
		result = dao.getNoticeUpdate(vo);
		return result;
	}
	
	/**
	 * 조회수 증가
	 * @param nid
	 */
	public void getResultNitUpdate(String nid){
		NoticeDAO dao = new NoticeDAO();
		dao.getNoticeHit(nid);
	}
	/**
	 * 공지사항 상세 정보
	 * @param nid
	 * @return
	 */
	public NoticeVO getResultNid(String nid) {
		NoticeVO vo = new NoticeVO();
		NoticeDAO dao = new NoticeDAO();
		vo = dao.getNoticeVO(nid);
		
		return vo;
	}
	
	/**
	 * 공지사항 전체 리스트 - 페이징
	 */
	public ArrayList<NoticeVO> getResultList(int startCount, int endCount){
		ArrayList<NoticeVO> list= new ArrayList<NoticeVO>();
		
		NoticeDAO dao = new NoticeDAO();
		list = dao.getNoticeList(startCount, endCount);
		
		return list;
	}

	/**
	 * 공지사항 전체 리스트
	 */
	public ArrayList<NoticeVO> getResultList(){
		ArrayList<NoticeVO> list= new ArrayList<NoticeVO>();
		
		NoticeDAO dao = new NoticeDAO();
		list = dao.getNoticeList();
		
		return list;
	}
	
	/**
	 * 공지사항 글 등록  
	 * @param vo
	 * @return
	 */
	public boolean getResultWrite(NoticeVO vo) {
		boolean result = false;
		NoticeDAO dao = new NoticeDAO();
		System.out.println(vo.getNtitle());
		result = dao.insertNotice(vo);
		
		dao.close();
		
		return result;
	}
}
