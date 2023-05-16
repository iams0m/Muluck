<%@page import="java.util.HashMap"%>
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
<title>식물 도감</title>
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
<script type="text/javascript">
//상세보기
function fncDtl(cNo){
	with(document.searchApiForm){
		cntntsNo.value = cNo;
		method="get";
		action = "dryGardenDtl.jsp";
		target = "_self";
		submit();
	}
}

//검색
function fncSearch(){
	with(document.searchApiForm){
		stleSeCodeVal.value = fncCheckValue(document.getElementsByName("stleSeCode"));
		rdxStleCodeVal.value = fncCheckValue(document.getElementsByName("rdxStleCode"));
		grwtseVeCodeVal.value = fncCheckValue(document.getElementsByName("grwtseVeCode"));
		manageLevelCodeVal.value = fncCheckValue(document.getElementsByName("manageLevelCode"));
		manageDemandCodeVal.value = fncCheckValue(document.getElementsByName("manageDemandCode"));
		pageNo.value = "1";
		method="get";
		action = "dryGardenList.jsp";
		target = "_self";
		submit();
	}
}
//페이지 이동
function fncGoPage(page){
	with(document.searchApiForm){
		pageNo.value = page;
		method="get";
		action = "dryGardenList.jsp";
		target = "_self";
		submit();
	}
}

function fncWordTypeOption(){
	var wordType = document.getElementById("wordType")[document.getElementById("wordType").selectedIndex].value;

 	if(wordType == "cntntsSj"){
 		document.getElementById("englishSrch").style.display="none";
 		document.getElementById("koreanSrch").style.display="block";
	}else if(wordType == "plntbneNm"){
 		document.getElementById("koreanSrch").style.display="none";
 		document.getElementById("englishSrch").style.display="block";
	}
}

function fncContSearch(word){
	document.searchApiForm.word.value = word;
	fncSearch();
}

function fncCheckValue(obj){
	var checkValue = "";

	for(var i=0; i<obj.length; i++){
		if(obj[i].checked == true){
			checkValue += obj[i].value + ",";
		}
	}

	if(checkValue!="") checkValue = checkValue.substring(0, checkValue.length-1);

	return checkValue;
}

</script>
</head>
<body>
<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light" id="mainNav2">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="../main/home.jsp">Muluck</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
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
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="../main/home.jsp">홈</a></li>
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
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="../plant/plant">식물
							도감</a></li>
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
String sType = request.getParameter("sType")==null?"":request.getParameter("sType");
String wordType = request.getParameter("wordType")==null?"":request.getParameter("wordType");
String word = request.getParameter("word")==null?"":request.getParameter("word");
%>
<form name="searchApiForm">
<input type="hidden" name="cntntsNo">
<input type="hidden" name="pageNo" value="<%=request.getParameter("pageNo")==null?"":request.getParameter("pageNo")%>">
<input type="hidden" name="word" value="<%=request.getParameter("word")==null?"":request.getParameter("word")%>">
<input type="hidden" name="stleSeCodeVal" value="<%=request.getParameter("stleSeCodeVal")==null?"":request.getParameter("stleSeCodeVal")%>">
<input type="hidden" name="rdxStleCodeVal" value="<%=request.getParameter("rdxStleCodeVal")==null?"":request.getParameter("rdxStleCodeVal")%>">
<input type="hidden" name="grwtseVeCodeVal" value="<%=request.getParameter("grwtseVeCodeVal")==null?"":request.getParameter("grwtseVeCodeVal")%>">
<input type="hidden" name="manageLevelCodeVal" value="<%=request.getParameter("manageLevelCodeVal")==null?"":request.getParameter("manageLevelCodeVal")%>">
<input type="hidden" name="manageDemandCodeVal" value="<%=request.getParameter("manageDemandCodeVal")==null?"":request.getParameter("manageDemandCodeVal")%>">
<table width="100%" border="1" cellSpacing="0" cellPadding="0">
	<colgroup>
		<col width="20%"/>
		<col width="80%"/>
	</colgroup>
