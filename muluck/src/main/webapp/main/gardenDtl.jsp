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
	String serviceName = "garden";
	//오퍼레이션 명
	String operationName = "gardenDtl";
	
	

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

	//콘텐츠 번호
	String cntntsNo = "";
	//식물 학명         
	String plntbneNm = "";
	//식물 영명        
	String plntzrNm = "";
	//유통 명                 
	String distbNm = "";
	//과명                  
	String fmlNm = "";
	//원산지 명           
	String orgplceInfo = "";
	//조언 정보                  
	String adviseInfo = "";
	//이미지 평가 링크 명          
	String imageEvlLinkCours = "";
	//성장 높이 정보               
	String growthHgInfo = "";
	//성장 넓이 정보              
	String growthAraInfo = "";
	//잎 형태 정보             
	String lefStleInfo = "";
	//냄새 코드               
	String smellCode = "";
	//독정 정보                 
	String toxctyInfo = "";
	//번식 시기             
	String prpgtEraInfo = "";
	//기타 시기 정보             
	String etcEraInfo = "";
	//관리수준 코드          
	String managelevelCode = "";
	//생장속도 코드             
	String grwtveCode = "";
	//생육 온도 코드        
	String grwhTpCode = "";
	//겨울 최저 온도 코드         
	String winterLwetTpCode = "";
	//습도 코드    
	String hdCode = "";
	//비료 정보                 
	String frtlzrInfo = "";
	//토양 정보           
	String soilInfo = "";
	//물주기 봄 코드          
	String watercycleSprngCode = "";
	//물주기 여름 코드            
	String watercycleSummerCode = "";
	//물주기 가을 코드            
	String watercycleAutumnCode = "";
	//물주기 겨울 코드               
	String watercycleWinterCode = "";
	//병충해 관리 정보          
	String dlthtsManageInfo = "";
	//특별관리 정보              
	String speclmanageInfo = "";
	//기능성 정보                 
	String fncltyInfo = "";
	//화분직경 대 정보       
	String flpodmtBigInfo = "";
	//화분직경 중 정보              
	String flpodmtMddlInfo = "";
	//화분직경 소 정보                
	String flpodmtSmallInfo = "";
	//가로 대 정보                  
	String widthBigInfo = "";
	//가로 중 정보                 
	String widthMddlInfo = "";
	//가로 소 정보                  
	String widthSmallInfo = "";
	//세로 대 정보                 
	String vrticlBigInfo = "";
	//세로 중 정보                
	String vrticlMddlInfo = "";
	//세로 소 정보                   
	String vrticlSmallInfo = "";
	//높이 대 정보                 
	String hgBigInfo = "";
	//높이 중 정보                    
	String hgMddlInfo = "";
	//높이 소 정보                  
	String hgSmallInfo = "";
	//볼륨 대 정보                   
	String volmeBigInfo = "";
	//볼륨 중 정보                   
	String volmeMddlInfo = "";
	//볼륨 소 정보                  
	String volmeSmallInfo = "";
	//가격 대 정보                
	String pcBigInfo = "";
	//가격 중 정보               
	String pcMddlInfo = "";
	//가격 소 정보                
	String pcSmallInfo = "";
	//관리요구도 코드                  
	String managedemanddoCode = "";

	try {
		cntntsNo = doc.getElementsByTagName("cntntsNo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		cntntsNo = "";
	}
	try {
		plntbneNm = doc.getElementsByTagName("plntbneNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		plntbneNm = "";
	}
	try {
		plntzrNm = doc.getElementsByTagName("plntzrNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		plntzrNm = "";
	}
	try {
		distbNm = doc.getElementsByTagName("distbNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		distbNm = "";
	}
	try {
		fmlNm = doc.getElementsByTagName("fmlCodeNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		fmlNm = "";
	}
	try {
		orgplceInfo = doc.getElementsByTagName("orgplceInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		orgplceInfo = "";
	}
	try {
		adviseInfo = doc.getElementsByTagName("adviseInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		adviseInfo = "";
	}
	try {
		imageEvlLinkCours = doc.getElementsByTagName("imageEvlLinkCours").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		imageEvlLinkCours = "";
	}
	try {
		growthHgInfo = doc.getElementsByTagName("growthHgInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		growthHgInfo = "";
	}
	try {
		growthAraInfo = doc.getElementsByTagName("growthAraInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		growthAraInfo = "";
	}
	try {
		lefStleInfo = doc.getElementsByTagName("lefStleInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		lefStleInfo = "";
	}
	try {
		smellCode = doc.getElementsByTagName("smellCode").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		smellCode = "";
	}
	try {
		toxctyInfo = doc.getElementsByTagName("toxctyInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		toxctyInfo = "";
	}
	try {
		prpgtEraInfo = doc.getElementsByTagName("prpgtEraInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		prpgtEraInfo = "";
	}
	try {
		etcEraInfo = doc.getElementsByTagName("etcEraInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		etcEraInfo = "";
	}
	try {
		managelevelCode = doc.getElementsByTagName("managelevelCodeNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		managelevelCode = "";
	}
	try {
		grwtveCode = doc.getElementsByTagName("grwtveCodeNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		grwtveCode = "";
	}
	try {
		grwhTpCode = doc.getElementsByTagName("grwhTpCodeNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		grwhTpCode = "";
	}
	try {
		winterLwetTpCode = doc.getElementsByTagName("winterLwetTpCodeNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		winterLwetTpCode = "";
	}
	try {
		hdCode = doc.getElementsByTagName("hdCodeNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		hdCode = "";
	}
	try {
		frtlzrInfo = doc.getElementsByTagName("frtlzrInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		frtlzrInfo = "";
	}
	try {
		soilInfo = doc.getElementsByTagName("soilInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		soilInfo = "";
	}
	try {
		watercycleSprngCode = doc.getElementsByTagName("watercycleSprngCodeNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		watercycleSprngCode = "";
	}
	try {
		watercycleSummerCode = doc.getElementsByTagName("watercycleSummerCodeNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		watercycleSummerCode = "";
	}
	try {
		watercycleAutumnCode = doc.getElementsByTagName("watercycleAutumnCodeNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		watercycleAutumnCode = "";
	}
	try {
		watercycleWinterCode = doc.getElementsByTagName("watercycleWinterCodeNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		watercycleWinterCode = "";
	}
	try {
		dlthtsManageInfo = doc.getElementsByTagName("dlthtsManageInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		dlthtsManageInfo = "";
	}
	try {
		speclmanageInfo = doc.getElementsByTagName("speclmanageInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		speclmanageInfo = "";
	}
	try {
		fncltyInfo = doc.getElementsByTagName("fncltyInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		fncltyInfo = "";
	}
	try {
		flpodmtBigInfo = doc.getElementsByTagName("flpodmtBigInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		flpodmtBigInfo = "";
	}
	try {
		flpodmtMddlInfo = doc.getElementsByTagName("flpodmtMddlInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		flpodmtMddlInfo = "";
	}
	try {
		flpodmtSmallInfo = doc.getElementsByTagName("flpodmtSmallInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		flpodmtSmallInfo = "";
	}
	try {
		widthBigInfo = doc.getElementsByTagName("widthBigInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		widthBigInfo = "";
	}
	try {
		widthMddlInfo = doc.getElementsByTagName("widthMddlInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		widthMddlInfo = "";
	}
	try {
		widthSmallInfo = doc.getElementsByTagName("widthSmallInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		widthSmallInfo = "";
	}
	try {
		vrticlBigInfo = doc.getElementsByTagName("vrticlBigInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		vrticlBigInfo = "";
	}
	try {
		vrticlMddlInfo = doc.getElementsByTagName("vrticlMddlInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		vrticlMddlInfo = "";
	}
	try {
		vrticlSmallInfo = doc.getElementsByTagName("vrticlSmallInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		vrticlSmallInfo = "";
	}
	try {
		hgBigInfo = doc.getElementsByTagName("hgBigInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		hgBigInfo = "";
	}
	try {
		hgMddlInfo = doc.getElementsByTagName("hgMddlInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		hgMddlInfo = "";
	}
	try {
		hgSmallInfo = doc.getElementsByTagName("hgSmallInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		hgSmallInfo = "";
	}
	try {
		volmeBigInfo = doc.getElementsByTagName("volmeBigInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		volmeBigInfo = "";
	}
	try {
		volmeMddlInfo = doc.getElementsByTagName("volmeMddlInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		volmeMddlInfo = "";
	}
	try {
		volmeSmallInfo = doc.getElementsByTagName("volmeSmallInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		volmeSmallInfo = "";
	}
	try {
		pcBigInfo = doc.getElementsByTagName("pcBigInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		pcBigInfo = "";
	}
	try {
		pcMddlInfo = doc.getElementsByTagName("pcMddlInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		pcMddlInfo = "";
	}
	try {
		pcSmallInfo = doc.getElementsByTagName("pcSmallInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		pcSmallInfo = "";
	}
	try {
		managedemanddoCode = doc.getElementsByTagName("managedemanddoCodeNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		managedemanddoCode = "";
	}

	if (resultCode.equals("00")) {
	%>
	<header class="bg-dark py-5">
	<div class="container px-5">
		<div class="row gx-5 align-items-center justify-content-center">
			<div class="col-lg-8 col-xl-7 col-xxl-6">
				<div class="my-5 text-center text-xl-start">
				<p class="lead fw-normal text-white-50 mb-4"><%=plntbneNm%></p>
				<p class="lead fw-normal text-white-50 mb-4"><%=fmlNm%></p>
					<h1 class="display-5 fw-bolder text-white mb-2"><%=distbNm%></h1>
					<p class="lead fw-normal text-white-50 mb-4"><%=fncltyInfo%></p>
					<div
						class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
						<a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">살펴보기</a>
						<a class="btn btn-outline-light btn-lg px-4"
							href="../card/card.jsp">반려식물 등록증 만들기</a>
					</div>
				</div>
			</div>
			<div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="../resources/assets/img/pexels-samuel-crosland-2557232.jpg"/></div>
		</div>
		<%
			}
		%>
		<%-- 
				<% if (!"".equals(mainImgUrl2)) {
			%>
			<div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
				<img class="img-fluid rounded-3 my-5" src="<%=mainImgUrl2%>" />
				
			</div>
			<%
				}
			%> --%>
		<!-- <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="../resources/assets/img/pexels-samuel-crosland-2557232.jpg"/></div> -->
	</div>
	</header>
	<table  border="1" cellspacing="0" cellpadding="0">
		<colgroup>
			<col width="15%">
			<col width="*">
		</colgroup>
		<%-- <tr>
            <th>식물학명</th>
            <td><%=plntbneNm%></td>
        </tr> --%>
        <%-- <tr>
            <th>식물영명</th>
            <td><%=plntzrNm%></td>
        </tr> --%>
        <%-- <tr>
            <th>유통명</th>
            <td><%=distbNm%></td>
        </tr> --%>
        <%-- <tr>
            <th>과명</th>
            <td><%=fmlNm%></td>
        </tr>
        <tr>
            <th>원산지 정보</th>
            <td><%=orgplceInfo%></td>
        </tr> --%>
        <%-- <tr>
            <th>조언 정보</th>
            <td><%=adviseInfo%></td>
        </tr> --%>
        <%-- <tr>
            <th>이미지 평가 링크 경로</th>
            <td><%=imageEvlLinkCours%></td>
        </tr> --%>
        <%-- <tr>
            <th>성장 높이 정보</th>
            <td><%=growthHgInfo%></td>
        </tr>
        <tr>
            <th>성장 넓이 정보</th>
            <td><%=growthAraInfo%></td>
        </tr>
        <tr>
            <th>잎 형태 정보</th>
            <td><%=lefStleInfo%></td>
        </tr> --%>
        <%-- <tr>
            <th>냄새 코드</th>
            <td><%=smellCode%></td>
        </tr>
        <tr>
            <th>독성 정보</th>
            <td><%=toxctyInfo%></td>
        </tr>
        <tr>
            <th>번식 시기 정보</th>
            <td><%=prpgtEraInfo%></td>
        </tr> --%>
        <%-- <tr>
            <th>기타 시기 정보</th>
            <td><%=etcEraInfo%></td>
        </tr> --%>
       <%--  <tr>
            <th>관리수준</th>
            <td><%=managelevelCode%></td>
        </tr> --%>
        <%-- <tr>
            <th>생장속도</th>
            <td><%=grwtveCode%></td>
        </tr> --%>
        <%-- <tr>
            <th>생육 온도</th>
            <td><%=grwhTpCode%></td>
        </tr> --%>
        <%-- <tr>
            <th>겨울 최저 온도</th>
            <td><%=winterLwetTpCode%></td>
        </tr> --%>
        <%-- <tr>
            <th>습도</th>
            <td><%=hdCode%></td>
        </tr> --%>
        <%-- <tr>
            <th>비료 정보</th>
            <td><%=frtlzrInfo%></td>
        </tr>
        <tr>
            <th>토양 정보</th>
            <td><%=soilInfo%></td>
        </tr> --%>
        <%-- <tr>
            <th>물주기 봄</th>
            <td><%=watercycleSprngCode%></td>
        </tr>
        <tr>
            <th>물주기 여름</th>
            <td><%=watercycleSummerCode%></td>
        </tr>
        <tr>
            <th>물주기 가을</th>
            <td><%=watercycleAutumnCode%></td>
        </tr>
        <tr>
            <th>물주기 겨울</th>
            <td><%=watercycleWinterCode%></td>
        </tr> --%>
       <%--  <tr>
            <th>병충해 관리 정보</th>
            <td><%=dlthtsManageInfo%></td>
        </tr>
        <tr>
            <th>특별관리 정보</th>
            <td><%=speclmanageInfo%></td>
        </tr> --%>
        <%-- <tr>
            <th>기능성 정보</th>
            <td><%=fncltyInfo%></td>
        </tr> --%>
<%--         <tr>
            <th>화분직경 대 정보</th>
            <td><%=flpodmtBigInfo%></td>
        </tr>
        <tr>
            <th>화분직경 중 정보</th>
            <td><%=flpodmtMddlInfo%></td>
        </tr>
        <tr>
            <th>화분직경 소 정보</th>
            <td><%=flpodmtSmallInfo%></td>
        </tr>
        <tr>
            <th>가로 대 정보</th>
            <td><%=widthBigInfo%></td>
        </tr>
        <tr>
            <th>가로 중 정보</th>
            <td><%=widthMddlInfo%></td>
        </tr>
        <tr>
            <th>가로 소 정보</th>
            <td><%=widthSmallInfo%></td>
        </tr>
        <tr>
            <th>세로 대 정보</th>
            <td><%=vrticlBigInfo%></td>
        </tr>
        <tr>
            <th>세로 중 정보</th>
            <td><%=vrticlMddlInfo%></td>
        </tr>
        <tr>
            <th>세로 소 정보</th>
            <td><%=vrticlSmallInfo%></td>
        </tr>
        <tr>
            <th>높이 대 정보</th>
            <td><%=hgBigInfo%></td>
        </tr>
        <tr>
            <th>높이 중 정보</th>
            <td><%=hgMddlInfo%></td>
        </tr>
        <tr>
            <th>높이 소 정보</th>
            <td><%=hgSmallInfo%></td>
        </tr>
        <tr>
            <th>볼륨 대 정보</th>
            <td><%=volmeBigInfo%></td>
        </tr>
        <tr>
            <th>볼륨 중 정보</th>
            <td><%=volmeMddlInfo%></td>
        </tr>
        <tr>
            <th>볼륨 소 정보</th>
            <td><%=volmeSmallInfo%></td>
        </tr>
        <tr>
            <th>가격 대 정보</th>
            <td><%=pcBigInfo%></td>
        </tr>
        <tr>
            <th>가격 중 정보</th>
            <td><%=pcMddlInfo%></td>
        </tr>
        <tr>
            <th>가격 소 정보</th>
            <td><%=pcSmallInfo%></td>
        </tr> --%>
        <%-- <tr>
            <th>관리요구도 코드</th>
            <td><%=managedemanddoCode%></td>
        </tr> --%>
	</table>
	<%-- <%
	}else{
		out.println(resultMsg);
	}
%> --%>
<%-- 	<!-- Features section-->
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
						<p class="mb-0">봄 : <%=watercycleSprngCode%><br>
										여름 : <%=watercycleSummerCode%><br>
										가을 : <%=watercycleAutumnCode%><br>
										겨울 : <%=watercycleWinterCode%></p>
					</div>
					<div class="col mb-5 h-100">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-building"></i>
						</div>
						<h2 class="h5">온도</h2>
						<p class="mb-0"><%=grwhTpCode%>의 온도에서 잘 자라요</p>
					</div>
					<div class="col mb-5 mb-md-0 h-100">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-toggles2"></i>
						</div>
						<h2 class="h5">습도</h2>
						<p class="mb-0"><%=hdCode%><br>
						주변 공기가 건조해지지 않도록 관리해주세요</p>
					</div>
					<div class="col h-100">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-toggles2"></i>
						</div>
						<h2 class="h5">난이도</h2>
						<p class="mb-0"><%=managelevelCode%>가 키우면 좋아요</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section> --%>
	<!-- Testimonial section-->

	<!-- Blog preview section-->
	<section class="py-5">
	<div class="container px-5 my-5">
		<div class="row gx-5 justify-content-center">
			<div class="col-lg-8 col-xl-6">
				<div class="text-center">
					<h2 class="fw-bolder">How To Care</h2>
					<p class="lead fw-normal text-muted mb-5">자세히 알아보기</p>
				</div>
			</div>
		</div>
		<div class="row gx-5">
			<div class="col-lg-4 mb-5">
				<div class="card h-100 shadow border-0">
					<img class="card-img-top"
						src="../resources/assets/img/pexels-cottonbro-studio-9730466.jpg" />
					<div class="card-body p-4">
						<div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
						<a class="text-decoration-none link-dark stretched-link" href="#!"><h5
								class="card-title mb-3">물</h5></a>
						<p class="card-text mb-0">봄 : <%=watercycleSprngCode%><br>
										여름 : <%=watercycleSummerCode%><br>
										가을 : <%=watercycleAutumnCode%><br>
										겨울 : <%=watercycleWinterCode%></p>
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
						src="../resources/assets/img/pexels-koolshooters-6627066.jpg" />
					<div class="card-body p-4">
						<div class="badge bg-primary bg-gradient rounded-pill mb-2">Media</div>
						<a class="text-decoration-none link-dark stretched-link" href="#!"><h5
								class="card-title mb-3">온도</h5></a>
						<p class="card-text mb-0"><%=grwhTpCode%>의 온도에서 잘 자라요</p>
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
						src="../resources/assets/img/pexels-cottonbro-studio-4503261.jpg" />
					<div class="card-body p-4">
						<div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
						<a class="text-decoration-none link-dark stretched-link" href="#!"><h5
								class="card-title mb-3">난이도</h5></a>
						<p class="card-text mb-0"><%=managelevelCode%>가 키우면 좋아요</p>
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
			String[] searchNmArr = {"pageNo", "sType", "sText", "wordType", "word", "lightChkVal", "grwhstleChkVal",
				"lefcolrChkVal", "lefmrkChkVal", "flclrChkVal", "fmldecolrChkVal", "ignSeasonChkVal", "winterLwetChkVal",
				"priceType", "priceTypeSel", "waterCycleSel"};
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
				action = "gardenList.jsp";
				target = "_self";
				submit();
			}
		}
	</script>
</body>
</html>