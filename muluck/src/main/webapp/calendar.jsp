<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>무우럭</title>
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<html lang='en'>
<!-- jquery -->
<!--  jquery 점유율 줄어드는 추세 전부 자바스크립트로 변경할지 고민 근데 어려울듯, 최신 링크만 일단 걸어놓음 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- bootstrap 4 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- fullcalendar -->
<script src="resources/dist/index.global.js"></script>


<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<!--  요거 asset에 있는 icon으로 대체해도 될듯 -->
<script>
	document.addEventListener('DOMContentLoaded', function() {
		//dom에서(가상메모리?) 콘텐트 불러오고 에드 이벤트리스너로 받는다
		var calendarEl = document.getElementById('calendar');
		//calendarel 변수는 id가 calendar인 doc
		var calendar = new FullCalendar.Calendar(calendarEl, {
			//여기서  위에 fullcalendar 라이브러리 가져오고 calendarE1 내부 어떻게 채울지 구성
			timeZone : 'UTC', //시간 UTC
			locale : 'ko', //언어 한국어
			editable : true, // 이동 가능
			selectable : true, // 여러 칸 선택가능
			displayEventTime : false, //시간 
			initialView : 'dayGridMonth', //초기화면 설정
			events : [ // 이벤트 구성요소 3가지로 했음 추후 이모티콘 어떻게 할지 고민, 이건 고정되있음
			{
				title : '일정',
				start : '2023-05-16 00:00:00',
				end : '2023-05-17 00:00:00'
			} ],
			select : function(info) { // 선택. ; 함수에서 기능들 실행

				$('#addCalendarModal').modal('show'); // 누르면 모달 보여짐
				$("#addCalendar").off("click").on("click", function() { // off먼저 시키고 다시 켜야지 중복 적용이 안됨
					addCalendarClickHandler(info); //핸들러 콘트롤러 비슷한 개념인듯
					$('#addCalendarModal').modal('hide');
				});
				$("#cancelButton").on('click', function() {
					$('#addCalendarModal').modal('hide'); // 모달 닫는 코드
					});
				
			},
			  eventClick: function(info) { // 여기서 내용 수정, fullcalendar가 제공하는 것도 있는듯
		          var eventTitle = info.event.title; // 내용 수정 변수
		          var eventId = info.event.id;  // 내용 수정 변수 아이디
		          $('#editCalendarModal'); // 모달 이름 
		          $('#editCalendarModal').modal('show');//모달 보여주기!
		          $('#updateCalendar').off('click').on('click', function() {//off먼저 시키고 다시 켜야지 중복 적용이 안됨0 
		            updateCalendarClickHandler(info); 
		            $('#editCalendarModal').modal('hide');
		          });
		          $('#deleteCalendar').show().off('click').on('click', function() { //적용된 캘린더 크기
		            deleteCalendarClickHandler(info);
		            $('#editCalendarModal').modal('hide');
		          });
		          $("#cancelButton1").on('click', function() {
						$('#editCalendarModal').modal('hide'); // 모달 닫는 코드
						});
		          
		        
		        	
		        }
		      });
		calendar.render();

		var addCalendarClickHandler = function(info) { //addcch 기능 설정
			var content = $("#calendar_content").val();
			if (content == null || content == "") {
				alert("내용을 입력하세요.");
			} else {
				var event = {
					"title" : content,
					"start" : info.start, //캘린더내부에서 받아옴
					"end" : info.end
				};

				calendar.addEvent(event); //fullcalendar 기능?
				console.log(event);
				var events = [];
				var allEvents = calendar.getEvents(); //이거 잘 이해 안됨 다시 보기
				for (var i = 0; i < allEvents.length; i++) { //이벤트 여러개 추가 가능  
					var eventInfo = {
						title : allEvents[i].title,
						start : allEvents[i].start,
						end : allEvents[i].end
					};
					events.push(eventInfo);
				}
				console.log("추가된 일정:", events);

				// AJAX를 사용하여 서버에 이벤트를 추가하는 등의 작업 수행
				$.ajax({
					url : "diaryajax.jsp", //ajax이렇게 하는게 아닌가?
					method : "POST",
					data : JSON.stringify(event), // 이벤트 데이터를 JSON 문자열로 변환하여 전송
					contentType : "application/json", //json xkdlq
					success : function(response) {//성공되면 콘솔 표시
						console.log("추가 성공:", response);
					},
					error : function(xhr, status, error) {
						console.log("추가 실패:", status, error);
					}
				});
				$("#calendar_content").val(''); // 창 다시 띄울 때 전에 써져있던 내용 안 나오게!
			}
		};

		var updateCalendarClickHandler = function(info) { //addcalendar랑 비슷
			var eventTitle = $("#edit_calendar_content").val();
			if (eventTitle == null || eventTitle == "") {
				alert("내용을 입력하세요.");
			} else {
				info.event.setProp("title", eventTitle); //fullcalendar 함수 내용 변경함수, 날짜 관련x, 날짜도 변경 가능하게 해야하나?event.setDates( start, end, [ options ] )
				console.log(info.event);

				// AJAX 사용, 서버 이벤트
				$.ajax({
					url : "diaryajax.jsp" + info.event.id,
					method : "POST",
					data : JSON.stringify(info.event),
					contentType : "application/json",
					success : function(response) {
						console.log("수정 성공:", response);
					},
					error : function(xhr, status, error) {
						console.log("수정 실패:", status, error);
					}
				});
			}
		};

		var deleteCalendarClickHandler = function(info) {
			if (confirm("'" + info.event.title + "'를 삭제하시겠습니까?")) {
				info.event.remove();
				console.log(info.event);

				$.ajax({
					url : "diaryajax.jsp" + info.event.id,
					method : "POST",
					success : function(response) {
						console.log("삭제 성공:", response);
					},
					error : function(xhr, status, error) {
						console.log("삭제 실패:", status, error);
					}
				});
			}
		};
	});
