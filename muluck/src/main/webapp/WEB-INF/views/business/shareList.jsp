<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나눔</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
 <!-- 토글 - 드롭다운 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../resources/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script type="text/javascript">
	$(function() {
		$('pages').click(function() {
			alert($(this).text())
			$.ajax({
				url : "businessList", //views/businessList가 결과
				data : {
					page : $(this).text()
				},
				success : function(result) {
					$('#d1').html(result)
				},
				error : function() {
					alert('실패')
				}
			})

		})
	})
</script>
<style>
td {
	background: white;
	height: 30px;
}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/resources/css/business.css"
	rel="stylesheet">
<!-- jquery  -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->
</head>
<body>
<!-- 네비게이션바 header -->
<%@ include file="../../../nav_header.jsp"%>

	<h1 class="mt-2"></h1>
	<figure>
		<video src="${pageContext.request.contextPath}/resources/img/pot.mp4"
			autoplay muted loop></video>
		<div class="inner">
			<h2>MULUCK</h2>
			<p>거래 나눔 페이지</p>
		</div>
	</figure>

	<section>
		<div class="inner">
			<h3>전체 글 : ${count}</h3>
			<hr color="green">
			<%
				int pages = ((Integer) request.getAttribute("pages")).intValue();
			for (int p = 1; p <= pages; p++) {
			%>
			<button style="background: #eaf2df; color: #145f37; width: 50px;"
				class="pages"><%=p%></button>
			<%
				}
			%>
			<hr color="green">
			<div id="d1">
				<table>
					<tr>
						<td class="left">게시판 번호</td>
						<td class="left">member_no</td>
						<td class="left">제목</td>
						<td class="left">게시시간</td>
					</tr>
					<%-- 		<c:forEach items="${list}" var="one"> --%>
					<!-- 		<tr> -->
					<%-- 		<td class="right">${one.b_no}</td> --%>
					<%-- 		<td class="right">${one.member_no}</td> --%>
					<%-- 		<td class="right"><a href="businessList?title=${one.b_no}">${one.b_title}</a></td> --%>
					<!-- 		<td class="right"> -->
					<%-- 		 <c:choose> --%>
					<%--   			<c:when test="${one.b_share eq true}"> --%>
					<!--    			 나눔 -->
					<%--  			 </c:when> --%>
					<%--   			<c:when test="${one.b_share eq false}"> --%>
					<!--    			 결제 -->
					<%--   			</c:when> --%>
					<%--   			<c:otherwise> --%>
					<!--     		기타 -->
					<%--   			</c:otherwise> --%>
					<%-- 		 </c:choose> --%>
					<!-- 		</td> -->
					<!-- 		</tr> -->
					<%-- 		</c:forEach> --%>
					<c:forEach items="${list}" var="one">
                  <c:if test="${one.b_share == true}">
                        <tr>
                           <td class="right">${one.b_no}</td>
                           <td class="right">${one.member_no}</td>
                           <td class="right"><a href="businessList?title=${one.b_no}">${one.b_title}</a></td>
                           <td class="right">${one.b_share}</td>
                        </tr>
                    </c:if>
               </c:forEach>
			</table>
			</div>
		</div>
	</section>

</body>
</html>