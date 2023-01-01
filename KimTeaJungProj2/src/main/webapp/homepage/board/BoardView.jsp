<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDTO"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../template/Top.jsp"/>
<script>
	function isDelete(){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href='${pageContext.request.contextPath}/Notice/Delete.do?no=${record.no}&nowPage=${nowPage}';
		}
	}

</script>

<section id="hero">
    <div class="hero-container" data-aos="fade-up" data-aos-delay="150">
    <div class="container" style="margin-top: 65px;">
		<div class="jumbotron">
			<h1>상세보기 페이지</h1>
		</div>
		<table class="table table-bordered table-secondary">
			<tbody class="table-sm">
				<tr>
					<th class="w-25 bg-dark text-white text-center">번호</th>
					<td>${record.no}</td>
				</tr>
				<tr>
					<th class="w-25 bg-dark text-white text-center">작성자</th>
					<td>${record.email}</td>
				</tr>
				<tr>
					<th class="w-25 bg-dark text-white text-center">작성일</th>
					<td>${record.postDate}</td>
				</tr>
				<tr>
					<th class="w-25 bg-dark text-white text-center">조회수</th>
					<td>${record.hitCount}</td>
				</tr>
				<tr>
					<th class="w-25 bg-dark text-white text-center">제목</th>
					<td>${record.title}</td>
				</tr>
				<tr>
					<th class="bg-dark text-white text-center" colspan="2">내 용</th>
				</tr>
				<tr>
					<td colspan="2">${record.content}</td>
				</tr>
			</tbody>
		</table>
		<!-- 이전글/다음글 -->
		<div>
			<table class="table table-bordered table-secondary">
				<tbody>
					<tr>
						<td class="border-top-0 bg-info" style="width: 7%">이전글</td>
						<td class="border-top-0">${map.get("PREV")==null?"이전글이 없습니다":String.format("<a href='View.do?no=%s'>%s</a>",map.get("PREV").getNo(),map.get("PREV").getTitle())}</td>
					</tr>
					<tr>
						<td class="bg-info">다음글</td>
						<td class="border-top-0">${map.get("NEXT")==null?"다음글이 없습니다":String.format("<a href='View.do?no=%s'>%s</a>",map.get("NEXT").getNo(),map.get("NEXT").getTitle())}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 수정/삭제/목록 컨트롤 버튼 -->
		<div class="text-center">
			<c:if test="${sessionScope.USER_EMAIL==record.email}">
				<a href="<c:url value="/Notice/Edit.do?no="/>${record.no}&nowPage=${nowPage==null?1:nowPage}" class="btn btn-success">수정</a> 
				<a href="javascript:isDelete()" class="btn btn-success">삭제</a> 
			</c:if>
			
			<a href="<c:url value="/Notice/Board.do?nowPage="/>${nowPage==null?1:nowPage}" class="btn btn-success">목록</a>
		</div>
	</div>
	</div>
</section>

<jsp:include page="../../template/Footer.jsp"/>
