<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>나의 활동</title>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="../resources/css/myPage.css">
<script type="text/javascript">

	function fillInputValue(input) {
		if (input.value === '') {
		  input.value = "${info.member_nickname}";
		}
	}

	function clearInputValue(input) {
		if (input.value === "${info.member_nickname}") {
		  input.value = '';
		}
	}
	
	//선택된 이미지로 show_img가 바뀌게 하기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#show_img').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
 	//이미지 삭제
  	function deleteImage() {
 		$('#show_img').attr('src', '../resources/upload/profile/myprofile.png');
        //$('#file').value('C:\\Users\\LG\\Documents\\workspace-sts-3.9.14.RELEASE\\muluck\\src\\main\\webapp\\resources\\upload\\profile\\myprofile.png');
		$('#file').val('');
		$('#member_img').val("myprofile.png");
    }
	
	$(function() {
  
/* 	    // del_img 버튼을 부르면 show_img 부분이 기본이미지로 바뀌게 하기
		$('#del_img').click(function() {
			$('#show_img').attr('src', '../resources/upload/profile/myprofile.png');
	        $('#file').val('');
		}); */
	    
		//이전 패스워드가 정확하지 않다고 알림
	    $('#before_pw').blur(function() {
	        const beforePw = document.getElementById("before_pw").value;
	        const memberPw = "${info.member_pw}";

	        if (beforePw !== memberPw) {
	            $("#pwCheck").html("패스워드를 정확하게 입력해주세요.").css('color', 'red');
	            return false; // 폼 제출 중지
	        } else {
	            $("#pwCheck").html("");
	        }
	    });
	    
	    //이전 패스워드와 일치하지 않으면 수정 불가
	    $('#revise_up').submit(function(event) {
	        const beforePw = document.getElementById("before_pw").value;
	        const memberPw = "${info.member_pw}";

	        if (beforePw !== memberPw) {
	            event.preventDefault(); // Prevent form submission
	            $("#pwCheck").html("이전패스워드가 정확하지 않아 수정이 불가 합니다.").css('color', 'red');
	        } else {
	            $("#pwCheck").html("");
	        }
	    });
	    
	});
	
</script>
 <!-- 토글 - 드롭다운 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../resources/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
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

	<!-- 마이페이지 회원정보 -->
	<div id="my" style="display: flex; justify-content: space-between;">
		<!-- 메뉴카테고리 -->
		<div id="my_menu" style="flex: 2;">
			<div class="menu_list" id="menu_title">
				<a class="menu"
					style="color: #145f37; font-weight: 900; text-decoration: none; font-size: 24px;">
					마이페이지 </a>
			</div>
			<div class="menu_list">
				<a class="menu" href="${pageContext.request.contextPath}/member/mypage"
					style="text-decoration: none; font-weight: 500; font-size: 20px;">
					회원 정보 </a>
			</div>
			<div class="menu_list">
				<a class="menu" href="${pageContext.request.contextPath}/member/myActivity"
					style="text-decoration: underline; font-weight: bolder; background: lightgray; font-size: 20px;">
					나의 활동 </a>
			</div>
			<div class="menu_list">
				<a class="menu" href="bbs4"
					style="text-decoration: none; font-weight: 500; font-size: 20px;">
					팔로우 </a>
			</div>
		</div>
		<div id="my_screen" style="flex: 8; display: flex; flex-direction: column;">
			
			
			
		</div>
	</div>

</body>
</html>