<%
	//apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
	String apiKey="20230515ADPCQ9DTBZW6V1AT7WOYKA"; //apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
	//서비스 명
	String serviceName="dryGarden";
	//오퍼레이션 명
	String[] operationName = {"clList", "stleSeList", "rdxStleList", "grwtseVeList", "manageLevelList", "manageDemandList"};

	HashMap<String, Document> operationNameMap = new HashMap<String, Document>();

	Document doc = null;

	for(int i=0; i<operationName.length; i++){
		//XML 받을 URL 생성
		String parameter = "/"+serviceName+"/"+operationName[i];
		parameter += "?apiKey="+ apiKey;

		//서버와 통신
		URL apiUrl = new URL("http://api.nongsaro.go.kr/service"+parameter);
		InputStream apiStream = apiUrl.openStream();

		try{
			//xml document
			doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
			operationNameMap.put(operationName[i], doc);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			apiStream.close();
		}
	}

	int size = 0;
	String resultCode="";
	String resultMsg="";
	NodeList items = null;
	NodeList codes = null;
	NodeList codeNms = null;

	if(operationNameMap.containsKey("clList")){
			doc=operationNameMap.get("clList");

			items = doc.getElementsByTagName("item");
			size = doc.getElementsByTagName("item").getLength();
			codes = doc.getElementsByTagName("code");
			codeNms = doc.getElementsByTagName("codeNm");

			try{resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultCode = "";}
			try{resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultMsg = "";}

			out.print("<tr><th>과명</th><td>");

			if(resultCode.equals("00")){
				out.print("<select name=\"sClCode\">");
				out.print("<option value=\"\">전체</option>");

				for(int i=0; i<size; i++){
					//코드
					String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
					//코드명
					String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
	%>
					<option value="<%=code%>" <%
					if(request.getParameter("sClCode") != null){
						if(code.equals(request.getParameter("sClCode"))){
							out.print("selected=\"selected\"");
						}
					}
					%> /><%=codeNm%>
	<%
				}

				out.print("</select>");
			}else{
				out.print("조회한 정보가 없습니다.");
			}
			out.print("</td></tr>");
		}
	%>
	<tr>
		<th>
			<select name="sType">
				<option value="sCntntsSj" <%=sType.equals("sCntntsSj")?"selected":""%>>식물명</option>
				<option value="sScnm" <%=sType.equals("sScnm")?"selected":""%>>학명</option>
			</select>
		</th>
		<td>
			<input type="text" class="form-control input-sm" name="sText" placeholder="식물 이름을 입력해주세요" style="display: inline-block; width: 400px;" value="<%=request.getParameter("sText")==null?"":request.getParameter("sText")%>">
			<input type="button" class="btn btn-secondary" style="display: inline-block;" name="search" value="검색" onclick="return fncSearch();"/>
		</td>
	</tr>
	<tr>
		<th>
			<select id="wordType" name="wordType" onchange="javascript:fncWordTypeOption(); return false;">
				<option value="cntntsSj" <%=wordType.equals("cntntsSj")?"selected":""%>>국명</option>
				<option value="plntbneNm" <%=wordType.equals("plntbneNm")?"selected":""%>>학명</option>
			</select>
		</th>
		<td>
			<div id="koreanSrch" style="display: <%= wordType.equals("") ? "block" : wordType.equals("cntntsSj")?"block":"none"%>;">
				<a href="#" onclick="javascript:fncContSearch('ㄱ');return false;" style="font-weight:<%=word.equals("ㄱ")?"bold":"" %>">ㄱ</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('ㄴ');return false;" style="font-weight:<%=word.equals("ㄴ")?"bold":"" %>">ㄴ</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('ㄷ');return false;" style="font-weight:<%=word.equals("ㄷ")?"bold":"" %>">ㄷ</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('ㄹ');return false;" style="font-weight:<%=word.equals("ㄹ")?"bold":"" %>">ㄹ</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('ㅁ');return false;" style="font-weight:<%=word.equals("ㅁ")?"bold":"" %>">ㅁ</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('ㅂ');return false;" style="font-weight:<%=word.equals("ㅂ")?"bold":"" %>">ㅂ</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('ㅅ');return false;" style="font-weight:<%=word.equals("ㅅ")?"bold":"" %>">ㅅ</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('ㅇ');return false;" style="font-weight:<%=word.equals("ㅇ")?"bold":"" %>">ㅇ</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('ㅈ');return false;" style="font-weight:<%=word.equals("ㅈ")?"bold":"" %>">ㅈ</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('ㅊ');return false;" style="font-weight:<%=word.equals("ㅊ")?"bold":"" %>">ㅊ</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('ㅋ');return false;" style="font-weight:<%=word.equals("ㅋ")?"bold":"" %>">ㅋ</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('ㅌ');return false;" style="font-weight:<%=word.equals("ㅌ")?"bold":"" %>">ㅌ</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('ㅍ');return false;" style="font-weight:<%=word.equals("ㅍ")?"bold":"" %>">ㅍ</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('ㅎ');return false;" style="font-weight:<%=word.equals("ㅎ")?"bold":"" %>">ㅎ</a>
			</div>
			<div id="englishSrch" style="display: <%=wordType.equals("plntbneNm")?"block":"none"%>;">
				<a href="#" onclick="javascript:fncContSearch('A');return false;" style="font-weight:<%=word.equals("A")?"bold":"" %>">A</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('B');return false;" style="font-weight:<%=word.equals("B")?"bold":"" %>">B</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('C');return false;" style="font-weight:<%=word.equals("C")?"bold":"" %>">C</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('D');return false;" style="font-weight:<%=word.equals("D")?"bold":"" %>">D</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('E');return false;" style="font-weight:<%=word.equals("E")?"bold":"" %>">E</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('F');return false;" style="font-weight:<%=word.equals("F")?"bold":"" %>">F</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('G');return false;" style="font-weight:<%=word.equals("G")?"bold":"" %>">G</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('H');return false;" style="font-weight:<%=word.equals("H")?"bold":"" %>">H</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('I');return false;" style="font-weight:<%=word.equals("I")?"bold":"" %>">I</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('J');return false;" style="font-weight:<%=word.equals("J")?"bold":"" %>">J</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('K');return false;" style="font-weight:<%=word.equals("K")?"bold":"" %>">K</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('L');return false;" style="font-weight:<%=word.equals("L")?"bold":"" %>">L</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('M');return false;" style="font-weight:<%=word.equals("M")?"bold":"" %>">M</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('N');return false;" style="font-weight:<%=word.equals("N")?"bold":"" %>">N</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('O');return false;" style="font-weight:<%=word.equals("O")?"bold":"" %>">O</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('P');return false;" style="font-weight:<%=word.equals("P")?"bold":"" %>">P</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('Q');return false;" style="font-weight:<%=word.equals("Q")?"bold":"" %>">Q</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('R');return false;" style="font-weight:<%=word.equals("R")?"bold":"" %>">R</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('S');return false;" style="font-weight:<%=word.equals("S")?"bold":"" %>">S</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('T');return false;" style="font-weight:<%=word.equals("T")?"bold":"" %>">T</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('U');return false;" style="font-weight:<%=word.equals("U")?"bold":"" %>">U</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('V');return false;" style="font-weight:<%=word.equals("V")?"bold":"" %>">V</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('W');return false;" style="font-weight:<%=word.equals("W")?"bold":"" %>">W</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('X');return false;" style="font-weight:<%=word.equals("X")?"bold":"" %>">X</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('Y');return false;" style="font-weight:<%=word.equals("Y")?"bold":"" %>">Y</a>&nbsp;
				<a href="#" onclick="javascript:fncContSearch('Z');return false;" style="font-weight:<%=word.equals("Z")?"bold":"" %>">Z</a>
			</div>
		</td>
	</tr>

