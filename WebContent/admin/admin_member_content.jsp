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
					<h1>회원관리</h1>
					<table class="notice_content">
						<tr>
							<th>이름</th>
							<td>홍길동</td>
							<th>연락처</th>
							<td>010-1234-1234</td>
							<th>가입날짜</th>
							<td>2019-09-24</td>
							<th>회원등급</th>
							<td>Diamond</td>
						</tr>
						<tr>
							<th>주소</th>
							<td colspan=7 style=text-align:left;padding-left:5px;>
								서울시 강남구 역삼동 1234 한독빌딩 8F
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td colspan=7 style=text-align:left;padding-left:5px;>
								test@test.com
							</td>
						</tr>
						<tr>
							<th>관심분야</th>
							<td colspan=7 style=text-align:left;padding-left:5px;>
								이것저것..
							</td>
						</tr>
						<tr>
							<th>자기소개</th>
							<td colspan=7 style=text-align:left;padding-left:5px;>
								홍길동 입니다.
							</td>
						</tr>
						<tr>
							<td colspan=8>
								<a href="admin_member_list.jsp"><button type="button">목록으로</button></a>
								<a href="admin.jsp"><button type="button">관리자홈</button></a>
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