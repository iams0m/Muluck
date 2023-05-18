<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="../resources/css/styles.css" type="text/css"
	rel="stylesheet" />
<style>
div {
	text-align: center;
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
				<img src="../resources/assets/img/무우럭.png" />
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
	<div id="total">
		<div id="center">
			<form action="insert" id="form" method="post"
				enctype="multipart/form-data">
				<h3 style="text-align: center;">반려식물 등록증 페이지</h3>
				<hr color="grey">
				<div class="mb-3 row">
					<label class="col-sm-2 col-form-label">반려식물 이름</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="card_name"
							placeholder="반려식물 이름을 입력해주세요">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2 col-form-label">이미지</label>
					<div class="col-sm-3">
						<input class="form-control" type="file" name="card_img"
							id="formFile">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2 col-form-label">종</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="card_species"
							placeholder="어떤 종인가요?">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2 col-form-label">반려일</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="card_birth"
							placeholder="yyyy-mm-dd">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2 col-form-label">MMTI</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="card_mmti"
							placeholder="반려식물 MMTI를 입력해주세요">
					</div>
				</div>
					<label class="col-sm-5 col-form-label">*MMTI : 무우럭에서 제공하는 반려식물 성향 유형이에요! 지금 바로 테스트해보세요</label>
				<button type="submit" class="btn btn-secondary">MMTI 테스트</button><br>
				<button type="submit" class="btn btn-secondary"
					style="float: right;">등록</button>
			</form>
		</div>
	</div>
</body>
</html>