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
<style>
div {
	text-align: center;
}
</style>
<!-- 토글 - 드롭다운 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../resources/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</head>
<body>
<!-- 네비게이션바 header -->
<%@ include file="../../../nav_header.jsp"%>
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
	<!-- 게시글 수정 -->
	<div class="bbs_update">
		<form action="bbs_update_ok1" method="get">
			<div class="bbs_update">
				no : <input name="bbs_no"><br>
			</div>
			<div class="bbs_update">
				content : <input name="bbs_content"><br>
			</div>
			<div class="bbs_update">
				<button type="submit" class="button1">수정</button>
			</div>
		</form>
	</div>
</body>
</html>