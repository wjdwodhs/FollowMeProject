<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">

<head>
    <meta charset="utf-8" />
    <title>Log In | Ubold - Responsive Bootstrap 5 Admin Dashboard</title>
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

 <style>
   .p-3{
       display: flex;
       flex-direction: column;
       align-items: center;
       justify-content: center;
       margin:auto;
   }
</style>
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
                                        <img src="${ contextPath }/assets/images/logo-follow.png" alt="" height="30">
                                    </span>
                                </a>
            
                            </div>
                        </div>

                        <!-- title
                        <h4 class="mt-0">Sign In</h4>
                        <p class="text-muted mb-4">사번과 비밀번호를 입력하세요.</p>
                        -->
                        
                        <!-- form -->
                        <form action="#">
                            <div class="mb-3">
                                <label for="emailaddress" class="form-label" style="color:white; font-weight: bold;">사번</label>
                                <input class="form-control" type="email" id="emailaddress" required="" placeholder="사번을 입력하세요">
                            </div>
                            <div class="mb-3">
                                <a href="auth-recoverpw-2.html" class="text-muted float-end"><small>비밀번호 재설정</small></a>
                                <label for="password" class="form-label" style="color: white; font-weight: bold;">비밀번호</label>
                                <div class="input-group input-group-merge">
                                    <input type="password" id="password" class="form-control" placeholder="비밀번호를 입력하세요">
                                    <div class="input-group-text" data-password="false">
                                        <span class="password-eye"></span>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="checkbox-signin">
                                    <label class="form-check-label" for="checkbox-signin">사번 저장</label>
                                </div>
                            </div>
                            <div class="text-center d-grid">
                                <button class="btn btn-primary" type="submit" style="background-color: #f2e8da; border: none; color: black;" >로그인 </button>
                            </div>
                            <!-- social
                            <div class="text-center mt-4">
                                <p class="text-muted font-16">Sign in with</p>
                                <ul class="social-list list-inline mt-3">
                                    <li class="list-inline-item">
                                        <a href="javascript: void(0);" class="social-list-item border-primary text-primary"><i class="mdi mdi-facebook"></i></a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="javascript: void(0);" class="social-list-item border-danger text-danger"><i class="mdi mdi-google"></i></a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="javascript: void(0);" class="social-list-item border-info text-info"><i class="mdi mdi-twitter"></i></a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="javascript: void(0);" class="social-list-item border-secondary text-secondary"><i class="mdi mdi-github"></i></a>
                                    </li>
                                </ul>
                            </div>
                            -->
                        </form>
                        <!-- end form-->

                        <!-- Footer-->
                        <footer class="footer footer-alt" style="background-color: #febe98;">
                            <p class="text-muted">Don't have an account? <a href="auth-register-2.html" class="text-muted ms-1"><b>Sign Up</b></a></p>
                        </footer>

                    </div> <!-- end .card-body -->
                </div> <!-- end .align-items-center.d-flex.h-100-->
            </div>
            <!-- end auth-fluid-form-box-->

            <!-- Auth fluid right content -->
            <div class="auth-fluid-right text-center">
                <div class="auth-user-testimonial">
                    
                </div> <!-- end auth-user-testimonial-->
            </div>
            <!-- end Auth fluid right content -->
        </div>
        <!-- end auth-fluid-->

        <!-- Authentication js -->
        <script src="assets/js/pages/authentication.init.js"></script>

    </body>
</html>