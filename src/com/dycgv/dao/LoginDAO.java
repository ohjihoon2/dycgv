package com.dycgv.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.dycgv.vo.LoginVO;

public class LoginDAO {
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
			public LoginDAO() {
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
//					�Ʒ��� ���� ����� connection ������ �ȵ�. -> ���������� ����ǰ� �����⶧���� statement ������ �ȵ� !!!!!!! 
//					Connection conn = DriverManager.getConnection(url, user, pass);
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
			 *  4~5�ܰ� : ȸ�� ����Ʈ ������ 
			 */
			public int getResultLogin(LoginVO vo) {
				int result = 0;
				String sql = "select count(*) from dycgv_member where id = ? and pass=?";			
				getPreparedStatement(sql);

				try {
					pstmt.setString(1, vo.getId());
//					System.out.println(vo.getId());
					pstmt.setString(2, vo.getPass());
//					System.out.println(vo.getPass());
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						result = rs.getInt(1);
					}
					System.out.println(result);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				return result;
			}
			
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
