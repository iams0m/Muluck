<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 반려식물 유형 찾기</title>
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<link rel="stylesheet" href="../resources/css/reset.css" type="text/css">
<link rel="stylesheet" href="../resources/css/form.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		var nextBtns = document.querySelectorAll(".next_btn");
		nextBtns.forEach(function(btn) {
			btn.addEventListener("click", function(e) {
				e.preventDefault();

				// 현재 질문의 라디오 버튼 체크 여부 확인
				var currentQuestion = this.closest(".test");
				var radioButtons = currentQuestion
						.querySelectorAll('input[type="radio"]');
				var isChecked = false;

				radioButtons.forEach(function(radio) {
					if (radio.checked) {
						isChecked = true;
					}
				});

				// 라디오 버튼이 체크되어 있지 않으면 모달 창 표시
				if (!isChecked) {
					showModal("알림", "문항이 선택되지 않았습니다.");
					return;
				}

				// 현재 질문 숨기기
				currentQuestion.style.display = "none";

				// 다음 질문 보여주기
				var nextQuestion = currentQuestion.nextElementSibling;
				if (nextQuestion) {
					nextQuestion.style.display = "block";
				}
			});
		});
	});

	// 모달 창 생성 함수
	function showModal(title, message) {
		// 모달 요소 생성
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

		// 요소들을 모달에 추가
		modalContent.appendChild(modalTitle);
		modalContent.appendChild(modalMessage);
		modalContent.appendChild(closeButton);
		modal.appendChild(modalContent);

		// 모달을 페이지에 추가
		document.body.appendChild(modal);

		// 모달 표시
		modal.style.display = "block";
	}

	// 모달 닫기 함수
	function closeModal() {
		var modal = document.querySelector(".modal");
		if (modal) {
			modal.style.display = "none";
			document.body.removeChild(modal);
		}
	}

	document.addEventListener("DOMContentLoaded", function() {
		// 이전 버튼 클릭 이벤트 처리
		var prevBtns = document.querySelectorAll(".prev_btn");
		prevBtns.forEach(function(btn) {
			btn.addEventListener("click", function(e) {
				e.preventDefault();

				// 현재 질문 숨기기
				var currentQuestion = this.closest(".test");
				currentQuestion.style.display = "none";

				// 이전 질문 보여주기
				var prevQuestion = currentQuestion.previousElementSibling;
				if (prevQuestion) {
					prevQuestion.style.display = "block";
				}
			});
		});
	});

	document.addEventListener("DOMContentLoaded", function() {
		// 버튼 클릭 이벤트 처리
		var nextBtns = document.querySelectorAll(".mmti_main");
		nextBtns.forEach(function(btn) {
			btn.addEventListener("click", function(e) {
				e.preventDefault();

				// mmti_test.jsp로 이동
				window.location.href = "mmti_test.jsp";
			});
		});
	});
	
	document.addEventListener("DOMContentLoaded", function() {
		// 버튼 클릭 이벤트 처리
		var nextBtns = document.querySelectorAll(".mmti_result");
		nextBtns.forEach(function(btn) {
			btn.addEventListener("click", function(e) {
				e.preventDefault();

				// mmti_result.jsp로 이동
				window.location.href = "mmti_result.jsp";
			});
		});
	});
