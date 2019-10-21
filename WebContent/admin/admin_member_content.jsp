<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.dycgv.vo.MemberVO, com.dycgv.service.JoinCheckService"%>

<%
	String id = request.getParameter("id");
	JoinCheckService service = new JoinCheckService();
	MemberVO vo = service.getResultContent(id);
	
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
					<table class="notice_content">
						<tr>
							<th>아이디</th>
							<td><%=vo.getId() %></td>
							<th>이름</th>
							<td><%=vo.getName() %></td>
							<th>연락처</th>
							<td><%=vo.getPhone_number() %></td>
							<th>회원등급</th>
							<td><%=vo.getJgrade() %></td>
							<th>가입날짜</th>
							<td><%=vo.getJdate() %></td>
						</tr>
						<tr>
							<th>주소</th>
							<td colspan=9 style=text-align:left;padding-left:5px;>
								<%=vo.getAddr() %>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td colspan=9 style=text-align:left;padding-left:5px;>
								<%=vo.getEmail() %>
							</td>
						</tr>
						<tr>
							<th>관심분야</th>
							<td colspan=9 style=text-align:left;padding-left:5px;>
								<%=vo.getDy_hobby() %>
							</td>
						</tr>
						<tr>
							<th>자기소개</th>
							<td colspan=9 style=text-align:left;padding-left:5px;>
								<%=vo.getIntro() %>
							</td>
						</tr>
						<tr>
							<td colspan=10>
								<a href="admin_member_list.jsp"><button type="button">목록으로</button></a>
								<a href="admin.jsp"><button type="button">관리자홈</button></a>
							</td>
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