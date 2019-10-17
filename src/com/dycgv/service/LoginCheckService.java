package com.dycgv.service;

import com.dycgv.dao.LoginDAO;
import com.dycgv.vo.LoginVO;

public class LoginCheckService {

	/**
	 * �α��� ó�� �޼ҵ� 	
	 * @param vo
	 * @return
	 */
	public boolean getLoginResult(LoginVO vo){
		boolean result = false;
		LoginDAO dao = new LoginDAO();

		int count = dao.getResultLogin(vo);
		if(count!=0) {
			result =true;
		}
		return result;
	}
}
