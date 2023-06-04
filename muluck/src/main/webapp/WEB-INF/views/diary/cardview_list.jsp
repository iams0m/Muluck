<%@page import="java.util.Collections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
		<c:forEach items="${list}" var="bag">
				<ul class="viewcard_total">
			<li class="viewcard">
				<div class="thumbnail1">
				<img class="thumbnail2" src="" onerror="this.src='../resources/img/mulucklogo.jpg'" alt="썸네일사진">
				
				</div>
				<div class="thumbnail_title">
				<p class="viewcard_nickname"><a href="cardview_individual?d_nickname=${bag.d_nickname}&member_no=1">${bag.d_nickname}</a></p>
				<p class="viewcard_date">${bag.d_date}</p>
					</div>
				</li>
			</ul>
		</c:forEach>
