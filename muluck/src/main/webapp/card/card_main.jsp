<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
								<li><a class="dropdown-item" href="../card/card.jsp">반려식물
										등록증</a></li>
								<li><a class="dropdown-item" href="#">MMTI 테스트</a></li>
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
	<form action="../card/card_detail.jsp" method="get">
		<h3 class="section-heading" style="text-align: center;">
			<b>반려식물 등록증을 만들어 보세요</b>
		</h3>
		<button type="submit" class="btn"
			style="float: right; background-color: #145f37; border-color: none; color: #eaf2df;">
			<b>등록</b>
		</button>
		<br>
	</form>
	<a href="list">모든 게시글 가져오기</a>
	<c:forEach items="${list}" var="bag">
		<div style="float: center;">
			<button type="submit" class="btn"
				style="background-color: #145f37; border-color: none; color: #eaf2df;">
				<b>자랑하기</b>
			</button>
			<button type="submit" class="btn" onclick="clip(); return false;"
				style="background-color: #145f37; border-color: none; color: #eaf2df;">
				<b>주소 복사하기</b>
			</button>
			<button type="submit" class="btn" onclick="location='card_main.jsp'"
				style="background-color: #145f37; border-color: none; color: #eaf2df;">
				<b>전체 목록</b>
			</button>
		</div>
		<br>
		<section class="page-section about-heading">
			<div class="container">
				<div class="about-heading-content">
					<div class="row">
						<div class="parent-container mx-auto">
							<div class="bg-faded p-4"
								style="border: 3px solid; border-radius: 44px;">
								<h3 class="section-heading" style="text-align: center;">
									<b>반려식물 등록증이 발급되었어요.</b>
								</h3>
								<div class="grid-container">
									<div class="grid-item a">
										<h4>
											<b>반려식물 등록증</b>
										</h4>
									</div>
									<div class="grid-item b">
										<h5>
											이름 : ${cardVO.card_name}<br> <br> 종류 :
											${cardVO.card_species} <br> <br> 반려일 :
											${cardVO.card_birth}<br> <br> MMTI :
											${cardVO.card_mmti}<br> <br> <br>
										</h5>
									</div>
									<div class="grid-item c">
										<img src="../resources/upload/${savedName}" width=200
											height=200>
									</div>
									<div class="grid-item d">
										<br> <img src="../resources/assets/img/무럭무럭.png" width=70
											height=70>
									</div>
									<div class="grid-item e">
										<br>
										<h4 style="text-align: center;"><%=strdate%><br>무우럭마을
											무럭무럭
										</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</c:forEach>
</body>
</html>