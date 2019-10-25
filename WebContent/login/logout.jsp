<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sid = (String)session.getAttribute("sid");
	if(sid != null	){
		session.invalidate();
		response.sendRedirect("../index.jsp");
		//session의 역할은 끝나고 다른 값들을 받아와서 처리하려면 ?query String으로 사용하면 된다.
	}
%>