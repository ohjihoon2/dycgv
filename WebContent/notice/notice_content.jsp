<%@page import="com.dycgv.service.NoticeCheckService, com.dycgv.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String nid = request.getParameter("nid");

NoticeCheckService service = new NoticeCheckService();


//sql결과가 하나이면은 vo를 보내면 되고 2개이상이면 list로 만들어서 보낸다.
	NoticeVO vo = service.getResultNid(nid);
	
	if(vo.getNtitle() != "" && vo.getNtitle() !=null){
		service.getResultNitUpdate(nid);
	}else{
		response.sendRedirect("../errorPage.jsp");
	}
	
	/* nid 값이 없는 곳에도 ex) ?nid=100 일경우 !에도 조회수 업데이트가 진행됨. vo 객체가 null이 되는거지 생성이 안되는것이 아니다.
	dao에서 new로 객체를 생성했기때문에 ! 객체가 null값이 들어가는 것이다.
	
	if(vo !=null){
		out.write("조회수 업데이트");
	}else{
		out.write("데이터 없음");
	} */
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
							<td colspan=5>
								</p><%=vo.getNcontent() %> 
							</td>
						</tr>
						<tr>
							<td colspan=6>
								<a href="notice_list.jsp"><button type="button">목록으로</button></a>
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