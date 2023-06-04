<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page import="com.multi.muluck.community.BbsVO" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>커뮤니티</title>
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
<link href="../resources/css/community.css" type="text/css" rel="stylesheet" />
<!-- js -->
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
$(function() {
	//댓글 목록
	$.ajax({
		url : "rr_list",
		data : {
			bbs_no : ${bag.bbs_no}
		},
		success : function(x) {
			$('#reply_list').append(x + "<br>")	
		}
	})
	//댓글 작성
	$('#b1').click(function() {
		reply_content = $('#reply').val()
		$.ajax({
			url : "rr",
			data : {
				bbs_no : ${bag.bbs_no},
				reply_content : reply_content,
				member_no : ${member_no} //세션
			},
			success : function() {
				alert('댓글 작성 완료')
				$('#reply_list').append("-" + reply_content + "<br>")
			}
		})
	}) //b1
	/* 좋아요 */
	$('#heart').click(function() {
		//bbs_no값 넘어갔는지 //alert(${bag.bbs_no}+ "----------")
		//좋아요 실행
		if ($('#heartImage').attr('src') === "../resources/assets/img/unlike.png") {
			$.ajax({
				url : "heart_ok",
				data : {
					bbs_no : ${bag.bbs_no},
					member_no : ${member_no}
				},
				success : function(x) {
					alert('좋아요 성공')
					$('#heartImage').attr('src', "../resources/assets/img/like.png");
				}
			})
		}
		//좋아요 취소
		else if ($('#heartImage').attr('src') === "../resources/assets/img/like.png") {
			$.ajax({
				url : "heart_no",
				data : {
					bbs_no : ${bag.bbs_no},
					member_no : ${member_no}
				},
				success : function(x) {
					alert('좋아요 취소')
					$('#heartImage').attr('src', "../resources/assets/img/unlike.png");
				}
			})
		}
	}) //heart
	/* 북마크 */
	$('#bookmark').click(function() {
		//북마크 저장
		if ($('#bookmarkImage').attr('src') === "../resources/assets/img/unbookmark.png") {
			$.ajax({
				url : "bookmark_ok",
				data : {
					bbs_no : ${bag.bbs_no},
					member_no : ${member_no}
				},
				success : function(x) {
					alert('북마크 성공')
					$('#bookmarkImage').attr('src', "../resources/assets/img/bookmark.png");
				}
			})
		}
		//북마크 취소
		else if ($('#bookmarkImage').attr('src') === "../resources/assets/img/bookmark.png") {
			$.ajax({
				url : "bookmark_no",
				data : {
					bbs_no : ${bag.bbs_no},
					member_no : ${member_no}
				},
				success : function(x) {
					alert('북마크 취소')
					$('#bookmarkImage').attr('src', "../resources/assets/img/unbookmark.png");
				}
			})
		}
	}) //bookmark
	/* 팔로우 & 언팔로우 */
	$('#follow').click(function() {
		//언팔로우 상태일 때 -> 팔로잉 상태로
		if($('#follow').text() == '팔로우') { 
			$.ajax({
				url : "ff_ok",
				data : {
					follower_user: ${member_no},
					following_user: ${bag.member_no}
				},
				success : function(x) {
					alert('팔로우 성공')
					$('#follow').text('팔로잉');
				}
			})
		}
		//팔로잉 상태일 때 -> 언팔로우 상태로
		else if($('#follow').text() == '팔로잉') { 
			$.ajax({
				url : "ff_no",
				data : {
					follower_user: ${member_no},
					following_user: ${bag.member_no}
				},
				success : function(x) {
					alert('언팔로우 성공')
					$('#follow').text('팔로우');
				}
			})
		}
	}) //follow
}) //$
</script>
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
			<a class="navbar-brand" href="${pageContext.request.contextPath}/main/home.jsp">Muluck</a>
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
				<a href="${pageContext.request.contextPath}/main/home.jsp">
				<img src="${pageContext.request.contextPath}/resources/assets/img/무우럭.png" /></a>
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
						class="nav-link text-uppercase" href="${pageContext.request.contextPath}/main/home.jsp">홈</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="${pageContext.request.contextPath}/community/community.jsp">커뮤니티</a></li>
					<ul class="navbar-nav px-lg-4">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="myplant.jsp" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 나의 식물 </a>
							<ul class="dropdown-menu dropdown-menu-dark">
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/diary/calendar.jsp">캘린더</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/diary/cardview.jsp">식물 일지</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/card/list">반려식물 등록증</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/mmti/mmti_main.jsp">MMTI 테스트</a></li>
							</ul></li>
					</ul>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="${pageContext.request.contextPath}/business/business_main.jsp">거래/나눔</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 화면 좌측 -->
	<!-- 카테고리 -->
	<div id="category_list">
	<div class="category_list">
		<a class="category" href="../community/community.jsp" style="text-decoration: none">
		<font size="5">무우럭</font></a>
	</div>
	<div class="category_list">
		<a class="category" href="bbs1" style="text-decoration: none">
		<font size="5">자유게시판</font></a>
	</div>
	<div class="category_list">
		<a class="category" href="bbs2" style="text-decoration: none">
		<font size="5">질문게시판</font></a>
	</div>
	<div class="category_list">
		<a class="category" href="bbs3" style="text-decoration: none">
		<font size="5">자랑게시판</font></a>
	</div>
	</div>
	<!-- 화면 중앙 -->
	<div id="community_center">
	<!-- 게시판 검색 -->
	<div id="bbs_one">
		<form action="bbs_one1" method="get">
			<input name="bbs_no">
			<button type="submit" class="button1">검색</button>
		</form>
	</div>
	<!-- 유저 프로필 -->
	<div class="user">
		<button id="user" class="button2"><img src="../resources/assets/img/plant.png" width=40 height=40></button>
		${member_nickname}
		<!-- 팔로우 버튼 -->
		<button id="follow">팔로우</button>
	</div>
	<!-- 검색 결과 -->
	<div class="bbs_one">
		<h3>${bag.bbs_title}</h3><br>
		<img src="../resources/assets/upload/${bag.bbs_img}" width=250 height=250><br><br>
		${bag.bbs_content}<br>
	</div>
	  <!-- 세션(본인만 수정/삭제 가능) -->
	  <% 
	  	 if(session.getAttribute("member_no") != null){
	  	 int member_no_s = (int) session.getAttribute("member_no");
	 	 BbsVO bag = (BbsVO)request.getAttribute("bag");
	     int member_no = bag.getMember_no();
	     if(member_no_s == member_no) { %>
	<!-- 수정/삭제 버튼 -->
	<div id="up_del_button">
		<button onclick="location.href='bbs_update2'" class="button1">수정</button>
		<button onclick="location.href='bbs_delete2'" class="button1">삭제</button>
	</div>
	  <% }} %>
	<!-- 좋아요/북마크 버튼 -->
	<div id="heart_book_button">
		<button id="heart" class="button2">
			<img id="heartImage" src="../resources/assets/img/unlike.png" width="30" height="30"></button>
		<button id="bookmark" class="button2">
			<img id="bookmarkImage" src="../resources/assets/img/unbookmark.png" width="30" height="30"></button>
	</div>
	<!-- 댓글 -->
	<div id="bbs_reply">
		<input id="reply">
		<button id="b1">댓글 작성</button>
	</div>
	<div id="reply_list">
		<c:forEach items="${list}" var="bag"> 
			- ${bag.reply_content}<br>
		</c:forEach>
	</div>
	</div>
</body>
</html>