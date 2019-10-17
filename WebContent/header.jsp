<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	boolean result = Boolean.valueOf(request.getParameter("result"));
	
	String loginAddr = "", loginMenu = "";
	if(result){
		loginAddr="logout.jsp";
		loginMenu="로그아웃";
	}else{
		loginAddr="login.jsp";
		loginMenu="로그인";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<div>
			<nav>
				<ul>
					<li><a href="http://localhost:9090/dycgv/login/<%=loginAddr%>"><%=loginMenu%></a></li>
					<li><a href="http://localhost:9090/dycgv/join/join.jsp">회원가입</a></li>
					<li><a href="http://localhost:9090/dycgv/mycgv/mycgv.jsp">MyCGV</a></li>
					<li><a href="http://localhost:9090/dycgv/notice/notice_list.jsp">공지사항</a></li>
					<li><a href="http://localhost:9090/dycgv/board/board_list.jsp">게시판</a></li>
					<li><a href="http://localhost:9090/dycgv/admin/admin.jsp">Admin</a></li>
					<li><a href="http://localhost:9090/dycgv/login/login.jsp">ENGLISH TICKETING</a></li>
				</ul>
			</nav>
			<div>
				<a href="http://localhost:9090/dycgv/index.jsp">
					<img alt="" src="http://localhost:9090/dycgv/images/h1_cgv.png">
				</a>
				<div>
					<img alt="" src="http://localhost:9090/dycgv/images/h2_cultureplex.png">
					<nav>
						<ul>
							<li><a href="#">영화</a></li>
							<li><a href="#">예매</a></li>
							<li><a href="#">극장</a></li>
							<li><a href="#">이벤트&컬쳐</a></li>
						</ul>
					</nav>
				</div>	
			</div>
		</div>
	</header>
</body>
</html>