<%@page import="com.dycgv.service.NoticeCheckService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dycgv.vo.NoticeVO, com.dycgv.dao.*"%>
<% response.setCharacterEncoding("utf-8"); %>
    
<jsp:useBean id="vo" class="com.dycgv.vo.NoticeVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>

<!--  수정폼에서 많은 실수가 있는것 nid를 못받아옴 -->
<!--  input type="hidden"을 사용하면 nid를 받아올 수 있음 -->
nid = <%=vo.getNid() %> 
ntitle = <%=vo.getNtitle()%>
<%
	NoticeCheckService service = new NoticeCheckService();
	boolean result = service.getResultUpdate(vo);
	
	if(result){
		response.sendRedirect("admin_notice_content.jsp?nid="+vo.getNid());
	}else{
		response.sendRedirect("../errorPage.jsp");
	}
%>

