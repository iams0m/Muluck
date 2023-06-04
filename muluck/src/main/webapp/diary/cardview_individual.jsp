<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
		<c:forEach items="${list}" var="bag">
				<ul class="viewcard_total">
			<li class="viewcard">
				<div class="thumbnail1">
				<img class="thumbnail2" src="" onerror="this.src='../resources/img/mulucklogo.jpg'">
				</div>
				<div class="thumbnail_title">
				<p class="viewcard_title">${bag.title}</p>
				<p class="viewcard_contents">${bag.contents}</p>
				<p class="viewcard_date">${bag.d_date}</p>
					</div>
				</li>
			</ul>
		</c:forEach>
