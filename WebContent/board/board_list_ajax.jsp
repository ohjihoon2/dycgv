<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/dycgv/css/dycgv.css">
<script src="http://localhost:9090/dycgv/js/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function(){
		var title = "<tr><th>번호</th><th>제목</th><th>등록일</th><th>조회수</th></tr>";
		$("table.board_list").append(title);
		
		$.ajax({
			url:"board_list_ajax_process.jsp?",
			success:function(data){
				var obj =  JSON.parse(data);
				
				for(i=0;i<obj.list.length;i++){
					var content = "<tr><td>"
													+obj.list[i].rno+"</td><td>"
													+obj.list[i].btitle+"</td><td>"
													+obj.list[i].bdate+"</td><td>"
													+obj.list[i].bhit+"</td></tr>";
					$("table.board_list").append(content);
				}
				var footer = "<tr><td colspan=4>[이전] 1 2 3 4 5 [다음]</td></tr>";
				$("table.board_list").append(footer);
			}
		});
	});
</script>
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