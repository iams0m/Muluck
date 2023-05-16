<%@page import="java.io.InputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="java.net.URL"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>식물 도감 상세 페이지</title>
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
<style>
div {
	text-align: center;
}
</style>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light" id="mainNav2">
	<div class="container px-4 px-lg-5">
		<a class="navbar-brand" href="../main/home.jsp">Muluck</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			Menu <i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ms-auto py-4 py-lg-0">
				<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
					href="../main/test">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
					href="index.jsp">로그아웃</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<header>
	<h1 class="site-heading text-center text-faded d-none d-lg-block">
		<!-- <span class="site-heading-lower">무우럭</span>
                <span class="site-heading-upper text-primary mb-3">muluck</span> -->
		<div>
			<img src="../resources/assets/img/무우럭.png" />
		</div>
	</h1>
	</header>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
	<div class="container">
		<a class="navbar-brand text-uppercase fw-bold d-lg-none"
			href="index.jsp">Start Bootstrap</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mx-auto">
				<li class="nav-item px-lg-4"><a class="nav-link text-uppercase"
					href="../main/home.jsp">홈</a></li>
				<ul class="navbar-nav px-lg-4">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 커뮤니티 </a>
						<ul class="dropdown-menu dropdown-menu-dark">
							<li><a class="dropdown-item" href="#">자유게시판</a></li>
							<li><a class="dropdown-item" href="#">자랑게시판</a></li>
							<li><a class="dropdown-item" href="#">질문게시판</a></li>
							<li><a class="dropdown-item" href="#">오픈채팅방</a></li>
						</ul></li>
				</ul>
				<ul class="navbar-nav px-lg-4">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="myplant.jsp" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 나의 식물 </a>
						<ul class="dropdown-menu dropdown-menu-dark">
							<li><a class="dropdown-item" href="#">식물 일지</a></li>
							<li><a class="dropdown-item" href="../card/card.jsp">반려식물
									등록증</a></li>
						</ul></li>
				</ul>
				<li class="nav-item px-lg-4"><a class="nav-link text-uppercase"
					href="../plant/plant">식물 도감</a></li>
				<ul class="navbar-nav px-lg-4">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="myplant.jsp" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 상점 </a>
						<ul class="dropdown-menu dropdown-menu-dark">
							<li><a class="dropdown-item" href="#">나눔</a></li>
							<li><a class="dropdown-item" href="#">거래</a></li>
						</ul></li>
				</ul>
			</ul>
		</div>
	</div>
	</nav>
	<%
		//인테러뱅 상세조회

	//apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
	String apiKey = "20230515ADPCQ9DTBZW6V1AT7WOYKA";
	//서비스 명
	String serviceName = "dryGarden";
	//오퍼레이션 명
	String operationName = "dryGardenDtl";

	//XML 받을 URL 생성
	String parameter = "/" + serviceName + "/" + operationName;
	parameter += "?apiKey=" + apiKey;
	parameter += "&cntntsNo=" + request.getParameter("cntntsNo");

	//서버와 통신
	URL apiUrl = new URL("http://api.nongsaro.go.kr/service" + parameter);
	InputStream apiStream = apiUrl.openStream();

	Document doc = null;
	try {
		//xml document
		doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		apiStream.close();
	}
	String resultCode = "";
	String resultMsg = "";
	try {
		resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		resultCode = "";
	}
	try {
		resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		resultMsg = "";
	}

	//컨텐츠 번호
	String cntntsNo = "";
	//분류_명
	String clNm = "";
	//분류_코드설명
	String clCodeDc = "";
	//학명
	String scnm = "";
	//유통명
	String distbNm = "";
	//원산지
	String orgplce = "";
	//형태분류_명
	String stleSeNm = "";
	//꽃
	String flwrInfo = "";
	//엽색변화
	String lfclChngeInfo = "";
	//뿌리형태_명
	String rdxStleNm = "";
	//생장형
	String grwtInfo = "";
	//생장속도_명
	String grwtseVeNm = "";
	//생육온도
	String grwhTpInfo = "";
	//월동온도
	String pswntrTpInfo = "";
	//특성
	String chartrInfo = "";
	//광
	String lighttInfo = "";
	//물주기
	String waterCycleInfo = "";
	//번식
	String prpgtInfo = "";
	//고온다습
	String hgtmMhmrInfo = "";
	//병충해
	String dlthtsInfo = "";
	//관리수준_명
	String manageLevelNm = "";
	//관리요구도_명
	String manageDemandNm = "";
	//비료
	String frtlzrInfo = "";
	//배치장소
	String batchPlaceInfo = "";
	//팁
	String tipInfo = "";
	//식물명
	String cntntsSj = "";
	//대표이미지1
	String mainImgUrl1 = "";
	//대표이미지2
	String mainImgUrl2 = "";
	//광 적응성 이미지1
	String lightImgUrl1 = "";
	//광 적응성 이미지2
	String lightImgUrl2 = "";
	//광 적응성 이미지3
	String lightImgUrl3 = "";

	try {
		cntntsNo = doc.getElementsByTagName("cntntsNo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		cntntsNo = "";
	}
	try {
		clNm = doc.getElementsByTagName("clNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		clNm = "";
	}
	try {
		clCodeDc = doc.getElementsByTagName("clCodeDc").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		clCodeDc = "";
	}
	try {
		scnm = doc.getElementsByTagName("scnm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		scnm = "";
	}
	try {
		distbNm = doc.getElementsByTagName("distbNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		distbNm = "";
	}
	try {
		orgplce = doc.getElementsByTagName("orgplce").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		orgplce = "";
	}
	try {
		stleSeNm = doc.getElementsByTagName("stleSeNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		stleSeNm = "";
	}
	try {
		flwrInfo = doc.getElementsByTagName("flwrInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		flwrInfo = "";
	}
	try {
		lfclChngeInfo = doc.getElementsByTagName("lfclChngeInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		lfclChngeInfo = "";
	}
	try {
		rdxStleNm = doc.getElementsByTagName("rdxStleNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		rdxStleNm = "";
	}
	try {
		grwtInfo = doc.getElementsByTagName("grwtInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		grwtInfo = "";
	}
	try {
		grwtseVeNm = doc.getElementsByTagName("grwtseVeNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		grwtseVeNm = "";
	}
	try {
		grwhTpInfo = doc.getElementsByTagName("grwhTpInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		grwhTpInfo = "";
	}
	try {
		pswntrTpInfo = doc.getElementsByTagName("pswntrTpInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		pswntrTpInfo = "";
	}
	try {
		chartrInfo = doc.getElementsByTagName("chartrInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		chartrInfo = "";
	}
	try {
		lighttInfo = doc.getElementsByTagName("lighttInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		lighttInfo = "";
	}
	try {
		waterCycleInfo = doc.getElementsByTagName("waterCycleInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		waterCycleInfo = "";
	}
	try {
		prpgtInfo = doc.getElementsByTagName("prpgtInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		prpgtInfo = "";
	}
	try {
		hgtmMhmrInfo = doc.getElementsByTagName("hgtmMhmrInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		hgtmMhmrInfo = "";
	}
	try {
		dlthtsInfo = doc.getElementsByTagName("dlthtsInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		dlthtsInfo = "";
	}
	try {
		manageLevelNm = doc.getElementsByTagName("manageLevelNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		manageLevelNm = "";
	}
	try {
		manageDemandNm = doc.getElementsByTagName("manageDemandNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		manageDemandNm = "";
	}
	try {
		frtlzrInfo = doc.getElementsByTagName("frtlzrInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		frtlzrInfo = "";
	}
	try {
		batchPlaceInfo = doc.getElementsByTagName("batchPlaceInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		batchPlaceInfo = "";
	}
	try {
		tipInfo = doc.getElementsByTagName("tipInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		tipInfo = "";
	}
	try {
		cntntsSj = doc.getElementsByTagName("cntntsSj").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		cntntsSj = "";
	}
	try {
		mainImgUrl1 = doc.getElementsByTagName("mainImgUrl1").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		mainImgUrl1 = "";
	}
	try {
		mainImgUrl2 = doc.getElementsByTagName("mainImgUrl2").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		mainImgUrl2 = "";
	}
	try {
		lightImgUrl1 = doc.getElementsByTagName("lightImgUrl1").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		lightImgUrl1 = "";
	}
	try {
		lightImgUrl2 = doc.getElementsByTagName("lightImgUrl2").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		lightImgUrl2 = "";
	}
	try {
		lightImgUrl3 = doc.getElementsByTagName("lightImgUrl3").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		lightImgUrl3 = "";
	}

	if (resultCode.equals("00")) {
	%>
	<%-- <table  border="1" cellspacing="0" cellpadding="0">
		<colgroup>
			<col width="15%">
			<col width="*">
		</colgroup>
		<tr>
            <th>식물이미지</th>
            <td>
            	<%if(!"".equals(mainImgUrl1)){ %>
            		<img src="<%=mainImgUrl1%>" />
            	<%}%>
            	<%if(!"".equals(mainImgUrl2)){ %>
            		<img src="<%=mainImgUrl2%>" />
            	<%}%>
            </td>
        </tr>
		<tr>
            <th>식물명</th>
            <td><%=cntntsSj%></td>
        </tr>
		<tr>
            <th>과(분류)명</th>
            <td><%=clNm%></td>
        </tr>
		<tr>
            <th>과(분류) 설명</th>
            <td><%=clCodeDc%></td>
        </tr>
		<tr>
            <th>학명</th>
            <td><%=scnm%></td>
        </tr>
		<tr>
            <th>유통명</th>
            <td><%=distbNm%></td>
        </tr>
		<tr>
            <th>원산지</th>
            <td><%=orgplce%></td>
        </tr>
		<tr>
            <th>형태분류</th>
            <td><%=stleSeNm%></td>
        </tr>
		<tr>
            <th>꽃</th>
            <td><%=flwrInfo%></td>
        </tr>
		<tr>
            <th>엽색변화</th>
            <td><%=lfclChngeInfo%></td>
        </tr>
		<tr>
            <th>뿌리형태</th>
            <td><%=rdxStleNm%></td>
        </tr>
		<tr>
            <th>생장형</th>
            <td><%=grwtInfo%></td>
        </tr>
		<tr>
            <th>생장속도</th>
            <td><%=grwtseVeNm%></td>
        </tr>
		<tr>
            <th>생육온도</th>
            <td><%=grwhTpInfo%></td>
        </tr>
		<tr>
            <th>월동온도</th>
            <td><%=pswntrTpInfo%></td>
        </tr>
		<tr>
            <th>특성</th>
            <td><%=chartrInfo%></td>
        </tr>
		<tr>
            <th>광</th>
            <td><%=lighttInfo%></td>
        </tr>
		<tr>
            <th>물주기</th>
            <td><%=waterCycleInfo%></td>
        </tr>
		<tr>
            <th>번식</th>
            <td><%=prpgtInfo%></td>
        </tr>
		<tr>
            <th>고온다습</th>
            <td><%=hgtmMhmrInfo%></td>
        </tr>
		<tr>
            <th>병충해</th>
            <td><%=dlthtsInfo%></td>
        </tr>
		<tr>
            <th>관리수준</th>
            <td><%=manageLevelNm%></td>
        </tr>
		<tr>
            <th>관리요구도</th>
            <td><%=manageDemandNm%></td>
        </tr>
		<tr>
            <th>비료</th>
            <td><%=frtlzrInfo%></td>
        </tr>
		<tr>
            <th>배치장소</th>
            <td><%=batchPlaceInfo%></td>
        </tr>
		<tr>
            <th>Tip</th>
            <td><%=tipInfo%></td>
        </tr>
		<tr>
            <th>실내 광 적응성(배치 전)</th>
            <td>
            	<%if(!"".equals(lightImgUrl1)){ %>
            		<img src="<%=lightImgUrl1%>" />
            	<%}%>

            </td>
        </tr>
		<tr>
            <th>실내 광 적응성(6개월 후 발코니 창측)</th>
            <td>
            	<%if(!"".equals(lightImgUrl2)){ %>
            		<img src="<%=lightImgUrl2%>" />
            	<%}%>
            </td>
        </tr>
		<tr>
            <th>실내 광 적응성(6개월 후 발코니 내측)</th>
            <td>
            	<%if(!"".equals(lightImgUrl3)){ %>
            		<img src="<%=lightImgUrl3%>" />
            	<%}%>
            </td>
        </tr>
	</table> --%>
	<header class="bg-dark py-5">
	<div class="container px-5">
		<div class="row gx-5 align-items-center justify-content-center">
			<div class="col-lg-8 col-xl-7 col-xxl-6">
				<div class="my-5 text-center text-xl-start">
					<h1 class="display-5 fw-bolder text-white mb-2"><%=cntntsSj%></h1>
					<p class="lead fw-normal text-white-50 mb-4">산세베리아 하니는 짧고 통통하게
						생긴 잎이 귀여운 산세베리아에요. 테두리를 따라 노란 무늬가 들어간 하니, 잎 전체가 초록색인 하니, 초록색 얼룩무늬가
						있는 하니가 있어요. 키우기도 어렵지 않고 물을 가끔씩 주면 되기 때문에 초보자들에게도 추천하고 싶은 식물이에요.</p>
					<div
						class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
						<a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">살펴보기</a>
						<a class="btn btn-outline-light btn-lg px-4"
							href="../card/card.jsp">반려식물 등록증 만들기</a>
					</div>
				</div>
			</div>
			<%
				if (!"".equals(mainImgUrl1)) {
			%>
			<div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
				<img class="img-fluid rounded-3 my-5" src="<%=mainImgUrl1%>" />
			</div>
			<%
				}
			%>
			<%-- <%
				if (!"".equals(mainImgUrl2)) {
			%>
			<div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
				<img class="img-fluid rounded-3 my-5" src="<%=mainImgUrl2%>" />
			</div>
			<%
				}
			%> --%>
			<!-- <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="../resources/assets/img/pexels-samuel-crosland-2557232.jpg"/></div> -->
		</div>
	</div>
	</header>
	<%
		} else {
	out.println(resultMsg);
	}
	%>
	<!-- Features section-->
	<section class="py-5" id="features">
	<div class="container px-5 my-5">
		<div class="row gx-5">
			<div class="col-lg-4 mb-5 mb-lg-0">
				<h2 class="fw-bolder mb-0">How To Care</h2>
			</div>
			<div class="col-lg-8">
				<div class="row gx-5 row-cols-1 row-cols-md-2">
					<div class="col mb-5 h-100">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-collection"></i>
						</div>
						<h2 class="h5">물</h2>
						<p class="mb-0">Paragraph of text beneath the heading to
							explain the heading. Here is just a bit more text.</p>
					</div>
					<div class="col mb-5 h-100">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-building"></i>
						</div>
						<h2 class="h5">빛</h2>
						<p class="mb-0">Paragraph of text beneath the heading to
							explain the heading. Here is just a bit more text.</p>
					</div>
					<div class="col mb-5 mb-md-0 h-100">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-toggles2"></i>
						</div>
						<h2 class="h5">배치 장소</h2>
						<p class="mb-0">Paragraph of text beneath the heading to
							explain the heading. Here is just a bit more text.</p>
					</div>
					<div class="col h-100">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-toggles2"></i>
						</div>
						<h2 class="h5">난이도</h2>
						<p class="mb-0">Paragraph of text beneath the heading to
							explain the heading. Here is just a bit more text.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- Testimonial section-->

	<!-- Blog preview section-->
	<section class="py-5">
	<div class="container px-5 my-5">
		<div class="row gx-5 justify-content-center">
			<div class="col-lg-8 col-xl-6">
				<div class="text-center">
					<h2 class="fw-bolder">식물 자가 진단</h2>
					<p class="lead fw-normal text-muted mb-5">혹시 식물이 아픈가요?</p>
				</div>
			</div>
		</div>
		<div class="row gx-5">
			<div class="col-lg-4 mb-5">
				<div class="card h-100 shadow border-0">
					<img class="card-img-top"
						src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
					<div class="card-body p-4">
						<div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
						<a class="text-decoration-none link-dark stretched-link" href="#!"><h5
								class="card-title mb-3">줄기가 물렀어요.</h5></a>
						<p class="card-text mb-0">Some quick example text to build on
							the card title and make up the bulk of the card's content.</p>
					</div>
					<div class="card-footer p-4 pt-0 bg-transparent border-top-0">
						<div class="d-flex align-items-end justify-content-between">
							<div class="d-flex align-items-center">
								<img class="rounded-circle me-3"
									src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
								<div class="small">
									<div class="fw-bold">Kelly Rowan</div>
									<div class="text-muted">March 12, 2023 &middot; 6 min
										read</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-5">
				<div class="card h-100 shadow border-0">
					<img class="card-img-top"
						src="https://dummyimage.com/600x350/adb5bd/495057" alt="..." />
					<div class="card-body p-4">
						<div class="badge bg-primary bg-gradient rounded-pill mb-2">Media</div>
						<a class="text-decoration-none link-dark stretched-link" href="#!"><h5
								class="card-title mb-3">Another blog post title</h5></a>
						<p class="card-text mb-0">This text is a bit longer to
							illustrate the adaptive height of each card. Some quick example
							text to build on the card title and make up the bulk of the
							card's content.</p>
					</div>
					<div class="card-footer p-4 pt-0 bg-transparent border-top-0">
						<div class="d-flex align-items-end justify-content-between">
							<div class="d-flex align-items-center">
								<img class="rounded-circle me-3"
									src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
								<div class="small">
									<div class="fw-bold">Josiah Barclay</div>
									<div class="text-muted">March 23, 2023 &middot; 4 min
										read</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-5">
				<div class="card h-100 shadow border-0">
					<img class="card-img-top"
						src="https://dummyimage.com/600x350/6c757d/343a40" alt="..." />
					<div class="card-body p-4">
						<div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
						<a class="text-decoration-none link-dark stretched-link" href="#!"><h5
								class="card-title mb-3">The last blog post title is a
								little bit longer than the others</h5></a>
						<p class="card-text mb-0">Some more quick example text to
							build on the card title and make up the bulk of the card's
							content.</p>
					</div>
					<div class="card-footer p-4 pt-0 bg-transparent border-top-0">
						<div class="d-flex align-items-end justify-content-between">
							<div class="d-flex align-items-center">
								<img class="rounded-circle me-3"
									src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
								<div class="small">
									<div class="fw-bold">Evelyn Martinez</div>
									<div class="text-muted">April 2, 2023 &middot; 10 min
										read</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Call to action-->
		<aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5">
		<div
			class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
			<div class="mb-4 mb-xl-0">
				<div class="text-white-50">식물 상담으로 해결되지 않았나요?</div>
				<div class="fs-3 fw-bold text-white">1:1 상담하기</div>
			</div>
			<div class="ms-xl-4">
				<div class="input-group mb-2">
					<input class="form-control" type="text"
						placeholder="Email address..." aria-label="Email address..."
						aria-describedby="button-newsletter" />
					<button class="btn btn-outline-light" id="button-newsletter"
						type="button">Sign up</button>
				</div>
				<div class="small text-white-50">We care about privacy, and
					will never share your data.</div>
			</div>
		</div>
		</aside>
	</div>
	</section>
	</main>
	<!-- Footer-->
	<footer class="bg-dark py-4 mt-auto">
	<div class="container px-5">
		<div
			class="row align-items-center justify-content-between flex-column flex-sm-row">
			<div class="col-auto">
				<div class="small m-0 text-white">(11:00 am - 18:00 pm) /
					토,일,공휴일 휴무</div>
			</div>
			<div class="col-auto">
				<a class="link-light small" href="#!">이용약관</a> <span
					class="text-white mx-1">&middot;</span> <a class="link-light small"
					href="#!">개인정보처리방침</a> <span class="text-white mx-1">&middot;</span>
				<a class="link-light small" href="#!">사업자정보확인</a>
			</div>
		</div>
	</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
	<input type="button" onclick="javascript:fncList();" value="목록" />
	<form name="searchApiForm">
		<%
			String[] searchNmArr = {"sType", "sText", "wordType", "word", "sClCode", "stleSeCodeVal", "rdxStleCodeVal",
				"grwtseVeCodeVal", "manageLevelCodeVal", "manageDemandCodeVal"};
		for (int i = 0; i < searchNmArr.length; i++) {
			out.println("<input type='hidden' name='" + searchNmArr[i] + "' value='" + request.getParameter(searchNmArr[i])
			+ "' />");
		}
		%>
	</form>
	<script type="text/javascript">
		//목록이동
		function fncList() {
			with (document.searchApiForm) {
				method = "get";
				action = "dryGardenList.jsp";
				target = "_self";
				submit();
			}
		}
	</script>
</body>
</html>