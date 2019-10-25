<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dycgv.service.*, com.dycgv.vo.*"%>
<%
	String nid = request.getParameter("nid");
	NoticeCheckService service = new NoticeCheckService();
	NoticeVO vo = service.getResultNid(nid);
	
	if(vo.getNtitle() != "" && vo.getNtitle() !=null){
		vo.setNcontent(vo.getNcontent().replace("\r\n","<br>"));
	}else{
		response.sendRedirect("../errorPage.jsp");
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
					<h1>공지사항관리</h1>
					<table class="notice_content">
						<tr>
							<th>제목</th>
							<td><%=vo.getNtitle() %></td>
							<th>등록일</th>
							<td><%=vo.getNdate() %></td>
							<th>조회수</th>
							<td><%=vo.getNhit() %></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan=5 style="text-align:left; padding:30px">
								<p><%=vo.getNcontent() %>
								</p> 
								<%if(vo.getNsfile() != null && vo.getNsfile() != ""){ %>
								<img width= "300px" height="300px"  src="http://localhost:9090/dycgv/fileupload/<%=vo.getNsfile() %>">
								<%} %>
							</td>
						</tr>
						<tr>
							<td colspan=6>
								<a href="admin_notice_update.jsp?nid=<%=nid%>"><button type="button">수정하기</button></a>
								<a href="admin_notice_delete.jsp?nid=<%=nid%>"><button type="button">삭제하기</button></a>
								<a href="admin_notice_list.jsp"><button type="button">목록으로</button></a>
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