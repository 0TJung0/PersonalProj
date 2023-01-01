<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
  <!-- ${pageContext.request.contextPath} -->
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Dewi Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../assetsmain/img/favicon.png" rel="icon">
  <link href="../assetsmain/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../assetsmain/vendor/aos/aos.css" rel="stylesheet">
  <link href="../assetsmain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assetsmain/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../assetsmain/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../assetsmain/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../assetsmain/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../assetsmain/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../assetsmain/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Dewi - v4.10.0
  * Template URL: https://bootstrapmade.com/dewi-free-multi-purpose-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="<c:url value="/Home/Homepage.do"/>">Jung</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="<c:url value="/Notice/Board.do"/>">게시판</a></li>
          <li><a class="nav-link scrollto" href="<c:url value="/MyPage/MyPageHome.do"/>">MyPage</a></li>
          <li><a class="getstarted scrollto text-info" href="<c:url value="/Logout.do"/>">LogOut</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->