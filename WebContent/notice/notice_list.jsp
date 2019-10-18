<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dycgv.service.*, java.util.*, com.dycgv.vo.*"%>

 <%
 	request.setCharacterEncoding("utf-8");
 	NoticeCheckService service = new NoticeCheckService();
 	ArrayList<NoticeVO> list = service.getResultList();
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
					<h1>공지사항</h1>
					<table class="notice">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
						<tr>
							<%for(NoticeVO vo : list ){ %>
							<td><%=vo.getRno() %></td>
							<td><a href="notice_content.jsp?nid=<%=vo.getNid()%>"><%=vo.getNtitle() %></a></td>
							<td><%=vo.getNdate() %></td>
							<td><%=vo.getNhit() %></td>
						</tr>
							<%} %>
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