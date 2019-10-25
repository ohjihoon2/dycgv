package com.dycgv.service;

import com.dycgv.dao.LoginDAO;
import com.dycgv.vo.LoginVO;
import com.dycgv.vo.SessionVO;

public class LoginCheckService {

	/**
	 * �α��� ó�� �޼ҵ� 	
	 * @param vo
	 * @return
	 */
	public SessionVO getLoginResult(LoginVO vo){
		SessionVO svo= new SessionVO();
		LoginDAO dao = new LoginDAO();

		svo = dao.getResultLogin(vo);
		
		return svo;
	}
}
