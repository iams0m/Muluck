<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>:: jQuery 심플 다이얼로그 팝업 ::</title>
<link rel="stylesheet" href="resources/js/jquery.alerts.css">
<script type="text/JavaScript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/JavaScript" src="resources/js/jquery.alerts.js" ></script>
<script type="text/javascript">
    function normalAlertWindow() {
        jAlert("반려식물 등록증을 부담없이 공유해보세요!", "주소가 복사되었습니다");
    }
</script>
</head>
<body>
    <h1>NOMAL ALERT</h1>
    <input type="button" onClick="normalAlertWindow();" value="경고창"/>
</body>
</html>