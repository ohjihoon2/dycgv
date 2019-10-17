package com.dycgv.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dycgv.vo.JoinVO;
import com.dycgv.vo.LoginVO;

public class JoinDAO {

	//Field
		String url="jdbc:oracle:thin:@localhost:1521";
		String user="scott";
		String pass="tiger";
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;
		
		/**
		 * 1~2�ܰ� : ����̹� �ε� �� conn ��ü ����
		 */
		public JoinDAO() {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
//				�Ʒ��� ���� ����� connection ������ �ȵ�. -> ���������� ����ǰ� �����⶧���� statement ������ �ȵ� !!!!!!! 
//				Connection conn = DriverManager.getConnection(url, user, pass);
				conn = DriverManager.getConnection(url, user, pass);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		/**
		 * 3�ܰ� : pstmt ��ü ����
		 * @param sql
		 */
		public void getPreparedStatement(String sql) {
			try {
				pstmt = conn.prepareStatement(sql);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		/**
		 *	 4 �ܰ� : ȸ������ 
		 */
		public boolean getResultJoin(JoinVO vo) {
			boolean result = false;
			String sql = "INSERT INTO DYCGV_MEMBER VALUES(?,?,?,?,?,?,?,?,?,?,sysdate,'vip',0)";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, vo.getId());
				pstmt.setString(2, vo.getName());
				pstmt.setString(3, vo.getGender());
				pstmt.setString(4, vo.getPass());
				pstmt.setString(5, vo.getEmail());
				pstmt.setString(6, vo.getAddr());
				pstmt.setString(7, vo.getPhone_comp());
				pstmt.setString(8, vo.getPhone_number());
				pstmt.setString(9, vo.getHobbyList());
				pstmt.setString(10, vo.getIntro());
				
				int val =pstmt.executeUpdate();
				
				if(val != 0) {
					result = true;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
		/**
		 *  4~5�ܰ� : ȸ�� ����Ʈ ������ 
		 */
		
		/**
		 *  4~5�ܰ� : ȸ�� ����Ʈ �� ��� 
		 */
		
		/**
		 *  6�ܰ� : ����
		 */
		public void close() {
			try {
				if(rs != null) rs.close();
				
				if(pstmt != null) pstmt.close();
				
				if(conn != null) conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
}