<%
	if(operationNameMap.containsKey("stleSeList")){
		doc=operationNameMap.get("stleSeList");

		items = doc.getElementsByTagName("item");
		size = doc.getElementsByTagName("item").getLength();
		codes = doc.getElementsByTagName("code");
		codeNms = doc.getElementsByTagName("codeNm");

		try{resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultCode = "";}
		try{resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultMsg = "";}

		out.print("<tr><th>형태분류</th><td>");
		if(resultCode.equals("00")){
			for(int i=0; i<size; i++){
				//코드
				String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
				//코드명
				String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
%>
				<input type="checkbox" id="stleSeCode" name="stleSeCode" value="<%=code%>" <%
				if(request.getParameter("stleSeCodeVal") != null){
					String chkVar = request.getParameter("stleSeCodeVal");
					String[] chkArr = chkVar.split(",");
					for(int j=0; j<chkArr.length; j++){
						if(code.equals(chkArr[j])){
							out.print("checked");
						}
					}
				}
				%> /><%=codeNm%>&nbsp;
<%
			}

		}else{
			out.print("조회한 정보가 없습니다.");
		}
		out.print("</td></tr>");
	}
	if(operationNameMap.containsKey("rdxStleList")){
		doc=operationNameMap.get("rdxStleList");

		items = doc.getElementsByTagName("item");
		size = doc.getElementsByTagName("item").getLength();
		codes = doc.getElementsByTagName("code");
		codeNms = doc.getElementsByTagName("codeNm");

		try{resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultCode = "";}
		try{resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultMsg = "";}

		out.print("<tr><th>뿌리형태</th><td>");
		if(resultCode.equals("00")){
			for(int i=0; i<size; i++){
				//코드
				String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
				//코드명
				String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
%>
				<input type="checkbox" id="rdxStleCode" name="rdxStleCode" value="<%=code%>" <%
				if(request.getParameter("rdxStleCodeVal") != null){
					String chkVar = request.getParameter("rdxStleCodeVal");
					String[] chkArr = chkVar.split(",");
					for(int j=0; j<chkArr.length; j++){
						if(code.equals(chkArr[j])){
							out.print("checked");
						}
					}
				}
				%> /><%=codeNm%>&nbsp;
<%
			}

		}else{
			out.print("조회한 정보가 없습니다.");
		}
		out.print("</td></tr>");
	}
	//잎색 검색 조건
	if(operationNameMap.containsKey("grwtseVeList")){
		doc=operationNameMap.get("grwtseVeList");

		items = doc.getElementsByTagName("item");
		size = doc.getElementsByTagName("item").getLength();
		codes = doc.getElementsByTagName("code");
		codeNms = doc.getElementsByTagName("codeNm");

		try{resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultCode = "";}
		try{resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultMsg = "";}

		out.print("<tr><th>생장속도</th><td>");
		if(resultCode.equals("00")){
			for(int i=0; i<size; i++){
				//코드
				String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
				//코드명
				String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
%>
				<input type="checkbox" id="grwtseVeCode" name="grwtseVeCode" value="<%=code%>" <%
				if(request.getParameter("grwtseVeCodeVal") != null){
					String chkVar = request.getParameter("grwtseVeCodeVal");
					String[] chkArr = chkVar.split(",");
					for(int j=0; j<chkArr.length; j++){
						if(code.equals(chkArr[j])){
							out.print("checked");
						}
					}
				}
				%> /><%=codeNm%>&nbsp;
<%
			}

		}else{
			out.print("조회한 정보가 없습니다.");
		}
		out.print("</td></tr>");
	}
	//잎무늬 검색 조건
	if(operationNameMap.containsKey("manageLevelList")){
		doc=operationNameMap.get("manageLevelList");

		items = doc.getElementsByTagName("item");
		size = doc.getElementsByTagName("item").getLength();
		codes = doc.getElementsByTagName("code");
		codeNms = doc.getElementsByTagName("codeNm");

		try{resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultCode = "";}
		try{resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultMsg = "";}

		out.print("<tr><th>관리수준</th><td>");
		if(resultCode.equals("00")){
			for(int i=0; i<size; i++){
				//코드
				String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
				//코드명
				String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
%>
				<input type="checkbox" id="manageLevelCode" name="manageLevelCode" value="<%=code%>" <%
				if(request.getParameter("manageLevelCodeVal") != null){
					String chkVar = request.getParameter("manageLevelCodeVal");
					String[] chkArr = chkVar.split(",");
					for(int j=0; j<chkArr.length; j++){
						if(code.equals(chkArr[j])){
							out.print("checked");
						}
					}
				}
				%> /><%=codeNm%>&nbsp;
<%
			}

		}else{
			out.print("조회한 정보가 없습니다.");
		}
		out.print("</td></tr>");
	}
	//꽃 색 검색 조건
	if(operationNameMap.containsKey("manageDemandList")){
		doc=operationNameMap.get("manageDemandList");

		items = doc.getElementsByTagName("item");
		size = doc.getElementsByTagName("item").getLength();
		codes = doc.getElementsByTagName("code");
		codeNms = doc.getElementsByTagName("codeNm");

		try{resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultCode = "";}
		try{resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultMsg = "";}

		out.print("<tr><th>관리요구도</th><td>");
		if(resultCode.equals("00")){
			for(int i=0; i<size; i++){
				//코드
				String code = codes.item(i).getFirstChild() == null ? "" : codes.item(i).getFirstChild().getNodeValue();
				//코드명
				String codeNm = codeNms.item(i).getFirstChild() == null ? "" : codeNms.item(i).getFirstChild().getNodeValue();
%>
				<input type="checkbox" id="manageDemandCode" name="manageDemandCode" value="<%=code%>" <%
				if(request.getParameter("manageDemandCodeVal") != null){
					String chkVar = request.getParameter("manageDemandCodeVal");
					String[] chkArr = chkVar.split(",");
					for(int j=0; j<chkArr.length; j++){
						if(code.equals(chkArr[j])){
							out.print("checked");
						}
					}
				}
				%> /><%=codeNm%>&nbsp;
<%
			}

		}else{
			out.print("조회한 정보가 없습니다.");
		}
		out.print("</td></tr>");
	}