</script>



</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light" id="mainNav2">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="index.jsp">Muluck</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto py-4 py-lg-0">
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
						href="index.jsp">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
						href="index.jsp">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<header>
		<h1 class="site-heading text-center text-faded d-none d-lg-block"
			style="text-align: center;">
			<!-- <span class="site-heading-lower">무우럭</span>
                <span class="site-heading-upper text-primary mb-3">muluck</span> -->
			<img src="resources/assets/img/무우럭.png" />
		</h1>
	</header>
	  <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
            <div class="container">
                <a class="navbar-brand text-uppercase fw-bold d-lg-none" href="index.jsp">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="index.jsp">홈</a></li>
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="about.jsp">커뮤니티</a></li>
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="products.jsp">나의 식물</a></li>
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="store.jsp">거래</a></li>
                    </ul>
                </div>
            </div>
        </nav>
	<div id='calendar'
		style="width: 30%; background-color: #F2F1DF; text-align: center;"></div>
	<footer class="footer text-faded text-center py-5"
		style="text-align: center;">
		<div class="container">
			<p class="m-0 small">Copyright &copy; Your Website 2023</p>
		</div>
	</footer>

	<!-- 입력 모달 -->
	<div class="modal fade" id="addCalendarModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="add_calendar_content" class="col-form-label">일정
							내용</label> <input type="text" class="form-control" id="calendar_content" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="addCalendar">추가</button>
					<button type="button" id="cancelButton" class="btn btn-secondary">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 수정 및 삭제 모달 -->
	<div class="modal fade" id="editCalendarModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정을 수정 또는
						삭제하세요.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="edit_calendar_content" class="col-form-label">일정
							내용</label> <input type="text" class="form-control"
							id="edit_calendar_content" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="updateCalendar">수정</button>
					<button type="button" class="btn btn-danger" id="deleteCalendar">삭제</button>
					<button type="button" id="cancelButton1" class="btn btn-secondary">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

</body>
</html>