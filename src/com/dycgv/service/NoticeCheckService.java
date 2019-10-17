package com.dycgv.service;

import java.util.ArrayList;

import com.dycgv.dao.NoticeDAO;
import com.dycgv.vo.NoticeVO;

public class NoticeCheckService {
	
	/**
	 * �������� ����
	 * @param nid
	 */
	public boolean getResultUpdate(NoticeVO vo) {
		boolean result = false;
		NoticeDAO dao = new NoticeDAO();
		result = dao.getNoticeUpdate(vo);
		return result;
	}
	
	/**
	 * ��ȸ�� ����
	 * @param nid
	 */
	public void getResultNitUpdate(String nid){
		NoticeDAO dao = new NoticeDAO();
		dao.getNoticeHit(nid);
	}
	/**
	 * �������� �� ����
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
	 * �������� ��ü ����Ʈ
	 */
	public ArrayList<NoticeVO> getResultList(){
		ArrayList<NoticeVO> list= new ArrayList<NoticeVO>();
		
		NoticeDAO dao = new NoticeDAO();
		list = dao.getNoticeList();
		
		return list;
	}

	/**
	 * �������� �� ���  
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
