package com.dycgv.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dycgv.vo.LoginVO;

public class LoginDAO2 {
	
	//Field
	String url = "jdbc:oracle:thin:@localhost:1521";
	String user ="scott";
	String pass="tiger";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	//1~2 ����̹� �ε� �� conn ��ü ����
	public LoginDAO2() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//3 : pstmt ��ü ����
	public void getPreparedStatement(String sql) {
		try {
			pstmt = conn.prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//4  : SQL ���� ���� , 5 : ���� ��� ResultSet ó��
	public boolean getResultLogin(LoginVO vo) {
		boolean result = false;
		String sql  = "select count(*) from dycgv_member where id=? and pass=?";
		int val = 0;
		try {
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt(1) !=0) {
					result = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void close() {
		
			try {
				if(rs !=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	
}
