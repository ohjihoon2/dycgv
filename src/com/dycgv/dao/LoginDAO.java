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
			 * 1~2단계 : 드라이버 로딩 및 conn 객체 생성
			 */
			public LoginDAO() {
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
//					아래와 같이 만들면 connection 생성이 안됨. -> 지역변수로 선언되고 끝나기때문에 statement 생성이 안됨 !!!!!!! 
//					Connection conn = DriverManager.getConnection(url, user, pass);
					conn = DriverManager.getConnection(url, user, pass);
					
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			/**
			 * 3단계 : pstmt 객체 생성
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
			 *  4~5단계 : 회원 리스트 페이지 
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
			 *  4~5단계 : 회원 리스트 상세 출력 
			 */
			
			/**
			 *  6단계 : 종료
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
