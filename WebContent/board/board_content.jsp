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
					<table class="board_content">
						<tr>
							<th>제목</th>
							<td>일부 자동차 이용불가 안내</td>
							<th>등록일</th>
							<td>2019-09-24</td>
							<th>조회수</th>
							<td>450</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan=5>
								<p>안녕하십니까, CGV부평입니다. 
								
								항상 CGV부평을 방문해주시는 고객님들께 깊은 감사의 말씀을 드립니다.
								
								영화관이 있는 건물 내 3층 주차장 보수 공사로 인해 일부 주차장 이용이 불가한점을 안내 드립니다.
								
								- 기간 : 9/24 ~ 10/2   (9/28,29일(토,일) 임시로 이용가능)
								- 내용 : 3층 옥외 주차장 방수 보수공사 진행
								
								           영화관을 이용하는 고객님들께서는 1층 및 제2 주차장을 이용해주시기 바랍니다.
								
								항상 고객을 먼저 생각하는 CGV부평이 되도록 노력하겠습니다.
								감사합니다.
								</p> 
							</td>
						</tr>
						<tr>
							<td colspan=6>
								<a href="board_update.jsp"><button type="button">수정하기</button></a>
								<a href="board_delete.jsp"><button type="button">삭제하기</button></a>
								<a href="board_list.jsp"><button type="button">목록으로</button></a>
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