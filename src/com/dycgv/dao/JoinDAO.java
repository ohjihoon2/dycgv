package com.dycgv.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dycgv.vo.JoinVO;
import com.dycgv.vo.MemberVO;

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

		public int getResultIdCheck(String id) {
			int result = 0;
			
			String sql = "select count(*) from dycgv_member where id=?";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					result = rs.getInt(1);
				};
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return result;
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
		public ArrayList<MemberVO> getResultList(){
			ArrayList<MemberVO> list = new ArrayList<MemberVO>();
			
			String sql="select rownum rno, name, phone_number, to_char(jdate,'yyyy/mm/dd'), jgrade, jstatus, id" + 
					" from (select name, phone_number, jdate, jgrade, jstatus, id " + 
					"            from dycgv_member order by jdate desc)";
			getPreparedStatement(sql);
			
			try {
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					MemberVO vo = new MemberVO();
					vo.setRno(rs.getInt(1));
					vo.setName(rs.getString(2));
					vo.setPhone_number(rs.getString(3));
					vo.setJdate(rs.getString(4));
					vo.setJgrade(rs.getString(5));
					vo.setJstatus(rs.getInt(6));
					vo.setId(rs.getString(7));
					
					list.add(vo);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		
			return list;
		}
		
		/**
		 *  4~5단계 : 회원 리스트 상세 출력 
		 */
		public MemberVO getResultContent(String id) {
			
			MemberVO vo = new MemberVO();
			String sql="select * from dycgv_member where id=?";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					vo.setId(rs.getString(1));
					vo.setName(rs.getString(2));
					vo.setGender(rs.getString(3));
					vo.setPass(rs.getString(4));
					vo.setEmail(rs.getString(5));
					vo.setAddr(rs.getString(6));
					vo.setPhone_comp(rs.getString(7));
					vo.setPhone_number(rs.getString(8));
					vo.setDy_hobby(rs.getString(9));
					vo.setIntro(rs.getString(10));
					vo.setJdate(rs.getString(11));
					vo.setJgrade(rs.getString(12));
					vo.setJstatus(rs.getInt(13));
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return vo;
		}
		
		
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
