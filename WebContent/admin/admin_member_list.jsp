<%@page import="com.dycgv.service.JoinCheckService, com.dycgv.vo.MemberVO, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	JoinCheckService service = new JoinCheckService();
	ArrayList<MemberVO> list = service.getJoinResultList();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CGV에 오신것을 환영합니다.</title>
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/dycgv/css/dycgv.css">
</head>
<body>
	<div>
		<!-- header 추가 -->
		<jsp:include page="../header.jsp"></jsp:include>
		<div id="content">
			<section>
				<img alt="" src="http://localhost:9090/dycgv/images/section1_img01.jpg">
				<div>
					<h1>회원관리</h1>
					<table class="notice">
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>연락처</th>
							<th>가입날짜</th>
							<th>등급</th>
							<th>회원탈퇴</th>
						</tr>
						<% for(MemberVO vo: list){ %>
						<tr>
							<td><%=vo.getRno() %></td>
							<td><a href="admin_member_content.jsp?id=<%=vo.getId()%>"><%=vo.getName() %></a></td>
							<td><%=vo.getPhone_number() %></td>
							<td><%=vo.getJdate()%></td>
							<td><%=vo.getJgrade()%></td>
							<%if(vo.getJstatus() == 0){ %>
							<td><button type="button">삭제</button></td>
							<%}else{ %>
							<td><button type="button" style="color:white; background:rgb(34,34,34)">삭제</button></td>
							<%}} %>
						</tr>
						<tr>
							<td colspan=4>[이전] 1 2 3 4 5 [다음]</td>
						</tr>
					</table>
				</div>
			</section>
		</div>
		<!-- footer 추가 -->		
		<!-- 상대경로만 가능하다 -->
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>