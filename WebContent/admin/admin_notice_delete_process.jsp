<%@page import="com.dycgv.service.NoticeCheckService, com.dycgv.vo.* , com.dycgv.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String nid = request.getParameter("nid");
	out.write(nid);
	NoticeCheckService service = new NoticeCheckService();
	boolean result = service.getResultDelete(nid);	
	
 	if(result){
		response.sendRedirect("admin_notice_list.jsp?result="+result);
	
	}else{
		response.sendRedirect("../errorPage.jsp");
	} 
	
%>
