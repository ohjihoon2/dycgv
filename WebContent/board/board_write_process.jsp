<%@page import="com.dycgv.service.BoardCheckService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="com.dycgv.vo.BoardVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>

<%
	BoardCheckService service = new BoardCheckService();
	boolean result = service.getResultWrite(vo);
	
	if(result){
		response.sendRedirect("board_list.jsp");
	}else{
		response.sendRedirect("../errorPage.jsp");
	}
%>