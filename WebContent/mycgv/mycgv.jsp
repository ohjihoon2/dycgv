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
					<h1>마이 CGV</h1>
					<div class="mycgv">
						<span>회원정보 수정</span>
						<span>예매이력 확인</span>
					</div>
				</div>
			</section>
		</div>
		<!-- footer 추가 -->		
		<!-- 상대경로만 가능하다 -->
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>