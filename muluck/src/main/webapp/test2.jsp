<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*"%>
<%
	Date date = new Date();
SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy.MM.dd.");
String strdate = simpleDate.format(date);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>무우럭</title>
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" type="text/css" rel="stylesheet" />
<style>
div {
	text-align: center;
}

.grid-container {
	display: grid;
	grid-template-areas: 'a a a a a'
						 'b . c c c' 
						 'b . c c c'
						 'd e e e .';
	grid-template-rows: repeat(4, 1fr);
	grid-template-columns: repeat(5, 1fr);
	height: 350px;
	background-color: #ccc;
	border: 3px solid;
	border-radius: 44px;
}

.a {
	grid-area: a;
}

.b {
	grid-area: b;
}

.c {
	grid-area: c;
}

.d {
	grid-area: d;
}

.e {
	grid-area: e;
}

#outer-grid {
	display: grid;
	grid-template-columns: 1fr;
	grid-gap: 8px;
	border: 3px solid;
	border-radius: 44px;
}

#outer-grid>div {
	background-color: #eaf2df;
	border-radius: 44px;
	font-size: 4vw;
	padding: 8px;
}

#inner-grid {
	display: grid;
	grid-template-columns: 650px;

}

#inner-grid>div {
	background: #eaf2df;
	border: 4px solid;
	border-radius: 44px;
	padding: 8px;
}
</style>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light" id="mainNav2">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="../main/home.jsp">Muluck</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto py-4 py-lg-0">
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
						href="../main/test">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
						href="index.jsp">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<header>
		<h1 class="site-heading text-center text-faded d-none d-lg-block">
			<!-- <span class="site-heading-lower">무우럭</span>
                <span class="site-heading-upper text-primary mb-3">muluck</span> -->
			<div>
				<img src="resources/assets/img/무우럭.png" />
			</div>
		</h1>
	</header>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
		<div class="container">
			<a class="navbar-brand text-uppercase fw-bold d-lg-none"
				href="index.jsp">Start Bootstrap</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="../main/home.jsp">홈</a></li>
					<ul class="navbar-nav px-lg-4">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 커뮤니티 </a>
							<ul class="dropdown-menu dropdown-menu-dark">
								<li><a class="dropdown-item" href="#">자유게시판</a></li>
								<li><a class="dropdown-item" href="#">자랑게시판</a></li>
								<li><a class="dropdown-item" href="#">질문게시판</a></li>
								<li><a class="dropdown-item" href="#">오픈채팅방</a></li>
							</ul></li>
					</ul>
					<ul class="navbar-nav px-lg-4">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="myplant.jsp" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 나의 식물 </a>
							<ul class="dropdown-menu dropdown-menu-dark">
								<li><a class="dropdown-item" href="#">식물 일지</a></li>
								<li><a class="dropdown-item" href="card_main.jsp">반려식물
										등록증</a></li>
							</ul></li>
					</ul>
					<ul class="navbar-nav px-lg-4">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="myplant.jsp" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 상점 </a>
							<ul class="dropdown-menu dropdown-menu-dark">
								<li><a class="dropdown-item" href="#">나눔</a></li>
								<li><a class="dropdown-item" href="#">거래</a></li>
							</ul></li>
					</ul>
				</ul>
			</div>
		</div>
	</nav>

	<div class="grid-container col-xl-4 col-lg-10 mx-auto">
		<div class="grid-item a">
			<h4>
				<b>반려식물 등록증</b>
			</h4>
		</div>
		<div class="grid-item b">
			<h5>
				이름<br><br> 종류<br><br> 반려일<br><br> MMTI<br>
			</h5>
		</div>
		<div class="grid-item c">
			<img src="resources/assets/img/무럭이.png" width=200 height=200>
		</div>
		<div class="grid-item d">
			<img src="resources/assets/img/무럭무럭.png" width=70 height=70>
		</div>
		<div class="grid-item e">
			<h4>
				2023.05.20.<br>무우럭마을 무럭무럭
			</h4>
		</div>
	</div>

	<section class="page-section about-heading">
		<div class="container">
			<div class="about-heading-content">
				<div class="row">
					<div class="col-xl-7 col-lg-7 mx-auto">
						<div id="outer-grid" class="bg-faded p-4">
							<div id="inner-grid">
								<h3 class="section-heading" style="text-align: center;">
								<b>반려식물 등록증이 발급되었어요.</b>
									<!-- <span class="section-heading-lower">반려식물 등록증이 발급되었어요.</span> -->
								</h3>
								<div class="grid-container">
									<div class="grid-item a">
										<h4>
											<b>반려식물 등록증</b>
										</h4>
									</div>
									<div class="grid-item b">
										<h5>
											이름<br><br> 종류<br><br> 반려일<br><br> MMTI<br><br>
										</h5>
									</div>
									<div class="grid-item c">
										<img src="resources/assets/img/무럭이.png" width=230 height=230>
									</div>
									<div class="grid-item d">
									<br><img src="resources/assets/img/무럭무럭.png" width=70 height=70>
									</div>
									<div class="grid-item e">		
											<br><h4>
												2023.05.20.<br>무우럭마을 무럭무럭
											</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>