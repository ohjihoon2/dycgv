package com.dycgv.service;

import com.dycgv.dao.JoinDAO;
import com.dycgv.vo.JoinVO;

public class JoinCheckService {

	//회원가입 실행 메소드
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
		
		//db연동 후 insert 작업 진행 
		
		return result;
	}
}
