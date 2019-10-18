<%@page import="com.dycgv.service.BoardCheckService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function del(){
		alert("삭제되었습니다.");
	}
</script>
<%
	String bno = request.getParameter("bno");
	BoardCheckService service = new BoardCheckService();
	boolean result = service.getResultDelete(bno);
	
	if(result){
		%>
		<script>
			del();
		</script>
		<%
		response.sendRedirect("board_list.jsp");
	}else{
		response.sendRedirect("../errorPage.jsp");
	}
%>