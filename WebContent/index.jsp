<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CGV에 오신것을 환영합니다.</title>
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/dycgv/css/dycgv.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/dycgv/css/index_carousel.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
		<!-- header 추가 -->
		<jsp:include page="header.jsp"></jsp:include>
		<div id="content">
			<section>
				<img alt="" src="http://localhost:9090/dycgv/images/section1_img01.jpg">
				<div>
					<!-- <h1>캐러셀 추가 부분</h1>
					<img alt="" src="http://localhost:9090/dycgv/images/15675941245740.jpg"> -->
					<article>
						<div id="demo" class="carousel slide" data-ride="carousel">

						  <!-- Indicators -->
				  			<ul class="carousel-indicators">
							    <li data-target="#demo" data-slide-to="0" class="active"></li>
							    <li data-target="#demo" data-slide-to="1"></li>
							    <li data-target="#demo" data-slide-to="2"></li>
							    <li data-target="#demo" data-slide-to="3"></li>
						  	</ul>
						  
						  <!-- The slideshow -->
				  			<div class="carousel-inner">
						    	<div class="carousel-item active">
							      <img src="http://localhost:9090/dycgv/images/15675941245740.jpg" alt="Los Angeles" width="90%" height="500">
							    </div>
							    <div class="carousel-item">
							      <img src="http://localhost:9090/dycgv/images/mainbig_new_1.jpg" alt="Chicago" width="90%" height="500">
							    </div>
							    <div class="carousel-item">
							      <img src="http://localhost:9090/dycgv/images/mainbig_new_2.jpg" alt="New York" width="90%" height="500">
							    </div>
							    <div class="carousel-item">
							      <img src="http://localhost:9090/dycgv/images/15689608448190.jpg" alt="New York" width="90%" height="500">
							    </div>
						  	</div>
						  
						  <!-- Left and right controls -->
					  		<a class="carousel-control-prev" href="#demo" data-slide="prev">
						    <span class="carousel-control-prev-icon"></span>
				 	 		</a>
						  	<a class="carousel-control-next" href="#demo" data-slide="next">
						    	<span class="carousel-control-next-icon"></span>
						  	</a>
						</div>					
					</article>
				</div>
			</section>
			
			<section>
				<img alt="" src="http://localhost:9090/dycgv/images/h3_movie_selection.gif">
				<div>
					<iframe width="650" height="350" src="https://www.youtube.com/embed/1OJZSa5258A" 
					frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
					allowfullscreen></iframe>
					<img width="320" height="350" src="http://localhost:9090/dycgv/images/PCM20190904000063980_P2.jpg">
				</div>
				
			</section>
			
			<section>
				<img alt="" src="http://localhost:9090/dycgv/images/h3_event.gif">
				<article>
					<img alt="" src="http://localhost:9090/dycgv/images/15686318665410.jpg">
					<img alt="" src="http://localhost:9090/dycgv/images/15686321023690.jpg">
					<img alt="" src="http://localhost:9090/dycgv/images/15675942615330.jpg">
					<img alt="" src="http://localhost:9090/dycgv/images/15686318665260.jpg">
				</article>
				<article>
					<img alt="" src="http://localhost:9090/dycgv/images/15677499283840.jpg">
					<img alt="" src="http://localhost:9090/dycgv/images/main_moviecollage.jpg">
					<img alt="" src="http://localhost:9090/dycgv/images/0902_226x259.jpg">
				</article>
			</section>
		</div>
		<!-- footer 추가 -->		
		<!-- 상대경로만 가능하다 -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>