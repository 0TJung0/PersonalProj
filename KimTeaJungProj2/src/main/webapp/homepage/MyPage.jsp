<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<jsp:include page="../template/Top.jsp"/>

  <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div class="hero-container" data-aos="fade-up" data-aos-delay="150">
      
       <!-- Registeration Form -->
        <div class="col-md-7 col-lg-6 ml-auto">
            <form method="post" action="<c:url value="/MyPage/MyPageHome.do"/>" >
                <div class="row">
						<div class="input-group col-lg-12 text-success">
							<h2>개인정보 수정</h2>
						</div>
	                    <!-- Email Address -->
	                    <div class="input-group col-lg-12 mb-4 text-success">
	                        <div class="input-group-prepend">
	                            <span class="input-group-text px-4 border-md border-right-0">
	                                <i class="fa fa-envelope text-muted">EMAIL</i>
	                            </span>
	                        </div>
	                        <span class="form-control border-left-0 border-md">${user.email}</span>
	                    </div>
               
	                     <!-- Phone Number -->
	                    <div class="input-group col-lg-12 mb-4">
	                        <div class="input-group-prepend">
	                            <span class="input-group-text bg-white px-4 border-md border-right-0">
	                                <i class="fa fa-phone-square text-muted">PHONE</i>
	                            </span>
	                        </div>
	                        
	                        <input id="phoneNumber" type="tel" value="${user.phone}" name="phone" placeholder="Phone Number" class="form-control border-md border-left-0 pl-3">
	                    </div>
             
	                    <!-- Last Name -->
	                    <div class="input-group col-lg-12 mb-4">
	                        <div class="input-group-prepend">
	                            <span class="input-group-text bg-white px-4 border-md border-right-0">
	                                <i class="fa fa-user text-muted">NAME</i>
	                            </span>
	                        </div>
	                        <input id="name" type="text" name="name" value="${user.name}" placeholder="Name" class="form-control border-left-0 border-md">
	                    </div>

	                    <!-- Password Confirmation -->
	                    <div class="input-group col-lg-12 mb-4">
	                        <div class="input-group-prepend">
	                            <span class="input-group-text bg-white px-4 border-md border-right-0">
	                                <i class="fa fa-lock text-muted">PASSWORD</i>
	                            </span>
	                        </div>
	                        <input type="button" value="비밀번호 변경" onclick="javascript:passChange()" />
	                    </div>
                  
						 <div class="input-group col-lg-12 mb-4 bg-white">
	                        <div class="input-group-prepend">
	                            <span class="input-group-text bg-white px-4 border-md border-right-0">
	                                <i class="fa fa-lock text-muted">GENDER</i>
	                            </span>
	                        </div>
	                        
							<div class="form-check">
								<label class="form-check-label"> 
								<input type="radio" class="form-check-input" name="gender" value="남자"
								<c:if test="${user.gender=='남자'}">checked</c:if>
								>남자</label>
							</div>
							<div class="form-check">
								<label class="form-check-label "> 
								<input type="radio" class="form-check-input" name="gender" value="여자"
								<c:if test="${user.gender=='여자'}">checked</c:if>
								>여자</label>
							</div>
							</div>
						</div>
						
	                    <!-- Job -->
	                    <div class="input-group col-lg-12 mb-4 bg-white">
	                        <div class="input-group-prepend">
	                            <span class="input-group-text bg-white px-4 border-md border-right-0">
	                                <i class="fa fa-lock text-muted">INTER</i>
	                            </span>
	                        </div>
	                        
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" name="inter" value="POL" id="POL1"
								<c:if test="${fn:contains(user.inter, 'POL')}">checked</c:if>>
								<label class="custom-control-label" for="POL1">정치</label>
							</div>
							<div class="custom-control custom-checkbox mx-2">
								<input type="checkbox" class="custom-control-input" name="inter" value="ECO" id="ECO1"
								 <c:if test="${fn:contains(user.inter, 'ECO')}">checked</c:if>
								 >
								<label class="custom-control-label" for="ECO1">경제</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" name="inter" value="ENT" id="ENT1"
								<c:if test="${fn:contains(user.inter, 'ENT')}">checked</c:if>>
								<label class="custom-control-label" for="ENT1">연예</label>
							</div>
							<div class="custom-control custom-checkbox ml-2">
								<input type="checkbox" class="custom-control-input" name="inter" value="SPO" id="SPO1"
								<c:if test="${fn:contains(user.inter, 'SPO')}">checked</c:if>>
								<label class="custom-control-label" for="SPO1">스포츠</label>
							</div>
						</div>
						
					
						<div class="input-group col-lg-12 mb-4 bg-white">
	                        <div class="input-group-prepend">
	                            <span class="input-group-text bg-white px-4 border-md border-right-0">
	                                <i class="fa fa-lock text-muted">INTER</i>
	                            </span>
	                        </div>
							<select name="grade" class="custom-select mt-3 custom-select-lg">					
								<option value="ELE" <c:if test="${user.education=='ELE'}">selected</c:if>>초등학교</option>
								<option value="MID" <c:if test="${user.education=='MID'}">selected</c:if>>중학교</option>
								<option value="HIG" <c:if test="${user.education=='HIG'}">selected</c:if>>고등학교</option>
								<option value="UNI" <c:if test="${user.education=='UNI'}">selected</c:if>>대학교</option>
							</select>
						</div>
						
						<div class="form-group col-6">
							<label class="bg-white fa fa-user text-muted">자기소개</label>
							<textarea class="form-control" rows="5" name="self">${user.self}</textarea>
						</div>
					
						<!-- Submit Button -->
	                    <div class="form-group col-lg-12 mx-auto mb-0">
	                        <input class="btn btn-primary btn-block py-2" type="submit" value="Update your account">
	                    </div>
               
              
                
                    <!-- Divider Text -->
                    <div class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
                        <div class="border-bottom w-100 ml-5"></div>
                        <span class="px-2 small text-muted font-weight-bold text-muted">OR</span>
                        <div class="border-bottom w-100 mr-5"></div>
                    </div>
                    <!-- Already Registered -->
                    <div class="text-center w-100 col-12 mb-4">
                        <p class="text-muted font-weight-bold">Already Registered? <a href="<c:url value="/Login/LoginPage.do"/>" class="text-primary ml-2">Login</a></p>
                        
                    </div>
                    
				</form>
              </div>
            
      

    </div>
  </section><!-- End Hero -->
<jsp:include page="../template/Footer.jsp"/>