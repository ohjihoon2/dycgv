package com.dycgv.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.dycgv.vo.LoginVO;
import com.dycgv.vo.SessionVO;

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
			public SessionVO getResultLogin(LoginVO vo) {
				SessionVO svo= new SessionVO();
				String sql = "select count(*), name from dycgv_member where id=? and pass=? group by name";			
				getPreparedStatement(sql);

				try {
					pstmt.setString(1, vo.getId());
					pstmt.setString(2, vo.getPass());
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						if(rs.getInt(1) !=0) {
							svo.setResult(true);
							svo.setName(rs.getString(2));
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				return svo;
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
