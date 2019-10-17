<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dycgv.service.*, com.dycgv.vo.*"%>
<%
	String nid = request.getParameter("nid");
	NoticeCheckService service = new NoticeCheckService();
	NoticeVO vo = service.getResultNid(nid);
	
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
					<form name ="noticeUpdateForm" action="admin_update_process.jsp" method="post">
						<table class="admin_notice_write">
							<tr>
								<th>제목</th>
								<td><input type="text" name="ntitle" value="<%=vo.getNtitle() %>"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="ncontent"><%=vo.getNcontent() %></textarea></td>
							</tr>
							<tr>
								<th>파일</th>
								<td><input type="file" name="nfile"></td>
							</tr>
							<tr>
								<td colspan=2>
									<button type="submit">수정완료</button>
									<button type="reset">취소하기</button>
									<a href="admin_notice_list.jsp"><button type="button">목록으로</button></a>
									<a href="admin_notice_content.jsp?nid=<%=nid%>"><button type="button">이전페이지</button></a>
									<input type="hidden" name="nid" value="<%=nid%>">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</section>
		</div>
		<!-- footer 추가 -->		
		<!-- 상대경로만 가능하다 -->
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>