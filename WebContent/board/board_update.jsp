<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<h1>게시판</h1>
					<table class="board_write">
						<tr>
							<th>제목</th>
							<td><input type="text" name="btitle" value="사용자 게시판 테스트~"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="bcontent" >사용자 게시판 테스트~</textarea></td>
						</tr>
						<tr>
							<th>파일</th>
							<td><input type="file" name="bfile"></td>
						</tr>
						<tr>
							<td colspan=2>
								<a href="#"><button type="button">수정완료</button></a>
								<button type="reset">취소하기</button></a>
								<a href="board_list.jsp"><button type="button">목록으로</button></a>
								<a href="board_content.jsp"><button type="button">이전페이지</button></a>
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