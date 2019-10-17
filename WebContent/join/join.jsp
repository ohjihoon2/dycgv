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
				<h1>회원가입</h1>
				<form action="joinProcess.jsp" method="post" class="join" name="joinForm">
					<ul>
						<li>
							<label>아이디</label>
							<input type="text" name="id" id= "id">
							<button type="button">중복확인</button>
						</li>
						<li>
							<label>이름</label>
							<input type="text" name="name" id="name">
						</li>
						<li>
							<label>성별</label>
							<input type="radio" name="gender" class ="gender" value="M">남자
							<input type="radio" name="gender" class ="gender" value="F">여자
						</li>
						<li>
							<label>암호</label>
							<input type="password" name="pass" id ="pass">
						</li>
						<li>
							<label>암호확인</label>
							<input type="password" name="cpass" id ="cpass">
							<span id="passCheckResult"></span>
						</li>
						<li>
							<label>이메일</label>
							<input type="text" name="email1" id ="email1">
							@<input type="text" name="email2" id ="email2">
							<select name="email3" id ="email3">
								<option>선택하세요</option>
								<option>naver.com</option>
								<option>gmail.com</option>
								<option>daum.net</option>
							</select>
						</li>
						<li>
							<label>주소</label>
							<input type="text" name="addr" id ="addr">
							<button type="button">주소찾기</button>
						</li>
						<li>
							<label>휴대폰</label>
							<div>
								<input type="radio" name="phone_comp" class ="phone_comp" value="SKT">SKT
								<input type="radio" name="phone_comp" class ="phone_comp" value="KT">KT
								<input type="radio" name="phone_comp" class ="phone_comp" value="LGU+">LGU+
							</div>	
							<div>
								<select name="phone_number1" id ="phone_number1">
									<option>010</option>
									<option>011</option>
									<option>017</option>						
								</select>
								- <input type="text" name="phone_number2" id ="phone_number2">
								- <input type="text" name="phone_number3" id ="phone_number3">
							</div>			
						</li>
						<li>
							<label>관심</label>
							<input type="checkbox" name="hobby" class ="hobby" value="쇼핑">쇼핑
							<input type="checkbox" name="hobby" class ="hobby" value="게임">게임
							<input type="checkbox" name="hobby" class ="hobby" value="여행">여행
							<input type="checkbox" name="hobby" class ="hobby" value="기타">기타
						</li>
						<li>
							<label>자기소개</label>
							<textarea name="intro" id ="intro"></textarea>
						</li>
						<li>
							<button type="submit" id="btnJoin">확인</button>
							<button type="reset">다시입력</button>
						</li>			
					</ul>
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