<%@page import="com.sun.jmx.snmp.InetAddressAcl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>식물 일지</title>
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
        <%@ include file="diary_header.jsp"%>
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
					id="#userNickname">${member_nickname} 님 환영합니다.</a></li>
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
						href="${pageContext.request.contextPath}/member/mypage">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
						href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<header>
		<h1 class="site-heading text-center text-faded d-none d-lg-block">
			<!-- <span class="site-heading-lower">무우럭</span>
                <span class="site-heading-upper text-primary mb-3">muluck</span> -->
			<div>
				<a href="../main/home.jsp">
				<img src="../resources/assets/img/무우럭.png" /></a>
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
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="../community/community.jsp">커뮤니티</a></li>
					<ul class="navbar-nav px-lg-4">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="myplant.jsp" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 나의 식물 </a>
							<ul class="dropdown-menu dropdown-menu-dark">
								<li><a class="dropdown-item" href="../diary/calendar.jsp">캘린더</a></li>
								<li><a class="dropdown-item" href="../diary/cardview.jsp">식물 일지</a></li>
								<li><a class="dropdown-item" href="../card/list">반려식물 등록증</a></li>
								<li><a class="dropdown-item" href="../mmti/mmti_main.jsp">MMTI 테스트</a></li>
							</ul></li>
					</ul>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="../business/business_main.jsp">거래/나눔</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<section class="page-section about-heading" id="text">
		<div class="container">
			<div class="row">
				<div class="photo">
					<img class="photo_preview" id="preview" src="" onerror="this.src='../resources/img/mulucklogo.jpg';" />
					<input multiple="multiple" type="file" name="file" onchange="readURL(this)">
					<ul class="navbar-nav px-lg-4">
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 식물 기분 </a>
							<ul class="dropdown-menu dropdown-menu-dark">
								<a class="dropdown-item" id="feel1" type="checkbox">&#x1F601 좋아요!</a>
								<a class="dropdown-item" id="feel1" type="checkbox">&#x1F614 화나요</a>
								<a class="dropdown-item" id="feel1" type="checkbox">&#x1F62D 슬퍼요</a>
								<a class="dropdown-item" id="feel1" type="checkbox">그냥그래!</a>
							</ul></li>
					</ul>
				</div>
				<div class="bg-faded rounded p-5">
						<div class="weather" id="weather">
							<span></span>
							<span></span>
						</div>
					<form action="insert" method="get">
					<h2 class="section-heading mb-4">
						<span class="section-heading-lower">
						<div id="feel"><input type="hidden" name="d_mood"></div>
						<input class="diary_title" name="d_title" type="text" value="일기 제목 쓰세요" onfocus="this.value=''"></span>
					</h2>
					<p><input class="diary_contents" type="text" name="d_contents" value="일기 내용 쓰세요" onfocus="this.value=''"></p>
					<input  type="hidden" name="member_no" value="1">
					<button class="button">등록</button>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>