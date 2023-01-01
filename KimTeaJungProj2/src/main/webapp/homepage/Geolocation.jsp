<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/css/geolocation.css" rel="stylesheet">


<jsp:include page="../template/Top.jsp"/>

<section id="hero">
    <div class="hero-container" data-aos="fade-up" data-aos-delay="150">
    	<fieldset>
            
            <div id="map" style="height:500px;border-radius:20px;"></div>
        </fieldset>
            <div>
            <input id='address' type='search' placeholder="주소를 입력하세요" autofocus list="data_list"/>
            <datalist id="data_list">
                <option value="가산디지털2로 123 월드메르디앙2차"></option>
                <option value="가로수길 5"></option>
                <option value="벚꽃로 309 가산디지털단지역"></option>
                <option value="양화로 160 홍대입구역"></option>
                <option value="한강대로 405 서울역"></option>
            </datalist>
                <button onclick='searchByAddress()'>주소찾기</button>
             </div>
             <span id="centerAddr"></span>
	</div>
</section>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1562cf0d70610228c4bb3f46255ade38&libraries=services"></script>

<jsp:include page="../template/Footer.jsp"/>
<script src="${pageContext.request.contextPath}/js/geolocation.js"></script>