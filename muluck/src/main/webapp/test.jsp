<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
<script type="text/javascript">

function clip(){

	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.")
}

</script>
</head>
<body>
<!-- 공유하기 버튼 -->
<button type="button" id="shareTw" class="btn_comm">트위터로 공유하기</button>
<button type="button" id="shareFb" class="btn_comm">페이스북으로 공유하기</button>
<button type="button" id="shareKt" class="btn_comm">카카오톡으로 공유하기</button>
<button type="button" id="shareKs" class="btn_comm">카카오스토리로 공유하기</button>
<span class="button gray medium"><a href="#" onclick="clip(); return false;">URL주소복사</a></span>
</body>
</html>