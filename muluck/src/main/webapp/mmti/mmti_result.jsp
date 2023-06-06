<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta property="og:title" content="나의 반려식물 유형은?">
<meta property="og:image" content="">
<meta property="og:url" content="">
<meta property="og:description" content="나의 반려식물에게 맞는 성격 유형은 무엇일까?">
<title>나의 반려식물 MMTI 찾기</title>
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<link rel="stylesheet" href="../resources/css/reset.css" type="text/css">
<link rel="stylesheet" href="../resources/css/result.css"
	type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
	integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx"
	crossorigin="anonymous"></script>
<script>
	Kakao.init('fae1cb71aee8a9b6922099421578a59f'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="../resources/js/result.js"></script>
<script>
	function shareMessage() {
		Kakao.Share.sendDefault({
			objectType : 'feed',
			content : {
				title : 'MMTI 테스트',
				description : '테스트를 통해 당신에게 딱 맞는 식물을 추천해 드릴게요!',
				imageUrl : 'https://ifh.cc/g/RwYM28.png',
				link : {
					// [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
					mobileWebUrl : 'https://developers.kakao.com',
					webUrl : 'https://developers.kakao.com',
				},
			},
			social : {
				likeCount : 286,
				commentCount : 45,
				sharedCount : 845,
			},
			buttons : [ {
				title : '웹으로 보기',
				link : {
					mobileWebUrl : 'https://developers.kakao.com',
					webUrl : 'https://developers.kakao.com',
				},
			}],
		});
	}
	
	// 모달 창 생성 함수
	function showModal(title, message) {
	    var modal = document.createElement("div");
	    modal.classList.add("modal");

	    var modalContent = document.createElement("div");
	    modalContent.classList.add("modal-content");

	    var modalTitle = document.createElement("h2");
	    modalTitle.textContent = title;

	    var modalMessage = document.createElement("p");
	    modalMessage.textContent = message;

	    var closeButton = document.createElement("button");
	    closeButton.textContent = "닫기";
	    closeButton.addEventListener("click", function() {
	        closeModal();
	    });

	    modalContent.appendChild(modalTitle);
	    modalContent.appendChild(modalMessage);
	    modalContent.appendChild(closeButton);
	    modal.appendChild(modalContent);

	    document.body.appendChild(modal);

	    modal.style.display = "block";
	}

	function closeModal() {
	    var modal = document.querySelector(".modal");
	    if (modal) {
	        modal.style.display = "none";
	        document.body.removeChild(modal);
	    }
	}

	var copyButton = document.querySelector(".copy_btn");
	copyButton.addEventListener("click", function() {
	    copyUrl();
	});
</script>
</head>
<body>
	<section id="main_contents">
		<div class="wrapper">
			<div class="result">
				<div class="title">
					<h2>내 식물의 MMTI는</h2>
					<h1>PHDA</h1>
				</div>
				<div class="result_img">
					<img src="../resources/assets/img/mmti.png" alt="frontend">
				</div>
			</div>
			<div class="result_explains">
				<div class="explain">
					<h3 class="title">PHDA</h3>
					<ul>
						<li><b>P</b>/A : <b>Passive(수동적인)</b> / Active(적극적인)</li>
						<h4>보호자가 식물 관리에 소극적이시군요 :( <br>
						이 영역은 보호자의 적극적 / 소극적인 식물 관리에 따라 달라져요.<br>같은 식물이라도 보호자에 따라 달라질 수 있는 후천적인 영역이에요.</h4>
						<li><b>H</b>/D : <b>Humid(습한)</b> / Dry(건조한)</li>
						<h4>내 반려식물은 공기가 촉촉한 곳을 좋아해요.</h4>
						<li><b>D</b>/L : <b>Dim(빛이 잘 들지 않는 곳)</b> / Light(빛이 잘 드는 곳)</li>
						<h4>내 반려식물은 빛이 잘 들지 않는 곳을 좋아해요.</h4>
						<li><b>A</b>/U : <b>Adaptable(적응력이 뛰어난)</b> / Unadaptable(적응을 어려워하는)</li>
						<h4>내 반려식물은 주변 환경에 잘 맞춰줘요. 적응력이 뛰어난 친구에요!</h4>
					</ul>
				</div>
			</div>
			<div class="share">
				<div class="url">
					<button class="copy_btn" type="button" onclick="javascript:copyUrl()">URL 복사하기</button>
				</div>
				<div class="facebook">
					<button class="facebook_share" type="button" onclick="javascript:shareFacebook()">Facebook 공유하기</button>
				</div>
				<div class="kakao">
					<button class="kakao_share" type="button" id="kakao_share"
						onclick="javascript:shareMessage()">카카오톡 공유하기</button>
				</div>
			</div>
			<div class="buttons">
				<ul>
					<li>
						<h3>다른 식물들은 어떤 유형일까?</h3> <a href="mmti_test.jsp">
							<button type="button">테스트 다시 하기</button>
					</a>
					</li>
					<li>
						<h3>무우럭이 궁금하다면?</h3> <a href="../main/home.jsp">
							<button type="button">무우럭 서비스 이용해보기</button>
					</a>
					</li>
					
				</ul>
			</div>
		</div>
	</section>
	<div class="modal">
		<div class="modal-content">
			<h2>모달 제목</h2>
			<p>모달 내용</p>
			<button id="modal-close-btn">닫기</button>
		</div>
	</div>
</body>
</html>