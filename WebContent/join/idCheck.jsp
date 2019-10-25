<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dycgv.dao.JoinDAO"%>
    
<%
	String id = request.getParameter("id");
	JoinDAO dao = new JoinDAO();
	int result = dao.getResultIdCheck(id);
	
	out.write(String.valueOf(result));
	
%>