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
<link href="../resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light" id="mainNav2">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="index.jsp">Muluck</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto py-4 py-lg-0">
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
						href="index.jsp">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
						href="index.jsp">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<header>
		<h1 class="site-heading text-center text-faded d-none d-lg-block">
			<img src="../resources/assets/img/무우럭.png" />
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
						class="nav-link text-uppercase" href="home.jsp">홈</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="community.jsp">커뮤니티</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="myplant.jsp">나의 식물</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="store.jsp">거래</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<section class="page-section about-heading">
		<div class="container">
			<div class="about-heading-content">
				<div class="row">
					<div class="col-xl-9 col-lg-10 mx-auto">
						<div class="bg-faded rounded p-5">
							<h3 class="section-heading mb-4" style="text-align: center;">
								<span class="section-heading-upper">반려식물 등록증 페이지</span> <span
									class="section-heading-lower">About Our Cafe</span>
							</h3>
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
										<input class="form-control" type="file" name="file"
											id="formFile">
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-2 col-form-label">반려식물 종류</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" name="card_species"
											placeholder="어떤 종인가요?">
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-2 col-form-label">반려일</label>
									<div class="col-sm-3">
										<input type="date" class="form-control" name="card_birth"
											data-placeholder="날짜 선택" required aria-required="true"
											value={startDateValue} className={styles.selectDay}
											onChange={StartDateValueHandler}>
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-2 col-form-label">MMTI</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" name="card_mmti"
											placeholder="반려식물 MMTI를 입력해주세요">
									</div>
								</div>
								<label class="col-sm-5 col-form-label">*MMTI : 무우럭에서
									제공하는 반려식물 성향 유형이에요! 지금 바로 테스트해보세요</label>
								<button type="submit" class="btn btn-secondary">MMTI
									테스트</button>
								<br>
								<button type="submit" class="btn btn-secondary"
									style="float: right;">만들기</button>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer class="footer text-faded text-center py-5">
		<div class="container">
			<p class="m-0 small">Copyright &copy; Your Website 2023</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
</body>
</html>
