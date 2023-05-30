<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>나의 반려식물 유형 찾기</title>
	<link rel="stylesheet" href="../resources/css/reset.css" type="text/css">
	<link rel="stylesheet" href="../resources/css/form.css" type="text/css">
<script type="text/javascript">
	function srcollUP() {
		const vheight = $('.test').height();
		$('html, body').animate({
			scrollTop: ((Math.floor($(window).scrollTop() / vheight) - 1) * vheight)}, 500);
	}
	
	function scrollDown() {
		const vheight = $('.test').height();
		$('html, body').animate({
			scrollTop: ((Math.floor($(window).scrollTop() / vheight) + 1) * vheight)}, 500);
	}
	
	$(function() {
		$('.next_btn').click(function(e) {
			let divs = $(this).parent().prev().children();
			let inputs = divs.find('input:checked');
			if(inputs.length < 1) {
				alert('문항이 선택되지 않았습니다.');
				return false;
			}
			e.preventDefault();
			scrollDown();
		
		});
		
		$('prev_btn').click(function(e) {
			let radios = $('input[type=radio] :checked');
			if(radios.length < 3) {
				alert('문항이 선택되지 않았습니다.');
				return false;
			}
			return true;
		});
		
		$('html, body').animate({
			scrollTop: 0
		}, 500);
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
							<input id="one" type="radio" name="answer_1">
							<label for="one">대답1</label>
						</div>
						<div>
							<input id="two" type="radio" name="answer_2">
							<label for="two">대답2</label>
						</div>
					</div>
					<div class="btn_wrap">
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
							<input id="one" type="radio" name="answer_1">
							<label for="one">대답1</label>
						</div>
						<div>
							<input id="two" type="radio" name="answer_2">
							<label for="two">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
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
							<input id="one" type="radio" name="answer_1">
							<label for="one">대답1</label>
						</div>
						<div>
							<input id="two" type="radio" name="answer_2">
							<label for="two">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
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
							<input id="one" type="radio" name="answer_1">
							<label for="one">대답1</label>
						</div>
						<div>
							<input id="two" type="radio" name="answer_2">
							<label for="two">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
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
							<input id="one" type="radio" name="answer_1">
							<label for="one">대답1</label>
						</div>
						<div>
							<input id="two" type="radio" name="answer_2">
							<label for="two">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
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
							<input id="one" type="radio" name="answer_1">
							<label for="one">대답1</label>
						</div>
						<div>
							<input id="two" type="radio" name="answer_2">
							<label for="two">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
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
							<input id="one" type="radio" name="answer_1">
							<label for="one">대답1</label>
						</div>
						<div>
							<input id="two" type="radio" name="answer_2">
							<label for="two">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
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
							<input id="one" type="radio" name="answer_1">
							<label for="one">대답1</label>
						</div>
						<div>
							<input id="two" type="radio" name="answer_2">
							<label for="two">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
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
							<input id="one" type="radio" name="answer_1">
							<label for="one">대답1</label>
						</div>
						<div>
							<input id="two" type="radio" name="answer_2">
							<label for="two">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
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
							<input id="one" type="radio" name="answer_1">
							<label for="one">대답1</label>
						</div>
						<div>
							<input id="two" type="radio" name="answer_2">
							<label for="two">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
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
							<input id="one" type="radio" name="answer_1">
							<label for="one">대답1</label>
						</div>
						<div>
							<input id="two" type="radio" name="answer_2">
							<label for="two">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
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
							<input id="one" type="radio" name="answer_1">
							<label for="one">대답1</label>
						</div>
						<div>
							<input id="two" type="radio" name="answer_2">
							<label for="two">대답2</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<input type="submit" value="제 출" class="submit_btn">
					</div>
				</div>
			</form>
		</div>
	</section>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</body>
</html>