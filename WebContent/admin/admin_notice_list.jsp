<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import= "java.util.ArrayList, com.dycgv.vo.*, com.dycgv.service.*"%>

<%
	String rpage = request.getParameter("page");
	NoticeCheckService service = new NoticeCheckService();
	
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
		endCount = 3;
	}


	//
	ArrayList<NoticeVO> list =service.getResultList(startCount, endCount);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CGV에 오신것을 환영합니다.</title>
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/dycgv/css/dycgv.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/dycgv/css/am-pagination.css">
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
		           $(location).attr('href', "http://localhost:9090/dycgv/admin/admin_notice_list.jsp?page="+e.page);         
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
					<h1>공지사항관리</h1>
					<div class="board_list_btn1">
						<a href="admin_notice_write.jsp"><button type="button">글쓰기</button></a>
					</div>
					<table class="notice">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
						<tr>
							<%for(NoticeVO vo: list ){ %>
							<td><%=vo.getRno() %></td>
							<td><a href="admin_notice_content.jsp?nid=<%=vo.getNid()%>"><%=vo.getNtitle() %></a></td>
							<td><%=vo.getNdate() %></td>
							<td><%=vo.getNhit() %></td>
						</tr>
							<%} %>
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