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
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
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
				<img src="../resources/assets/img/무우럭.png" style="margin-left: auto; margin-right: auto; display: block;"/>
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
         <!-- Services-->	
       
		 <section id="scroll">
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6 order-lg-2">
                        <div class="p-5"><img src="../resources/assets/img/mt.png" alt="죄송합니다. 오류로 인해 사진을 띄우지 못했습니다." /></div>
                    </div>
                    <div class="col-lg-6 order-lg-1">
                        <div class="p-5">
                            <h5 class="display-4"> MMTI 특별해지는 우리사이!</h5>
                            반려식물과 교감하는 사람들의 커뮤니티 무우럭</p>
							
                        </div>
					<div class="intro-button mx-auto"><a class="btn btn-primary btn-xl" href="../mmti/mmti_main.jsp" style="color : #fff;">MMTI 바로가기</a></div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Content section 2-->
        <section>
            <div class="container px-5" style="background-color:#EAF2DF ">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6">
                        <div class="p-5"><img src="../resources/assets/img/CM.png" alt="죄송합니다. 오류로 인해 사진을 띄우지 못했습니다." /></div>
                    </div>
                   <div class="col-lg-6">
                        <div class="p-5">
                           <!--    <h4 class="display-4">식물 자랑, 고민거리 모두 여기서!</h4>
                            서로의 경험을 공유하고 문제를 해결하며 함께 성장하는
							무우럭.</p>--> 
						<img src="../resources/assets/img/CM2.png" alt="죄송합니다. 오류로 인해 사진을 띄우지 못했습니다." /></div>
                        <div class="intro-button mx-auto"><a class="btn btn-primary btn-xl" href="../community/community.jsp" style="color : #fff;">커뮤니티 바로가기</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Content section 3-->
        <section>
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6 order-lg-2">
                        <div class="p-5"><img src="../resources/assets/img/B.png" alt="죄송합니다. 오류로 인해 사진을 띄우지 못했습니다." /></div>
                    </div>
                    <div class="col-lg-6 order-lg-1">
                        <div class="p-5">
                            <h2 class="display-4">필요로 하는 것들, 모두 여기서!</h2>
							함께 나누는 사람들의 커뮤니티 
							무우럭</p>
                        </div>
                        <div class="intro-button mx-auto"><a class="btn btn-primary btn-xl" href="../business/business_main.jsp" style="color : #fff;">나눔 바로가기</a></div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Content section 4-->
        <section>
            <div class="container px-5" style="background-color:#EAF2DF ">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6">
                        <div class="p-5"><img src="../resources/assets/img/diary.png" alt="죄송합니다. 오류로 인해 사진을 띄우지 못했습니다." /></div>
                    </div>
                    <div class="col-lg-6">
                        <div class="p-5">
                            <h2 class="display-4" style="color : #3a6351;">내 식물일지 또한 이곳에서!</h2>
                            식물에 성장을 기록하는 커뮤니티 
							무우럭입니다.</p>
                        </div>
                        <div class="intro-button mx-auto"><a class="btn btn-primary btn-xl" href="../diary/diary.jsp" style="color : #fff;">일지 바로가기</a></div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>