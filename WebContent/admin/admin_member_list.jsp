<%@page import="com.dycgv.service.JoinCheckService, com.dycgv.vo.MemberVO, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String rpage = request.getParameter("page");
	JoinCheckService service = new JoinCheckService();
	
	//1.페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 3;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = service.execTotalCount();	//DB에서 가져온 전체 행수
		
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//요청 페이지 계산
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
	 		endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = pageSize;
		}

	ArrayList<MemberVO> list = service.getJoinResultList(startCount, endCount);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CGV에 오신것을 환영합니다.</title>
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/dycgv/css/am-pagination.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/dycgv/css/dycgv.css">
	<script src="http://localhost:9090/dycgv/js/jquery-3.4.1.min.js"></script>
	<script src="http://localhost:9090/dycgv/js/am-pagination.js"></script>
	<script>
		$(document).ready(function(){
			
			var pager = jQuery('#ampaginationsm').pagination({
			
			    maxSize: 7,	    		// max page size
			    totals: <%=dbCount%>,	// total pages	
			    page: <%=rpage%>,		// initial page		
			    pageSize: <%=pageSize%>,			// max number items per page
			
			    // custom labels		
			    lastText: '&raquo;&raquo;', 		
			    firstText: '&laquo;&laquo;',		
			    prevText: '&laquo;',		
			    nextText: '&raquo;',
					     
			    btnSize:'sm'	// 'sm'  or 'lg'		
			});
			
			jQuery('#ampaginationsm').on('am.pagination.change',function(e){
				   jQuery('.showlabelsm').text('The selected page no: '+e.page);
		           $(location).attr('href', "http://localhost:9090/dycgv/admin/admin_member_list.jsp?page="+e.page);         
		    });
			
	 	});
	</script> 
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
							<td colspan=4><div id="ampaginationsm"></div></td>
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