<%@page import="com.dycgv.service.BoardCheckService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="vo" class="com.dycgv.vo.BoardVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>

<%
	out.write(vo.getBno());
	BoardCheckService service = new BoardCheckService();
	
	boolean result = service.getResultUpdate(vo);	
	if(result){
		response.sendRedirect("board_content.jsp?bno="+vo.getBno());
	}else{
		response.sendRedirect("../errorPage.jsp");
	}
%>