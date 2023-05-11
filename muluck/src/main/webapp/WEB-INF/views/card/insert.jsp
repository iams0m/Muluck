<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body background="lime">
반려식물 등록증이 발급되었습니다.>
<hr color="red">
${cardVO.card_name} <br>
${cardVO.card_type} <br>
${cardVO.card_birth} <br>
${cardVO.card_mmti} <br>
<img src="../resources/upload/${savedName}" width=300 height=300><br>
${cardVO.card_date} <br>

<%-- <a href="card_one?card_id=${cardVO.card_no}">내 반려식물 등록증 목록</a> --%>
</body>
</html>