</script>
</head>
<body>
	<section id="survey">
		<div class="wrapper">
			<form id="form">
				<!-- 질문 1 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">1/12</h3>
						<h3 class="question">질문1</h3>
					</div>
					<div class="answer">
						<div>
							<input id="one_1" type="radio" name="answer_1"> <label
								for="one_1">대답1</label>
						</div>
						<div>
							<input id="two_1" type="radio" name="answer_1"> <label
								for="two_1">대답2</label>
						</div>

					</div>
					<div class="btn_wrap btn_sort">
						<button class="mmti_main">돌아가기</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 2 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">2/12</h3>
						<h3 class="question">질문2</h3>
					</div>
					<div class="answer">
						<div>
							<input id="one_2" type="radio" name="answer_2"> <label
								for="one_2">대답1</label>
						</div>
						<div>
							<input id="two_2" type="radio" name="answer_2"> <label
								for="two_2">대답2</label>
						</div>

					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 3 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">3/12</h3>
						<h3 class="question">질문3</h3>
					</div>
					<div class="answer">
						<div>
							<input id="one_3" type="radio" name="answer_3"> <label
								for="one_3">대답1</label>
						</div>
						<div>
							<input id="two_3" type="radio" name="answer_3"> <label
								for="two_3">대답2</label>
						</div>

					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 4 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">4/12</h3>
						<h3 class="question">질문4</h3>
					</div>
					<div class="answer">
						<div>
							<input id="one_4" type="radio" name="answer_4"> <label
								for="one_4">대답1</label>
						</div>
						<div>
							<input id="two_4" type="radio" name="answer_4"> <label
								for="two_4">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 5 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">5/12</h3>
						<h3 class="question">질문5</h3>
					</div>
					<div class="answer">
						<div>
							<input id="one_5" type="radio" name="answer_5"> <label
								for="one_5">대답1</label>
						</div>
						<div>
							<input id="two_5" type="radio" name="answer_5"> <label
								for="two_5">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 6 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">6/12</h3>
						<h3 class="question">질문6</h3>
					</div>
					<div class="answer">
						<div>
							<input id="one_6" type="radio" name="answer_6"> <label
								for="one_3">대답1</label>
						</div>
						<div>
							<input id="two_6" type="radio" name="answer_6"> <label
								for="two_6">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 7 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">7/12</h3>
						<h3 class="question">질문7</h3>
					</div>
					<div class="answer">
						<div>
							<input id="one_7" type="radio" name="answer_7"> <label
								for="one_7">대답1</label>
						</div>
						<div>
							<input id="two_7" type="radio" name="answer_7"> <label
								for="two_7">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 8 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">8/12</h3>
						<h3 class="question">질문8</h3>
					</div>
					<div class="answer">
						<div>
							<input id="one_8" type="radio" name="answer_8"> <label
								for="one_8">대답1</label>
						</div>
						<div>
							<input id="two_8" type="radio" name="answer_8"> <label
								for="two_8">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 9 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">9/12</h3>
						<h3 class="question">질문9</h3>
					</div>
					<div class="answer">
						<div>
							<input id="one_9" type="radio" name="answer_9"> <label
								for="one_9">대답1</label>
						</div>
						<div>
							<input id="two_9" type="radio" name="answer_9"> <label
								for="two_9">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>
				<!-- 질문 10 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">10/12</h3>
						<h3 class="question">질문10</h3>
					</div>
					<div class="answer">
						<div>
							<input id="one_10" type="radio" name="answer_10"> <label
								for="one_10">대답1</label>
						</div>
						<div>
							<input id="two_10" type="radio" name="answer_10"> <label
								for="two_10">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 11 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">11/12</h3>
						<h3 class="question">질문11</h3>
					</div>
					<div class="answer">
						<div>
							<input id="one_11" type="radio" name="answer_11"> <label
								for="one_11">대답1</label>
						</div>
						<div>
							<input id="two_11" type="radio" name="answer_11"> <label
								for="two_11">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 12 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">12/12</h3>
						<h3 class="question">질문12</h3>
					</div>
					<div class="answer">
						<div>
							<input id="one_12" type="radio" name="answer_12"> <label
								for="one_12">대답1</label>
						</div>
						<div>
							<input id="two_12" type="radio" name="answer_12"> <label
								for="two_12">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button type="submit" class="mmti_result">제 출</button>
					</div>
				</div>
			</form>
		</div>
	</section>
	<div class="modal">
		<div class="modal-content">
			<h2>모달 제목</h2>
			<p>모달 내용</p>
			<button id="modal-close-btn">닫기</button>
		</div>
	</div>

	<!-- <script type="text/javascript" src="../resources/js/form.js"></script> -->
</body>
</html>