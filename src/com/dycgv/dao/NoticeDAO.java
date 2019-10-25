package com.dycgv.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dycgv.vo.NoticeVO;

public class NoticeDAO {

	//Field
	String url="jdbc:oracle:thin:@localhost:1521";
	String user="scott";
	String pass="tiger";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	/**
	 * 1~2�ܰ� : jdbc ���� �� connection ��ü ���� 
	 */
	public NoticeDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 3�ܰ� : pstmt ��ü ���� 
	 */
	public void getPreparedStatement(String sql) {
		try {
			pstmt = conn.prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 4�ܰ� : SQL���� ����
	 */
	public boolean insertNotice(NoticeVO vo) {
		boolean result = false;
		String sql = "insert into dycgv_notice values(DYCGV_NOTICE_SEQU.nextval, ?, ? , sysdate,0,?,?)";
		getPreparedStatement(sql);
		int val =0;
		System.out.println("1 :"+ vo.getNtitle());
		try {
			pstmt.setString(1, vo.getNtitle());
			pstmt.setString(2, vo.getNcontent());
			pstmt.setString(3, vo.getNfile());
			pstmt.setString(4, vo.getNsfile());
			val = pstmt.executeUpdate();
			
			if(val !=0) {
				result= true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 *  ��ü list ���
	 */
	public ArrayList<NoticeVO> getNoticeList() {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		String sql = "select rownum rno, nid, ntitle, to_char(ndate,'yyyy/mm/dd'), nhit " + 
				"from (select nid, ntitle, ndate, nhit "+ 
				"           from dycgv_notice " + 
				"           order by ndate desc)";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeVO vo = new NoticeVO();
				vo.setRno(rs.getInt(1));
				vo.setNid(rs.getInt(2));
				vo.setNtitle(rs.getString(3));
				vo.setNdate(rs.getString(4));
				vo.setNhit(rs.getInt(5));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**  
	 * �������� �� ����
	 * @return 
	 */
	public NoticeVO getNoticeVO(String nid) {
		NoticeVO vo = new NoticeVO();
		
		String sql = "select * from dycgv_notice where nid =?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, nid);
			rs = pstmt.executeQuery();
			while(rs.next()){
				vo.setNid(rs.getInt(1));
				vo.setNtitle(rs.getString(2));
				vo.setNcontent(rs.getString(3));
				vo.setNdate(rs.getString(4));
				vo.setNhit(rs.getInt(5));
				vo.setNfile(rs.getString(6));
				vo.setNsfile(rs.getString(7));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	/**
	 * ��ȸ�� ����
	 * @param nid
	 * @return
	 */
	public void getNoticeHit(String nid) {
		String sql = "update dycgv_notice set NHIT = NHIT+1 where nid=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, nid);
			//void�� �޾Ƶ� int�� �ȹ޾Ƶ� �ȴ�. int val = pstmt.executeUpdate();
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * �������� ������Ʈ
	 * @param nid
	 */
	public boolean getNoticeUpdate(NoticeVO vo) {
		boolean result = false;
		String sql="update dycgv_notice set ntitle = ? , ncontent =?, nfile=?, nsfile=?  where nid = ?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, vo.getNtitle());
			pstmt.setString(2, vo.getNcontent());
			pstmt.setString(3, vo.getNfile());
			pstmt.setString(4, vo.getNsfile());
			pstmt.setInt(5, vo.getNid());
			
			int val = pstmt.executeUpdate();
			if(val !=0) {
				result = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean getNoticeDelete(String nid) {
		boolean result = false;
		
		String sql = "delete from dycgv_notice where nid=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, nid);
			int val = pstmt.executeUpdate();
			
			if(val != 0) {
				result =true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	
	//6 �ܰ� 
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
