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
				<a href="../main/home.jsp"><img
					src="../resources/assets/img/무우럭.png" /></a>
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
								<li><a class="dropdown-item" href="#">반려식물 등록증</a></li>
							</ul></li>
					</ul>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="../plant/plant.jsp">식물
							도감</a></li>
					<ul class="navbar-nav px-lg-4">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="myplant.jsp" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 상점 </a>
							<ul class="dropdown-menu dropdown-menu-dark">
								<li><a class="dropdown-item" href="#">나눔</a></li>
								<li><a class="dropdown-item" href="#">거래</a></li>
							</ul>
						</li>
					</ul>
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
				<a class="menu" href=""${pageContext.request.contextPath}/member/mypage""
					style="text-decoration: underline; font-weight: bolder; background: lightgray; font-size: 20px;">
					회원 정보 </a>
			</div>
			<div class="menu_list">
				<a class="menu" href="../member/myActivity.jsp"
					style="text-decoration: none; font-weight: 500; font-size: 20px;">
					나의 활동 </a>
			</div>
			<div class="menu_list">
				<a class="menu" href="bbs4"
					style="text-decoration: none; font-weight: 500; font-size: 20px;">
					팔로우 </a>
			</div>
		</div>
		<div id="my_screen"
			style="flex: 8; display: flex; flex-direction: column;">
			<div id="my_info" style="flex: 9; display: flex;">
				<div id="my_profile" style="flex: 1; margin-right: 10px;">
					<form action="profile_up" method="post" enctype="multipart/form-data">
						<input name="member_no" value=${member_no} type="hidden" />
						<input type="hidden" name="member_img" id="member_img" />
						<!-- 이미지 넣기 -->
						<div style="margin-bottom: 10px; margin-top: 20px;">
							<img id="show_img" width=100 height=100 alt="프로필 사진" style="border-radius: 50px;" src="../resources/upload/profile/${info.member_img}" onerror="this.src='../resources/upload/profile/myprofile.png';">
						</div>
						<div style="margin-bottom: 10px;">
							<label for="file">
								<div style="width: 90px; height: auto; background: white; border: 2px solid rgb(77, 77, 77)"> 사진 변경</div>
							</label>
					        <button id="del_img" type="button" style="width: 90px; height: auto; background: white; border: 2px solid rgb(77, 77, 77)" onclick="deleteImage()"> 사진 삭제</button>
							<input type="file" id="file" name="file" style="display: none;" onchange="readURL(this)"><br>
						</div>
						<div style="margin-bottom: 10px;">
							<span>닉네임: </span> <input name="member_nickname" id="member_nickname" value="${info.member_nickname}"  onfocus="clearInputValue(this)" onblur="fillInputValue(this)">
						</div>
						<div id="nicknameResult"></div>
						<div style="margin-bottom: 10px;">
							<span>성별: </span>
							 <input type="radio" name="member_gender" value="M" ${info.member_gender == 'M' ? 'checked' : ''}>남 
							 <input type="radio" name="member_gender" value="F" ${info.member_gender == 'F' ? 'checked' : ''}>여
							 <input type="radio" name="member_gender" value="U" ${info.member_gender == 'U' ? 'checked' : ''}>기타
						</div>
						<div style="margin-bottom: 10px;">
							<span>연령대: </span> <select size="1" id="member_ageRange"
								name="member_ageRange">
								<option value="NULL"
									${info.member_ageRange == null ? 'selected' : ''}>::연령대::</option>
								<option value="10대"
									${info.member_ageRange == '10대' ? 'selected' : ''}>10대</option>
								<option value="20대"
									${info.member_ageRange == '20대' ? 'selected' : ''}>20대</option>
								<option value="30대"
									${info.member_ageRange == '30대' ? 'selected' : ''}>30대</option>
								<option value="40대"
									${info.member_ageRange == '40대' ? 'selected' : ''}>40대</option>
								<option value="50대"
									${info.member_ageRange == '50대' ? 'selected' : ''}>50대</option>
								<option value="기타" ${info.member_ageRange == '기타' ? 'selected' : ''}>기타</option>
							</select>
						</div>
						<button type="submit"
							style="margin-bottom: 10px; background: black; color: white;">변경사항
							저장</button>
					</form>
				</div>
				<div id="my_revise"
					style="flex: 2; margin-left: 5px; margin-right: 10px;">
					<form action="revise_up" method="post" id="revise_up">
						<input name="member_no" value=${member_no} type="hidden" />
						<div
							style="display: flex; flex-direction: row; margin-top: 40px; margin-bottom: 10px;">
							<span style="flex: 0.1;"></span><span style="flex: 0.3;">email:</span>
							<input style="flex: 0.3;" id="member_email" name="member_email" type="email" value="${info.member_email}">
						</div>
						<div
							style="display: flex; flex-direction: row; margin-bottom: 10px;">
							<span style="flex: 0.1;"></span><span style="flex: 0.3;">id:</span>
							<span style="flex: 0.3;" id="member_id">${info.member_id}</span>
						</div>
						<div
							style="display: flex; flex-direction: row; margin-bottom: 10px;">
							<span style="flex: 0.1;"></span><span style="flex: 0.3;">이전
								패스워드:</span> <input style="flex: 0.3;" id="before_pw" type="password"
								placeholder=" 패스워드(8자 이상)" minlength="8" required>
						</div>
						<div id="pwCheck"></div>
						<div
							style="display: flex; flex-direction: row; margin-bottom: 10px;">
							<span style="flex: 0.1;"></span><span style="flex: 0.3;">바꿀
								패스워드:</span> <input style="flex: 0.3;" id="after_pw" name="member_pw"
								type="password" placeholder=" 패스워드(8자 이상)" minlength="8">
						</div>
						<div
							style="display: flex; flex-direction: row; margin-bottom: 10px;">
							<span style="flex: 0.1;"></span><span style="flex: 0.3;">이름:</span>
							<input style="flex: 0.3;" id="member_name" name="member_name" value="${info.member_name}">
						</div>
						<div
							style="display: flex; flex-direction: row; margin-bottom: 10px;">
							<span style="flex: 0.1;"></span><span style="flex: 0.3;">연락처:</span>
							<input style="flex: 0.3;" id="member_tel" type="tel"
								name='member_tel' placeholder="전화번호(-없이 숫자만 입력)" minlength="11"
								maxlength="11" value="${info.member_tel}">
						</div>
						<button type="submit"
							style="margin-bottom: 10px; background: black; color: white;">상세정보
							수정</button>
					</form>
				</div>
			</div>
			<div id="my_drop"
				style="flex: 1; margin-top: 10px; margin-right: 10px;">
				<form action="drop">
					<input name="member_no" value=${member_no} type="hidden" />
					<span>회원탈퇴를 하시면 모든 데이터가 사라집니다. 탈퇴를 진행하시겠습니까? </span><a><button type="submit">회원탈퇴</button></a>
				</form>
			</div>
		</div>
	</div>

</body>
</html>



