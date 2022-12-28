<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Sing In Page</title>
</head>
<body>
<header class="header">
    <nav class="navbar navbar-expand-lg navbar-light py-3">
        <div class="container">
            <!-- Navbar Brand -->
            <a href="<c:url value="/Login/LoginPage.do"/>" class="navbar-brand">
                <img src="https://bootstrapious.com/i/snippets/sn-registeration/logo.svg" alt="logo" width="150">
            </a>
        </div>
    </nav>
</header>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/singin.css">

<div class="container">
    <div class="row py-5 mt-4 align-items-center">
        <!-- For Demo Purpose -->
        <div class="col-md-5 pr-lg-5 mb-5 mb-md-0">
            <img src="https://bootstrapious.com/i/snippets/sn-registeration/illustration.svg" alt="" class="img-fluid mb-3 d-none d-md-block">
            <h1>Create an Account</h1>
            <p class="font-italic text-muted mb-0">새로운 계정을 만들어보세요.</p>
        </div>

        <!-- Registeration Form -->
        <div class="col-md-7 col-lg-6 ml-auto">
            <form method="post" action="<c:url value="/Login/SingIn.do"/>">
                <div class="row">
\
	                    <!-- Email Address -->
	                    <div class="input-group col-lg-12 mb-4">
	                        <div class="input-group-prepend">
	                            <span class="input-group-text bg-white px-4 border-md border-right-0">
	                                <i class="fa fa-envelope text-muted"></i>
	                            </span>
	                        </div>
	                        <input id="email" type="email" name="email" placeholder="Email Address" class="form-control bg-white border-left-0 border-md">
	                    </div>
               
	                    <!-- Phone Number -->
	                    <div class="input-group col-lg-12 mb-4">
	                        <div class="input-group-prepend">
	                            <span class="input-group-text bg-white px-4 border-md border-right-0">
	                                <i class="fa fa-phone-square text-muted"></i>
	                            </span>
	                        </div>
	                        
	                        <input id="phoneNumber" type="tel" name="phone" placeholder="Phone Number" class="form-control border-md border-left-0 pl-3">
	                    </div>
             
	                    <!-- Last Name -->
	                    <div class="input-group col-lg-12 mb-4">
	                        <div class="input-group-prepend">
	                            <span class="input-group-text bg-white px-4 border-md border-right-0">
	                                <i class="fa fa-user text-muted"></i>
	                            </span>
	                        </div>
	                        <input id="name" type="text" name="name" placeholder="Name" class="form-control border-left-0 border-md">
	                    </div>
					
	                    <!-- Password -->
	                    <div class="input-group col-lg-12 mb-4">
	                        <div class="input-group-prepend">
	                            <span class="input-group-text bg-white px-4 border-md border-right-0">
	                                <i class="fa fa-lock text-muted"></i>
	                            </span>
	                        </div>
	                        <input id="password" type="password" name="password" placeholder="Password" class="form-control bg-white border-left-0 border-md">
	                    </div>
					
	                    <!-- Password Confirmation -->
	                    <div class="input-group col-lg-12 mb-4">
	                        <div class="input-group-prepend">
	                            <span class="input-group-text bg-white px-4 border-md border-right-0">
	                                <i class="fa fa-lock text-muted"></i>
	                            </span>
	                        </div>
	                        <input id="passwordConfirmation" type="text" name="passwordConfirmation" placeholder="Confirm Password" class="form-control bg-white border-left-0 border-md">
	                    </div>
                  
						<div class="form-group col-12">
							<label class="bg-white fa fa-user text-muted">성별</label>
							<div class="form-check">
								<label class="form-check-label"> 
								<input type="radio" class="form-check-input" name="gender" value="남자">남자</label>
							</div>
							<div class="form-check">
								<label class="form-check-label "> 
								<input type="radio" class="form-check-input" name="gender" value="여자">여자</label>
							</div>
						</div>
					
	                    <!-- Job -->
	                    <div class="form-group col-12">
							<label class="bg-white fa fa-user text-muted">관심사항</label>
							<div class="d-flex">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" name="inter" value="POL" id="POL1">
									<label class="custom-control-label" for="POL1">정치</label>
								</div>
								<div class="custom-control custom-checkbox mx-2">
									<input type="checkbox" class="custom-control-input" name="inter" value="ECO" id="ECO1">
									<label class="custom-control-label" for="ECO1">경제</label>
								</div>
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" name="inter" value="ENT" id="ENT1">
									<label class="custom-control-label" for="ENT1">연예</label>
								</div>
								<div class="custom-control custom-checkbox ml-2">
									<input type="checkbox" class="custom-control-input" name="inter" value="SPO" id="SPO1">
									<label class="custom-control-label" for="SPO1">스포츠</label>
									</div>
								</div>
						</div>
				
						<div class="form-group col-12">
						<label class="bg-white fa fa-user text-muted">학력사항</label> 
							<select name="grade" class="custom-select mt-3 custom-select-lg">					
								<option value="ELE">초등학교</option>
								<option value="MID">중학교</option>
								<option value="HIG">고등학교</option>
								<option value="UNI">대학교</option>
							</select>
						</div>
				
						<div class="form-group col-12">
							<label class="bg-white fa fa-user text-muted">자기소개</label>
							<textarea class="form-control" rows="5" name="self"></textarea>
						</div>
					
						<!-- Submit Button -->
	                    <div class="form-group col-lg-12 mx-auto mb-0">
	                        <input class="btn btn-primary btn-block py-2" type="submit" value="Create your account">
	                    </div>
               
              \
                
                    <!-- Divider Text -->
                    <div class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
                        <div class="border-bottom w-100 ml-5"></div>
                        <span class="px-2 small text-muted font-weight-bold text-muted">OR</span>
                        <div class="border-bottom w-100 mr-5"></div>
                    </div>
                    <!-- Already Registered -->
                    <div class="text-center w-100">
                        <p class="text-muted font-weight-bold">Already Registered? <a href="<c:url value="/Login/LoginPage.do"/>" class="text-primary ml-2">Login</a></p>
                        
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
<script src="${pageContext.request.contextPath}/js/singin.js"></script>