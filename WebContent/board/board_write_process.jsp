<%@page import="com.dycgv.service.BoardCheckService, com.dycgv.vo.BoardVO"%>
<%@page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.* , java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/* MultipartRequest(javax.servlet.http.HttpServletRequest request,java.lang.String saveDirectory
		,int maxPostSize,java.lang.String encoding, FileRenamePolicy policy)  
	
		request - 자동으로 생성되어 있기때문에 request
		java.lang.String saveDirectory 파일 저장위치
		int maxPostSize 파일사이즈제한
		java.lang.String encoding 인코딩
		DefaultFileRenamePolicy()= 파일 중복방지 생성자 생성
	*/
	String save_path = request.getServletContext().getRealPath("/fileupload");

	int max_size = 1024*1024*5; //5mb
	
	MultipartRequest multi = new MultipartRequest(request,save_path,max_size, "utf-8",new DefaultFileRenamePolicy());
	System.out.println(save_path+"/"+multi.getFilesystemName("bfile"));
	
	File file = new File(save_path+"/"+multi.getFilesystemName("bfile"));
	
	BoardVO vo = new BoardVO();
 	vo.setBtitle(multi.getParameter("btitle"));
 	vo.setBcontent(multi.getParameter("bcontent"));
	
	if(file.exists()){
		//BoardVO 객체에 데이터 넣기
	 	vo.setBfile(multi.getOriginalFileName("bfile"));
	 	vo.setBsfile(multi.getFilesystemName("bfile"));
	 
	}else{
		System.out.println("파일 없음"+multi.getFilesystemName("bfile"));
	 	vo.setBfile(multi.getOriginalFileName(""));
	 	vo.setBsfile(multi.getFilesystemName(""));
	}
	
	 	BoardCheckService service = new BoardCheckService();
		boolean result = service.getResultWrite(vo);
/* 	System.out.println(save_path);
	System.out.println("btitle = " +multi.getParameter("btitle"));
	System.out.println("bcontent = " +multi.getParameter("bcontent"));
	System.out.println("bfile = " +multi.getOriginalFileName("bfile"));
	System.out.println("bsfile = " +multi.getFilesystemName("bfile"));
	//실제 파일이 있는 장소 - 전체 url
	System.out.println(save_path+"/"+multi.getFilesystemName("bfile"));
 */
 
 	

	if(result){
		response.sendRedirect("board_list.jsp");
	}else{
		response.sendRedirect("../errorPage.jsp");
	} 
%>
