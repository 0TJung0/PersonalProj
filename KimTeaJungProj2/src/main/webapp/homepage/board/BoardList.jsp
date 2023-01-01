<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:include page="../../template/Top.jsp"/>
<section id="hero">
    <div class="hero-container" data-aos="fade-up" data-aos-delay="150">

		<div class="container " style="margin-top: 10px;">
			<div class="text-right mb-2 d-flex justify-content-end">
				<a href="<c:url value="/Notice/Write.do"/>" class="btn btn-danger">글쓰기</a>
			</div>
			<table class="table table-dark table-hover text-center">
				<thead>
					<tr>
						<th class="col-1">번호</th>
						<th>제목</th>
						<th class="col-2">클릭수</th>
						<th class="col-2">이메일</th>
						<th class="col-2">등록일</th>
					</tr>
				</thead>
				<tbody class="table-sm down-file-body">
					<c:if test="${empty records }" var="isEmpty">
						<tr>
							<td colspan="6">등록된 자료가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not isEmpty }">
						<c:forEach var="record" items="${records}" varStatus="loop">
							<tr>
								<td>${record.no }</td>
								<td class="text-left"><a href="<c:url value="/Notice/View.do?no=${record.no}&nowPage="/><c:out value="${param.nowPage}" default="1"/>">${record.title}</a></td>
								<td id="down-count${loop.count}">${record.hitCount }</td>
								<td>${record.email}</td>
								<td>${record.postDate}</td>
							</tr>	
						</c:forEach>		
					</c:if>
				</tbody>
			</table>
			<!-- 페이징 출력 -->
			${pagingString}
	
			</div>
		</div>
	
</section>
	
<jsp:include page="../../template/Footer.jsp"/>

