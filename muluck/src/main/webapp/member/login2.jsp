<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
<link rel="stylesheet" type="text/css" href="../resources/css/login_join.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

//kakao 카카오 로그인
Kakao.init('4d610e087d4d302ccdb7d223f816017f'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
  Kakao.Auth.login({
    success: function (response) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function (response) {
      	  console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
    },
    fail: function (error) {
      console.log(error)
    },
  })
}

//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }


$(function() {
	// 페이지 로드 시 아이디 저장 체크 박스 상태 확인
	var savedId = localStorage.getItem('savedId');
	if (savedId) {
		$('#member_id').val(savedId);
		$('#idSave').prop('checked', true);
	} else {
	    $('#member_id').val(''); // 저장된 아이디가 없으면 입력란 비우기
	}
	
	//페이지 로드시  URL에서 error 파라미터가 있는지 확인하고 로그인 실패 한것이면 알림
    var urlParams = new URLSearchParams(window.location.search);
    var error = urlParams.get('error');
    if (error === 'true') {
        alert("로그인에 실패했습니다.");
    }
	
	//로그인 버튼 선택시 회원인지 확인
	$('#loginForm').submit(function(event) {
		event.preventDefault(); // 폼 전송 동작 중지
		var member_id = $('#member_id').val();
		var member_pw = $('#member_pw').val();
		var idSaveChecked = $('#idSave').is(':checked');
		// 아이디 저장 체크 박스 상태 저장
		if (idSaveChecked) {
			localStorage.setItem('savedId', member_id);
		} else {
			localStorage.removeItem('savedId');
		}
		
		$.ajax({
			url: "login",
			type: "post",
			data: {member_id: member_id, member_pw: member_pw},
			dataType: "text",
			success: function(result) {
				console.log('result>> ' + result)
				if(result === 'true'){
					//alert('성공했어요') //성공하는지 확인
					window.location.href = "../main/home.jsp"; // 메인 페이지로 이동(다솜님페이지로) "../main/home.jsp";
				} else {
					// 로그인 실패
			        $("#loginResult").html("아이디 또는 비밀번호를 잘못 입력했습니다. <br>입력하신 내용을 다시 확인해주세요.").css('color','red');
					if (idSaveChecked) {
						$('#member_pw').val('');
						$('#member_pw').focus();
					} else {
						$('#member_id').val('');
						$('#member_pw').val('');
						$('#member_id').focus();
					}
				}
			},
			error: function() {
				$("#loginResult").html("서버 에러가 발생하였습니다.").css('color', 'red');
			}
		});
	});

});

</script>

</head>
<body>
	<div class="muluck_logo"><a href="login.jsp"><img src="../resources/assets/img/무우럭.png" alt="로고"></a></div>
	<div class="myform">
		<div id="login_title" class="title">로그인</div>
		<div class="center">
			<form id="loginForm" action="login" method="post">
				<input class="input_login" id="member_id" name="member_id" placeholder="  아이디" value="${member_id}"/>  <!-- 값 넣어놓고 실험 value="hhhj0525" -->
				<input class="input_login" id="member_pw" name="member_pw" type="password" placeholder="  패스워드"/>
				<div class="text1">
					<input class="input_login" type="checkbox" id="idSave"> 아이디 저장
				</div>
				<div class="sameCheck" id="loginResult"></div>
				<button class="btn black_btn" type="submit">로그인</button>
			</form>
			<a href="join.jsp"><button class="btn white_btn" type="submit">회원가입</button></a>
			<div class="text1">
				<a href="idpwFind.jsp">아이디 찾기 / 패스워드 찾기</a>
			</div>
			<hr style="color: gray; margin-left: 5%; margin-right: 5%;">
			<div id="text2">
				<b>SNS 계정으로 로그인하기</b>
			</div>
			<div id="logo">
				<!-- 네이버 로그인 버튼 노출 영역 -->
				<div id="naver_id_login"></div>
				<!-- 카카오 로그인 버튼 노출 영역 --> <!-- 임시로 이미지 넣어둠 -->
				<div><button onclick="kakaoLogin()">
  					<img src="../resources/upload/member/kakao_login.png" alt="Kakao Login">
				</button></div>
			</div>
			<script type="text/javascript">
				var naver_id_login = new naver_id_login("u4ZSMzPdnSJwhVD6Q0ZO", "http://localhost:8888/muluck/member/callback.jsp");
				var state = naver_id_login.getUniqState();
				naver_id_login.setButton("green", 3, 39);
				naver_id_login.setDomain("http://localhost:8888/muluck/");
				naver_id_login.setState(state);
				//naver_id_login.setPopup();
				naver_id_login.init_naver_id_login();
			</script>
		</div>
	</div>
</body>
</html>