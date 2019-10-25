<%@page import="com.google.gson.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dycgv.dao.BoardDAO, java.util.*, com.dycgv.vo.*" %>
<%

	//1. db 연동
	BoardDAO dao = new BoardDAO();
	ArrayList<BoardVO> list = dao.getBoardList();
	
	//2. json 객체 생성 및 전송 
	Gson gson = new Gson();
	JsonArray jlist = new JsonArray();
	JsonObject jresult = new JsonObject();// 최종 JSON객체 전송시에 사용 -- 배열은 못보낸다. 
	
	// Array에다가 object를 담는 작업
	for(BoardVO vo : list){
		JsonObject obj = new JsonObject();
		obj.addProperty("rno", vo.getRno());
		obj.addProperty("btitle", vo.getBtitle());
		obj.addProperty("bdate", vo.getBdate());
		obj.addProperty("bhit", vo.getBhit());
		
		jlist.add(obj);
	}
	
	//JSON형태로 바꿔주는 작업
	jresult.add("list", jlist);
	
	System.out.println(jresult);
	
	out.write(gson.toJson(jresult));
%>