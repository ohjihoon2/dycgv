<%@page import="com.dycgv.service.BoardCheckService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CGV에 오신것을 환영합니다.</title>
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/dycgv/css/dycgv.css">
	<script src="http://localhost:9090/dycgv/js/jquery-3.4.1.min.js"></script>
	<script src	="http://localhost:9090/dycgv/js/dycgv.js"></script>
</head>
<body>
	<div>
		<!-- header 추가 -->
		<jsp:include page="../header.jsp"></jsp:include>
		<div id="content">
			<section>
				<img alt="" src="http://localhost:9090/dycgv/images/section1_img01.jpg">
				<div>	
					<h1>게시판</h1>
					<form action="board_write_process.jsp" method="post" name="boardForm" enctype="multipart/form-data">
					<!--
						 enctype="multipart/form-data"  >> 문자형태로 넘어가지 않고 String type으로 넘어간다  
						 String type으로 넘어왔으니 서버에서 받지 못한다. 
					-->					
						<table class="board_write">
							<tr>
								<th>제목</th>
								<td><input type="text" name="btitle" id="btitle"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="bcontent"></textarea></td>
							</tr>
							<tr>
								<th>파일</th>
								<td><input type="file" name="bfile"></td>
							</tr>
							<tr>
								<td colspan=2>
									<button type="submit" id="btnBoardWrite">등록하기</button>
									<button type="reset">다시쓰기</button>
									<a href="board_list.jsp"><button type="button">목록으로</button></a>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</section>
		</div>
		<!-- footer 추가 -->		
		<!-- 상대경로만 가능하다 -->
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>