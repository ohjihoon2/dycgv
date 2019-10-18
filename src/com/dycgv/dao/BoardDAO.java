package com.dycgv.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.dycgv.vo.BoardVO;

public class BoardDAO {

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
	public BoardDAO() {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, user, pass);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	//3
	public void getPreparedStatement(String sql) {
		try {
			pstmt = conn.prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//4~5
	
	/**
	 * 게시판 list 보기
	 * @return
	 */
	public ArrayList<BoardVO> getBoardList() {
		ArrayList<BoardVO> list= new ArrayList<BoardVO>();
		String sql ="select rownum rno, bno, btitle, bcontent, bdate, bhit, bfile, bsfile "
				+ "from (select bno, btitle, bcontent, bdate, bhit, bfile, bsfile from dycgv_board ORDER BY bdate desc)";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setRno(rs.getInt(1));
				vo.setBno(rs.getInt(2));
				vo.setBtitle(rs.getString(3));
				vo.setBcontent(rs.getString(4));
				vo.setBdate(rs.getString(5));
				vo.setBhit(rs.getInt(6));
				vo.setBfile(rs.getString(7));
				vo.setBsfile(rs.getString(8));
				
				list.add(vo);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	/**
	 * 게시판 상세보기
	 * @param bno
	 * @return
	 */
	public BoardVO getBoardContent(String bno) {
		BoardVO vo = new BoardVO();
		String sql="select bno, btitle, bcontent, bdate, bhit from dycgv_board where bno = ?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, bno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setBno(rs.getInt(1));
				vo.setBtitle(rs.getString(2));
				vo.setBcontent(rs.getString(3));
				vo.setBdate(rs.getString(4));
				vo.setBhit(rs.getInt(5));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	/**
	 * 게시글 등록
	 */
	public boolean getBoardWrite(BoardVO vo) {
		boolean result= false;
		String sql="insert into dycgv_board values(seq_board.nextval, ?,?,sysdate,0,' ',' ')";
		
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBcontent());
			
			int val = pstmt.executeUpdate();
			
			if(val !=0) {
				result = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 조회수 올리기
	 */
	public void getBoardHit(BoardVO vo) {
		String sql ="update dycgv_board set BHIT = BHIT+1 where BNO = ?";
		
		getPreparedStatement(sql);
		
		try {
			pstmt.setInt(1, vo.getBno());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 게시판 업데이트
	 */
	public boolean  getBoardUpdate(BoardVO vo) {
		boolean result =false;
		String sql="update dycgv_board set btitle=?, bcontent=?where bno=?";
		
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBcontent());
			pstmt.setInt(3, vo.getBno());
			
			int val = pstmt.executeUpdate();
			
			if(val !=0) {
				result =true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("dao "+result);
		return result;
	}
	
	/**
	 * 게시물 삭제
	 * @param bno
	 */
	public boolean getBoardDelete(String bno) {
		boolean result = false;
		String sql = "delete from dycgv_board where bno=?";
		
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, bno);
			
			int val = pstmt.executeUpdate();
			if(val != 0) {
				result = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	
	//6
	
	public void close() {
			try {
				if(rs != null)	rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}





}
