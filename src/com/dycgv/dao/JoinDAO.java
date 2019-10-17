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
		 * 1~2단계 : 드라이버 로딩 및 conn 객체 생성
		 */
		public JoinDAO() {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
//				아래와 같이 만들면 connection 생성이 안됨. -> 지역변수로 선언되고 끝나기때문에 statement 생성이 안됨 !!!!!!! 
//				Connection conn = DriverManager.getConnection(url, user, pass);
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
		 *	 4 단계 : 회원가입 
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
		 *  4~5단계 : 회원 리스트 페이지 
		 */
		
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
