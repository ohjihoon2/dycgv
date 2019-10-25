<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.dycgv.service.*, com.dycgv.vo.*"%>
<%@page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*, java.io.*" %>

<%
	String save_path = request.getServletContext().getRealPath("/fileupload");
	int max_size = 1024*1024*5; //5mb
	MultipartRequest multi = new MultipartRequest(request,save_path,max_size, "utf-8",new DefaultFileRenamePolicy());
	File file = new File(save_path+"/"+multi.getFilesystemName("bfile"));
	
	NoticeVO vo = new NoticeVO();
	vo.setNtitle(multi.getParameter("ntitle"));
	vo.setNcontent(multi.getParameter("ncontent"));
	
	if(file.exists()){
		
	}
	vo.setNfile(multi.getOriginalFileName("nfile"));
	vo.setNsfile(multi.getFilesystemName("nfile"));
	
	NoticeCheckService service = new NoticeCheckService();	
	boolean result = service.getResultWrite(vo);
	
	 if(result){
		response.sendRedirect("admin_notice_list.jsp");
	}else{
		response.sendRedirect("../errorPage.jsp");
	} 
%>
