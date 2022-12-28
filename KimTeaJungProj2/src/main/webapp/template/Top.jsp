<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login.jsp</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<!-- https://developers.google.com/fonts/docs/material_icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/bootstrap/js/jquery.slim.min.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/popper.min.js"></script>
<script
	src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.bundle.min.js"></script>
<style>
.jumbotron {
	padding-top: 1rem;
	padding-bottom: 1rem;
	margin-bottom: .5rem;
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-secondary navbar-dark fixed-top">
		<a class="navbar-brand" href="#"> <i class="material-icons"
			style="font-size: 2rem">home</i>
		</a>
		<% if(request.getAttribute("NOT-LOGIN") != null){ %>
		<span class="badge badge-danger"><%=request.getAttribute("NOT-LOGIN") %></span>
		<%} %>
		<!-- Toggler/collapsibe Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar-link">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse justify-content-end"
			id="navbar-link">
			<ul class="navbar-nav">

				<li class="nav-item">
				<%if(session.getAttribute("USER-ID")==null){ %>
				<a class="nav-link active" href="<%=request.getContextPath()%>/session06/Login.jsp">로그인</a>
				<%}else{ %>
				<a class="nav-link active" href="<%=request.getContextPath()%>/session06/Logout.jsp">로그아웃</a>
				<%} %>
				</li>

				<li class="nav-item"><a class="nav-link" href="<c:url value="/session06/MyPage.jsp"/>">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/bbs08/List.jsp">게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/DataRoom/List.kosmo"/>">자료실</a></li>
				<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
				<li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
						인재채용 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">인재상</a> <a class="dropdown-item"
							href="#">채용정보</a> <a class="dropdown-item" href="#">입사지원</a>
					</div></li>
				<li class="nav-item">
					<form class="form-inline" action="#">
						<input class="form-control mr-sm-2 mt-1" type="text"
							placeholder="검색어 입력">
						<button class="btn btn-success mt-1" type="submit">확인</button>

					</form>
				</li>
			</ul>
		</div>
	</nav>
	
	