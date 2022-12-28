<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Blogr</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mainpage_css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mainpage_css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainpage_css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="${pageContext.request.contextPath}/images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainpage_css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <!-- fonts -->
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <!-- owl stylesheets --> 
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainpage_css/owl.carousel.min.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainpage_css/owl.theme.default.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
  <style>
	a{
		color:white;
	}
	a:hover{
		color:yellow;
	}

</style>
   </head>
   <body>
      <!--header section start -->
      <div class="header_section">
         <div class="container-fluid">
            <div class="row">
               <div class="col-sm-12">
                  <div class="logo"><a href="index.html"><img src="${pageContext.request.contextPath}/images/logo.png"></a></div>
                  <div class="menu_text">
                     <ul>
                        <div class="togle_3">
                           <div class="shoping_bag"><a href="#"><img src="${pageContext.request.contextPath}/images/user-icon.png"></a>
                              <span class="padding_left_40"><a href="#"><img src="${pageContext.request.contextPath}/images/search-icon.png"></a></span>
                           </div>
                           <div id="myNav" class="overlay">
                              <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                              <div class="overlay-content">
                                 <a href="index.html">Home</a>
                                 <a href="<c:url value="/Notice/Board.do"/>">게시판</a>
                                 <a href="blog.html">마이페이지</a>
                                 <a href="contact.html">로그아웃</a>
                                 <a href="contact.html">Contact</a>
                              </div>
                           </div>
                           <span class="navbar-toggler-icon"></span>
                           <span onclick="openNav()"><img src="${pageContext.request.contextPath}/images/toogle-icon.png" class="toggle_menu"></span>
                        </div>
                     </ul>
                  </div>
               </div>
            </div>
         </div>

<div class="container" style="margin-top: 65px;">

	<div class="jumbotron bg-warning">
		<h1>자료실 목록 <small>모든 자료실의 목록입니다</small></h1>
	</div>
	<div class="text-right mb-2">
		<a href="<c:url value="/DataRoom/Write.kosmo"/>" class="btn btn-danger">자료등록</a>
	</div>
	<table class="table table-dark table-hover text-center">
		<thead>
			<tr>
				<th class="col-1">번호</th>
				<th>제목</th>
				<th class="col-2">올린이</th>
				<th class="col-2">자료파일</th>
				<th class="col-1">다운수</th>
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
						<td class="text-left"><a href="<c:url value="/DataRoom/View.kosmo?no=${record.no}&nowPage="/><c:out value="${param.nowPage}" default="1"/>">${record.title}</a></td>
						<td>${record.email}</td>
						
						<td id="down-count${loop.count}">${record.hitCount }</td>
						<td>${record.heartCount}</td>
						<td>${record.postDate}</td>
					</tr>	
				</c:forEach>		
			</c:if>
		</tbody>
	</table>
	<!-- 페이징 출력 -->
	${pagingString}
	
</div>

<script>
	
	var tbody = document.querySelector(".down-file-body");
	tbody.onclick=function(e){
		console.log(e.target.nodeName);
		if(e.target.nodeName==='A'){
			console.log('클릭한 A태그의 클래스명:',e.target.className);
			//a태그의 클래스명에서 끝에 숫자 추출
			var className = e.target.className;
			var numbering = className.substring("down-file".length,className.length);
			console.log("넘버링 숫자:",numbering);
			//아이디로 다운수가 있는  td요소 얻기
			var td=tbody.querySelector("#down-count"+numbering);
			//다운수 읽어오기(숫자로 변환)
			var downCount=parseInt(td.textContent);
			//1을 더해서 다시 설정
			td.textContent=downCount+1;
		}
		
		
	};

</script>
