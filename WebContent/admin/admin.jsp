<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sid = (String)session.getAttribute("sid");
	if(sid != null){
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
				<div class="admin_main">
					<h1>관리자 페이지</h1>
					<a href="admin_notice_list.jsp"><span>공지사항 관리</span></a>
					<a href="admin_member_list.jsp"><span>회원 관리</span></a>
					<a href="#"><span>영화리스트 관리</span></a>
				</div>
			</section>
		</div>
		<!-- footer 추가 -->		
		<!-- 상대경로만 가능하다 -->
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>
<%-- <%}else{
		response.sendRedirect("../errorPage.jsp");
	}%> --%>
	<%}else{ %>
		<script>
			alert("페이지 주소가 올바르지 않습니다. 확인 후 다시 접속해주세요.")
			location.href="../index.jsp";
		</script>
	<%	
			//response.sendRedirect("../errorPage.jsp");
			//response를 사용하면 script가 실행이 안되니 script를 사용하여 페이지를 이동
	}%>