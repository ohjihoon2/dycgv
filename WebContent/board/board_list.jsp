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
					<div class="board_list_btn1">
						<a href="board_write.jsp"><button type="button">글쓰기</button></a>
					</div>
					<table class="board_list">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
						<tr>
							<td>1</td>
							<td><a href="board_content.jsp">사용자 게시판 테스트</a></td>
							<td>2019-09-24</td>
							<td>450</td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href="board_content.jsp">일부 주차장 이용 불가</a></td>
							<td>2019-09-24</td>
							<td>450</td>
						</tr>
						<tr>
							<td>3</td>
							<td><a href="board_content.jsp">일부 주차장 이용 불가</a></td>
							<td>2019-09-24</td>
							<td>450</td>
						</tr>
						<tr>
							<td>4</td>
							<td><a href="board_content.jsp">일부 주차장 이용 불가</a></td>
							<td>2019-09-24</td>
							<td>450</td>
						</tr>
						<tr>
							<td>5</td>
							<td><a href="board_content.jsp">일부 주차장 이용 불가</a></td>
							<td>2019-09-24</td>
							<td>450</td>
						</tr>
						<tr>
							<td>6</td>
							<td><a href="board_content.jsp">일부 주차장 이용 불가</a></td>
							<td>2019-09-24</td>
							<td>450</td>
						</tr>
						<tr>
							<td>7</td>
							<td><a href="board_content.jsp">일부 주차장 이용 불가</a></td>
							<td>2019-09-24</td>
							<td>450</td>
						</tr>
						<tr>
							<td>8</td>
							<td><a href="board_content.jsp">일부 주차장 이용 불가</a></td>
							<td>2019-09-24</td>
							<td>450</td>
						</tr>
						<tr>
							<td>9</td>
							<td><a href="board_content.jsp">일부 주차장 이용 불가</a></td>
							<td>2019-09-24</td>
							<td>450</td>
						</tr>
						<tr>
							<td>10</td>
							<td><a href="board_content.jsp">일부 주차장 이용 불가</a></td>
							<td>2019-09-24</td>
							<td>450</td>
						</tr>
						<tr>
							<td colspan=4>[이전] 1 2 3 4 5 [다음]</td>
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