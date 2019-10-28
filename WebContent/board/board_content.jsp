<%@page import="com.dycgv.service.BoardCheckService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="vo" class="com.dycgv.vo.BoardVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>
 
<%
	String bno = request.getParameter("bno");
	String rpage = request.getParameter("page");
	BoardCheckService service = new BoardCheckService();
	vo = service.getResultBoardContent(bno);
	
	if(vo.getBcontent() != "" && vo.getBcontent() != null){
		service.getResultHit(vo);
		if(vo.getBcontent() !="" && vo.getBcontent() !=null){
			vo.setBcontent(vo.getBcontent().replace("\r\n", "<br>"));			
		}
	}else{
		out.write("실패");
		
	}
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
					<table class="board_content">
						<tr>
							<th>제목</th>
							<td><%=vo.getBtitle() %></td>
							<th>등록일</th>
							<td><%=vo.getBdate() %></td>
							<th>조회수</th>
							<td><%=vo.getBhit() %></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan=5>
								<%if(vo.getBcontent() != null && vo.getBcontent() !=""){ %>
								<p><%=vo.getBcontent() %>
								</p> 
								<%} %>
							</td>
						</tr>
						<tr>
							<th>file</th>
							<td colspan=5>
								<%if(vo.getBsfile() != null && vo.getBsfile() != ""){ %>
								<img width= "300px" height="300px"  src="http://localhost:9090/dycgv/fileupload/<%=vo.getBsfile() %>">
								<%} %>
							</td>
						</tr>
						<tr>
							<td colspan=6>
								<a href="board_update.jsp?bno=<%=vo.getBno() %>"><button type="button">수정하기</button></a>
								<a href="board_delete.jsp?bno=<%=vo.getBno() %>"><button type="button">삭제하기</button></a>
								<a href="board_list.jsp?page=<%=rpage%>"><button type="button">목록으로</button></a>
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