<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dycgv.vo.*, com.dycgv.service.*"%>
    
<jsp:useBean id="vo" class="com.dycgv.vo.LoginVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>

<%
	/* LoginVO vo = new LoginVO();
	
	vo.setId(request.getParameter("id"));
	vo.setPw(request.getParameter("pw"));
	
	System.out.println("id: "+vo.getId());
	System.out.println("pw: "+vo.getPw());
	 */
	//loginCheck 객체 생성 및 메소드 호출
	//com.dycgv.service.LoginCheckService.getLoginREsult(vo);
	LoginCheckService service = new LoginCheckService(); 
	boolean result = service.getLoginResult(vo);
	
	if(result){
		response.sendRedirect("../index.jsp?result="+result);
	}else{
		response.sendRedirect("login.jsp");
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>