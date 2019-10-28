package com.dycgv.service;

import java.util.ArrayList;

import com.dycgv.dao.JoinDAO;
import com.dycgv.vo.JoinVO;
import com.dycgv.vo.MemberVO;

public class JoinCheckService {

	
	/**
	 * DB���� ��ü ī��Ʈ ��������
	 * @return
	 */
	public int execTotalCount(){
		int result =0;
		JoinDAO dao = new JoinDAO();
		result = dao.execTotalCount();
		return result;
	}
	
	//ȸ������ ���� �޼ҵ�
	public boolean getJoinResult(JoinVO vo) {
		boolean result = false;
		
		JoinDAO dao = new JoinDAO();
		
		result = dao.getResultJoin(vo);
		
	/*	System.out.println(vo.getId());
		System.out.println(vo.getName());
		System.out.println(vo.getGender());
		System.out.println(vo.getPass());
		System.out.println(vo.getEmail());
		System.out.println(vo.getAddr());
		System.out.println(vo.getPhone_comp());
		System.out.println(vo.getPhone_number());
		System.out.println(vo.getHobbyList());
		System.out.println(vo.getIntro());*/
		
		//db���� �� insert �۾� ���� 
		
		return result;
	}
	
	/**
	 * ȸ�� ���� ����Ʈ
	 */
	public ArrayList<MemberVO> getJoinResultList() {
		JoinDAO dao = new JoinDAO();
		ArrayList<MemberVO> list = dao.getResultList();
		
		return list;
	}
	
	/**
	 * ȸ�� ���� ����Ʈ - ����¡
	 */
	public ArrayList<MemberVO> getJoinResultList(int startCount, int endCount) {
		JoinDAO dao = new JoinDAO();
		ArrayList<MemberVO> list = dao.getResultList(startCount, endCount);
		
		return list;
	}
	
	public MemberVO getResultContent(String id) {
		MemberVO vo = new MemberVO();
		JoinDAO dao = new JoinDAO();
		vo = dao.getResultContent(id);
		return vo;
	}
	
}