%>
	</table>
</form>

<%
	//목록
	if(operationName.length == operationNameMap.size()){
		//오퍼레이션 명
		String operationNameList="dryGardenList";

		//XML 받을 URL 생성
		String parameter = "/"+serviceName+"/"+operationNameList;
		parameter += "?apiKey="+ apiKey;
		parameter += "&pageNo="+request.getParameter("pageNo");

		//검색 조건
		String[] searchNmArr = {"sType", "sText", "wordType", "word", "sClCode", "stleSeCodeVal", "rdxStleCodeVal", "grwtseVeCodeVal", "manageLevelCodeVal", "manageDemandCodeVal"};
		for(int i=0; i<searchNmArr.length; i++){
			if(request.getParameter(searchNmArr[i])!=null && !request.getParameter(searchNmArr[i]).equals("")){
				parameter += "&"+searchNmArr[i]+"="+ request.getParameter(searchNmArr[i]);
			}
		}
		//서버와 통신
		URL apiUrl = new URL("http://api.nongsaro.go.kr/service"+parameter);
		InputStream apiStream = apiUrl.openStream();

		try{
			//xml document
			doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			apiStream.close();
		}

		items = doc.getElementsByTagName("item");
		size = doc.getElementsByTagName("item").getLength();
		NodeList cntntsNos = doc.getElementsByTagName("cntntsNo");
		NodeList cntntsSjs = doc.getElementsByTagName("cntntsSj");
		NodeList clNms = doc.getElementsByTagName("clNm");
		NodeList scnms = doc.getElementsByTagName("scnm");
		NodeList imgUrls1 = doc.getElementsByTagName("imgUrl1");
		NodeList imgUrls2 = doc.getElementsByTagName("imgUrl2");
		NodeList thumbImgUrls1 = doc.getElementsByTagName("thumbImgUrl1");
		NodeList thumbImgUrls2 = doc.getElementsByTagName("thumbImgUrl2");

		try{resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultCode = "";}
		try{resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultMsg = "";}

		if(resultCode.equals("00")){ %>
		<hr>
		<table width="100%" border="1" cellSpacing="0" cellPadding="0">
<%
		if(size==0){
%>
			<tr>
				<td colspan="2" align="center">조회한 정보가 없습니다.</td>
			</tr>
<%
		}else{
			for(int i=0; i<size; i++){
				//콘텐츠 번호
				String cntntsNo = cntntsNos.item(i).getFirstChild() == null ? "" : cntntsNos.item(i).getFirstChild().getNodeValue();
				//콘텐츠 제목
				String cntntsSj = cntntsSjs.item(i).getFirstChild() == null ? "" : cntntsSjs.item(i).getFirstChild().getNodeValue();
				//과명
				String clNm = clNms.item(i).getFirstChild() == null ? "" : clNms.item(i).getFirstChild().getNodeValue();
				//학명
				String scnm = scnms.item(i).getFirstChild() == null ? "" : scnms.item(i).getFirstChild().getNodeValue();
				//대표 원본 이미지1
				String imgUrl1 = imgUrls1.item(i).getFirstChild() == null ? "" : imgUrls1.item(i).getFirstChild().getNodeValue();
				//대표 원본 이미지2
				String imgUrl2 = imgUrls2.item(i).getFirstChild() == null ? "" : imgUrls2.item(i).getFirstChild().getNodeValue();
				//대표이미지1
				String thumbImgUrl1 = thumbImgUrls1.item(i).getFirstChild() == null ? "" : thumbImgUrls1.item(i).getFirstChild().getNodeValue();
				//대표이미지2
				String thumbImgUrl2 = thumbImgUrls2.item(i).getFirstChild() == null ? "" : thumbImgUrls2.item(i).getFirstChild().getNodeValue();

%>
			<tr>
			    <td width="15%">
			    	<%if(!"".equals(imgUrl2)){ %>
			    		<img src="<%=imgUrl2%>" alt="<%=cntntsSj%>" style="max-width:200px; height:auto;" />
			    	<% } %>
			    	<%if("".equals(imgUrl2)){ %>
			    		<img src="<%=imgUrl1%>" alt="<%=cntntsSj%>" style="max-width:200px; height:auto;" />
			    	<% } %>
			    </td>
			    <td width="85%">
					<a href="javascript:fncDtl('<%=cntntsNo%>');"> <%=cntntsSj%>  / <%=scnm%> / <%=clNm%></a>
			    </td>
			</tr>
<%
			}
		}
%>
	</table>
<%

	//페이징 처리
		//한 페이지에 제공할 건수
		String numOfRows = "";
		//조회된 총 건수
		String totalCount = "";
		//조회할 페이지 번호
		String pageNo = "";
		try{numOfRows = doc.getElementsByTagName("numOfRows").item(0).getFirstChild().getNodeValue();}catch(Exception e){numOfRows = "";}
		try{totalCount = doc.getElementsByTagName("totalCount").item(0).getFirstChild().getNodeValue();}catch(Exception e){totalCount = "";}
		try{pageNo = doc.getElementsByTagName("pageNo").item(0).getFirstChild().getNodeValue();}catch(Exception e){pageNo = "";}

		int pageGroupSize = 10;
		int pageSize = 0;
		try{
			pageSize = Integer.parseInt(numOfRows);
		}catch(Exception e){
			pageSize = 10;
		}
		int start = 0;
		try{
			start = Integer.parseInt(pageNo);
		}catch(Exception e){
			start = 1;
		}

		int currentPage = 1;
		try{currentPage = Integer.parseInt(pageNo);}catch(Exception e){}

		int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
		int count = Integer.parseInt(totalCount);
		int number=0;

		number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호

		//페이지그룹의 갯수
		//ex) pageGroupSize가 3일 경우 '[1][2][3]'가 pageGroupCount 개 만큼 있다.
		int pageGroupCount = count/(pageSize*pageGroupSize)+( count % (pageSize*pageGroupSize) == 0 ? 0 : 1);
		//페이지 그룹 번호
		//ex) pageGroupSize가 3일 경우  '[1][2][3]'의 페이지그룹번호는 1 이고  '[2][3][4]'의 페이지그룹번호는 2 이다.
		int numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);


		if(count > 0){
			int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
			int startPage = pageGroupSize*(numPageGroup-1)+1;
			int endPage = startPage + pageGroupSize-1;
			int prtPageNo = 0;

			if(endPage > pageCount){
				endPage = pageCount;
			}

			if(numPageGroup > 1){
				prtPageNo = (numPageGroup-2)*pageGroupSize+1;
				out.println("<a href='javascript:fncGoPage("+prtPageNo+");'>[이전]</a>");
			}

			for(int i=startPage; i<=endPage; i++){
				prtPageNo = i;
				out.print("<a href='javascript:fncGoPage("+prtPageNo+");'>");
				if(currentPage == i){
					out.print("<strong>["+i+"]</strong>");
				}else{
					out.print("["+i+"]");
				}
				out.println("</a>");
			}

			if(numPageGroup < pageGroupCount){
				prtPageNo = (numPageGroup*pageGroupSize+1);
				out.println("<a href='javascript:fncGoPage("+prtPageNo+");'>[다음]</a>");
			}
		}
		//페이징 처리 끝
		}else{
			out.print(resultMsg);
		}
	}
%>
</body>
</html>