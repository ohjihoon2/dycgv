<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="com.dycgv.service.NoticeCheckService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dycgv.vo.NoticeVO, com.dycgv.dao.*"%>
    
<%-- <jsp:useBean id="vo" class="com.dycgv.vo.NoticeVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/> --%>

<!--  수정폼에서 많은 실수가 있는것 nid를 못받아옴 -->
<!--  input type="hidden"을 사용하면 nid를 받아올 수 있음 -->
<%-- 
		nid = <%=vo.getNid() %> 
		ntitle = <%=vo.getNtitle()%>
 --%>
<%
	String save_path = request.getServletContext().getRealPath("/fileupload");
	int maxPostSize =1024*1024*5;
	MultipartRequest multi = new MultipartRequest(request, save_path, maxPostSize, "utf-8",new DefaultFileRenamePolicy());
	
	
	NoticeCheckService service = new NoticeCheckService();
	NoticeVO vo = new NoticeVO();
	vo.setNtitle(multi.getParameter("ntitle"));
	vo.setNcontent(multi.getParameter("ncontent"));
	vo.setNid(Integer.parseInt(multi.getParameter("nid")));
	
	vo.setNfile(multi.getOriginalFileName("nfile"));
	vo.setNsfile(multi.getFilesystemName("nfile"));
	
	boolean result = service.getResultUpdate(vo);
	
	if(result){
		response.sendRedirect("admin_notice_content.jsp?nid="+vo.getNid());
	}else{
		response.sendRedirect("../errorPage.jsp");
	}
%>

