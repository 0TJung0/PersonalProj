<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 여부 판단:필터 사용시 아래 주석처리 -->
<%-- 
<jsp:include page="/common/IsMember.jsp" />
--%>


<jsp:include page="../../template/Top.jsp"/>
<section id="hero">
    <div class="hero-container" data-aos="fade-up" data-aos-delay="150">
		<div class="container" style="margin-top: 65px;">
		
			<div class="jumbotron bg-warning">
				<h1>등록 페이지</h1>
			</div>
			<form method="post" action="<c:url value="/Notice/Write.do"/>">
				<div class="form-group">
					<label><kbd class="lead">제목</kbd></label> <input type="text"
						class="form-control" placeholder="제목을 입력하세요" name="title">
				</div>
				<div class="form-group">
					<label><kbd class="lead">내용</kbd></label>
					<textarea class="form-control" rows="5" name="content"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">등록</button>
			</form>
		</div>
	</div>
</section>
<jsp:include page="../../template/Footer.jsp"/>
