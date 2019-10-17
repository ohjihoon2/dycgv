<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.dycgv.service.*, com.dycgv.vo.*"%>
<% request.setCharacterEncoding("utf-8"); %>    
<jsp:useBean id="vo" class="com.dycgv.vo.NoticeVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>

<%

	NoticeCheckService service = new NoticeCheckService();	
	boolean result = service.getResultWrite(vo);
	
	 if(result){
		response.sendRedirect("admin_notice_list.jsp");
	}else{
		response.sendRedirect("../errorPage.jsp");
	} 
%>
