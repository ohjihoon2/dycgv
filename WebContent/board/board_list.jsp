<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="com.dycgv.vo.BoardVO, com.dycgv.service.BoardCheckService, java.util.*"%>
<%
	BoardCheckService service = new BoardCheckService();
	ArrayList<BoardVO> list = service.getResultBoard();
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
					<h1>게시판</h1>
					<div class="board_list_btn1">
						<a href="board_write.jsp"><button type="button">글쓰기</button></a>
					</div>
					<table class="board_list">
					
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
						<% for( BoardVO vo : list){ %>
						<tr>
							<td><%=vo.getRno() %></td>
							<td><a href="board_content.jsp?bno=<%=vo.getBno() %>"><%=vo.getBtitle() %></a></td>
							<td><%=vo.getBdate() %></td>
							<td><%=vo.getBhit() %></td>
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