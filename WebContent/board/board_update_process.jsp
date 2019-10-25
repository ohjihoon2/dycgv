<%@page import="com.dycgv.service.BoardCheckService, com.dycgv.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*, java.io.*" %>
<!-- 파일이 있는경우에는 의미 없다. -->
<%-- <jsp:useBean id="vo" class="com.dycgv.vo.BoardVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>
 --%>
 
<%
	String save_path = request.getServletContext().getRealPath("/fileupload");
	int max_size = 1024*1024*5; //5mb
	MultipartRequest multi = new MultipartRequest(request,save_path,max_size, "utf-8",new DefaultFileRenamePolicy());
	File file = new File(save_path+"/"+multi.getFilesystemName("bfile"));

	BoardCheckService service = new BoardCheckService();
	BoardVO vo = new BoardVO();
	vo.setBtitle(multi.getParameter("btitle"));
	vo.setBcontent(multi.getParameter("bcontent"));
	vo.setBno(Integer.parseInt(multi.getParameter("bno")));
	boolean result = false;
	
	if(file.exists()){
		//타이틀, 내용, 파일 업데이트
		vo.setBfile(multi.getOriginalFileName("bfile"));
		vo.setBsfile(multi.getFilesystemName("bfile"));
		result = service.getResultUpdate(vo);
	}else{
		//타이틀, 내용, 업데이트
		result = service.getResultUpdateNoFile(vo);
	}
	
	if(result){
		response.sendRedirect("board_content.jsp?bno="+vo.getBno());
	}else{
		response.sendRedirect("../errorPage.jsp");
	}
%>