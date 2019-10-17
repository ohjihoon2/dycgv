<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dycgv.vo.*, com.dycgv.service.*"%>
<%
	//한글이 넘어오면 제일 먼저 인코딩이 자리잡아야한다.
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="com.dycgv.vo.JoinVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>
<%
	/* JoinVO vo = new JoinVO();
	
	//회원가입 폼에서 넘어오는 데이터를 받아서 JoinVO에 저장
	vo.setId(request.getParameter("id"));
	vo.setName(request.getParameter("name"));
	vo.setGender(request.getParameter("gender"));
	vo.setPass(request.getParameter("pass"));
	vo.setCpass(request.getParameter("cpass"));
	vo.setEmail1(request.getParameter("email1"));
	vo.setEmail2(request.getParameter("email2"));
	vo.setAddr(request.getParameter("addr"));
	vo.setPhone_comp(request.getParameter("phone_comp"));
	vo.setPhone_number1(request.getParameter("phone_number1"));
	vo.setPhone_number2(request.getParameter("phone_number2"));
	vo.setPhone_number3(request.getParameter("phone_number3"));
	vo.setHobbyList(request.getParameterValues("hobby"));
	vo.setIntro(request.getParameter("intro")); */
	
	
	
	//회원 가입 실행 객체 생성 및 데이터 전송
	JoinCheckService joinCheck = new JoinCheckService();
	boolean result = joinCheck.getJoinResult(vo);

	if(result){
		//로그인 페이지 이동
		response.sendRedirect("http://localhost:9090/dycgv/login/login.jsp");
	}else{
		//에러 페이지 이동
		response.sendRedirect("../errorPage.jsp");
		
	}
	
%>
