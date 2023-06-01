<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!-- 팝업창 -->
<title>반려식물 등록증</title>
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
<!-- Bootstrap core JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

<style>
div {
	text-align: center;
}

.btn {
	background-color: #145f37;
	border-color: none;
	color: #eaf2df;
	font-weight: bold;
}

.parent-container {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 600px;
	height: 260px;
}

.grid-container {
	display: grid;
	grid-template-areas: 'a a a a a' 'b b c c c' 'b b c c c' '. . c c c'
		'd e e e .';
	grid-template-rows: repeat(5, 1fr);
	grid-template-columns: repeat(5, 1fr);
	width: 650px;
	height: 370px;
	background-color: #eaf2df;
	border: 4px solid;
	border-radius: 44px;
	align-items: flex-start;
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

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 400px;
}

.modal-content h2 {
	margin-top: 0;
}

.modal-content p {
	margin-bottom: 20px;
}

.modal-content button {
	background-color: #145f37;
	border: none;
	color: #eaf2df;
	padding: 10px 20px;
	font-weight: bold;
	cursor: pointer;
}

.modal-content button:hover {
	background-color: #0c4025;
}
</style>
<script type="text/javascript">
	function showModal(title, message) {
		var modal = document.createElement("div");
		modal.classList.add("modal");

		var modalContent = document.createElement("div");
		modalContent.classList.add("modal-content");

		var modalTitle = document.createElement("h2");
		modalTitle.textContent = title;

		var modalMessage = document.createElement("p");
		modalMessage.textContent = message;

		var closeButton = document.createElement("button");
		closeButton.textContent = "닫기";
		closeButton.addEventListener("click", function() {
			closeModal();
		});

		// 요소들을 모달에 추가
		modalContent.appendChild(modalTitle);
		modalContent.appendChild(modalMessage);
		modalContent.appendChild(closeButton);
		modal.appendChild(modalContent);

		// 모달을 페이지에 추가
		document.body.appendChild(modal);

		// 모달을 표시
		modal.style.display = "block";
	}

	var copyButton = document.querySelector(".copy_btn");
	copyButton.addEventListener("click", function() {
		copyUrl();
	});

	function copyUrl() {
		let tmp = document.createElement('input');
		let url = window.location.href;

		document.body.appendChild(tmp);
		tmp.value = url;
		tmp.select();
		document.execCommand("copy");
		document.body.removeChild(tmp);

		showModal("알림", "URL이 복사되었습니다.");
	}

	function closeModal() {
		var modal = document.querySelector(".modal");
		modal.style.display = "none";
	}

	// 닫기 버튼에 대한 처리
	function closeModal() {
		var modal = document.querySelector(".modal");
		if (modal) {
			modal.style.display = "none";
			document.body.removeChild(modal);
		}
	}
</script>


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
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="../main/community.jsp">커뮤니티</a></li>
					<ul class="navbar-nav px-lg-4">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="myplant.jsp" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 나의 식물 </a>
							<ul class="dropdown-menu dropdown-menu-dark">
								<li><a class="dropdown-item" href="#">식물 일지</a></li>
								<li><a class="dropdown-item" href="list">반려식물
										등록증</a></li>
								<li><a class="dropdown-item" href="../mmti/mmti_main.jsp">MMTI
										테스트</a></li>
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
	<br>
	<div style="float: center;">
		<button type="submit" class="btn">자랑하기</button>
		<button type="submit" class="copy_btn btn"
			onclick="javascript:copyUrl()">주소 복사하기</button>
		<button type="submit" class="btn" onclick="location='list'">전체
			목록</button>
	</div>
	<br>
	<div style="float: right;">

		<a role="button" class="btn" href="card_update?card_no=${bag.card_no}">수정</a>
		<a onclick="return confirm('정말 등록증을 삭제하실건가요? :(')"
			href="delete?card_no=${bag.card_no}" role="button" class="btn">삭제</a>
	</div>
	<br>
	<section class="page-section about-heading">
		<div class="container">
			<div class="about-heading-content">
				<div class="row">
					<div class="parent-container mx-auto">
						<div class="bg-faded p-4"
							style="border: 3px solid; border-radius: 44px;">
							<b style="float: left;">NO : <fmt:formatDate
									value="${bag.card_birth}" pattern="yyyyMMdd" /> -
								${bag.card_no}
							</b>
							<div class="grid-container">
								<div class="grid-item a">
									<h4>
										<b>반려식물 등록증</b>
									</h4>
								</div>
								<div class="grid-item b">
									<h5>
										이름 : ${bag.card_name}<br> <br> 종류 :
										${bag.card_species} <br> <br> 반려일 :
										${bag.card_birth}<br> <br> MMTI : ${bag.card_mmti}<br>
										<br> <br>
									</h5>
								</div>
								<div class="grid-item c">
									<img src="../resources/upload/${bag.card_img}" width=200
										height=200>
								</div>
								<!-- <div class="grid-item d">
									<br> <img src="../resources/assets/img/무럭무럭.png" width=70
										height=70>
								</div> -->
								<div class="grid-item d">
									<br> <img src="../resources/assets/img/무럭무럭.png" width=70
										height=70>
								</div>
								<div class="grid-item e">
									<br>
									<h4>
										<fmt:formatDate value="${bag.card_date}" pattern="yyyy-MM-dd" />
										<br>무우럭마을 무럭무럭
									</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="modal">
		<div class="modal-content">
			<h2>모달 제목</h2>
			<p>모달 내용</p>
			<button id="modal-close-btn">닫기</button>
		</div>
	</div>
</body>
</html>