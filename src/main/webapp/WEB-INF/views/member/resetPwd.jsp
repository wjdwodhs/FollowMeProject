<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />

    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

		<!-- Theme Config Js -->
		<script src="assets/js/head.js"></script>

		<!-- Bootstrap css -->
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="app-style" />

		<!-- App css -->
		<link href="assets/css/app.min.css" rel="stylesheet" type="text/css" />

		<!-- Icons css -->
		<link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
</head>
<body class="auth-fluid-pages pb-0">

  <div class="auth-fluid">
      <!--Auth fluid left content -->
      <div class="auth-fluid-form-box" style="background-color: #febe98;">
          <div class="align-items-center d-flex h-100">
              <div class="p-3">

                  <!-- Logo -->
                  <div class="auth-brand text-center text-lg-start">
                      <div class="auth-brand">
                          <a href="" class="logo logo-dark text-center">
                              <span class="logo-lg">
                                  <img src="assets/images/logo-follow.png" alt="" height="22">
                              </span>
                          </a>
      
                          <a href="" class="logo logo-light text-center">
                              <span class="logo-lg">
                                  <img src="assets/images/logo-light.png" alt="" height="22">
                              </span>
                          </a>
                      </div>
                  </div>
                  <br><br>
                  <!-- title-->
                  <h4 class="mt-0">비밀번호 재설정</h4>
                  <p class="mb-4" style="color: white;">이메일 입력 시 비밀번호 재설정을 위한 임시 비밀번호를 발급해드립니다.</p>

                  <!-- form -->
                  <form action="#">

                      <div class="mb-3">
                          <label for="email" class="form-label" style="color: black;">이메일</label>
                          <input class="form-control" type="email" id="email" required="" placeholder="이메일을 입력하세요">
                      </div>

                      <div class="text-center d-grid">
                          <button class="btn btn-primary waves-effect waves-light" type="submit" style="background-color: #f2ebda; color: black; border: none;"> 비밀번호 재설정 </button>
                      </div>

                  </form>
                  <!-- end form-->

              </div> <!-- end .card-body -->
          </div> <!-- end .align-items-center.d-flex.h-100-->
      </div>
      <!-- end auth-fluid-form-box-->

      <!-- Auth fluid right content -->
      <div class="auth-fluid-right text-center">
          
      </div>
      <!-- end Auth fluid right content -->
  </div>
  <!-- end auth-fluid-->

  <!-- Authentication js -->
    <script src="assets/js/pages/authentication.init.js"></script>

</body>
</html>