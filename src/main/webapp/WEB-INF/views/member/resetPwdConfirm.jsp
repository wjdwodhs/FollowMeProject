<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password Confirm Email</title>
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
                                <a href="index.html" class="logo logo-dark text-center">
                                    <span class="logo-lg">
                                        <img src="assets/images/logo-follow.png" alt="" height="30">
                                    </span>
                                </a>
            
                                <a href="index.html" class="logo logo-light text-center">
                                    <span class="logo-lg">
                                        <img src="assets/images/logo-light.png" alt="" height="22">
                                    </span>
                                </a>
                            </div>
                        </div>

                        <div class="text-center">
                            <svg version="1.1" xmlns:x="&ns_extend;" xmlns:i="&ns_ai;" xmlns:graph="&ns_graphs;"
                                xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 98 98"
                                style="height: 120px;" xml:space="preserve">
                                <style type="text/css">
                                    .st0{fill:#FFFFFF;}
                                    .st1{fill:#1abc9c;}
                                    .st2{fill:#FFFFFF;stroke:#1abc9c;stroke-width:2;stroke-miterlimit:10;}
                                    .st3{fill:none;stroke:#FFFFFF;stroke-width:2;stroke-linecap:round;stroke-miterlimit:10;}
                                </style>
                                    <g i:extraneous="self">
                                        <circle id="XMLID_50_" class="st0" cx="49" cy="49" r="49"/>
                                        <g id="XMLID_4_">
                                            <path id="XMLID_49_" class="st1" d="M77.3,42.7V77c0,0.6-0.4,1-1,1H21.7c-0.5,0-1-0.5-1-1V42.7c0-0.3,0.1-0.6,0.4-0.8l27.3-21.7
                                                c0.3-0.3,0.8-0.3,1.2,0l27.3,21.7C77.1,42.1,77.3,42.4,77.3,42.7z"/>
                                            <path id="XMLID_48_" class="st2" d="M66.5,69.5h-35c-1.1,0-2-0.9-2-2V26.8c0-1.1,0.9-2,2-2h35c1.1,0,2,0.9,2,2v40.7
                                                C68.5,68.6,67.6,69.5,66.5,69.5z"/>
                                            <path id="XMLID_47_" class="st1" d="M62.9,33.4H47.2c-0.5,0-0.9-0.4-0.9-0.9v-0.2c0-0.5,0.4-0.9,0.9-0.9h15.7
                                                c0.5,0,0.9,0.4,0.9,0.9v0.2C63.8,33,63.4,33.4,62.9,33.4z"/>
                                            <path id="XMLID_46_" class="st1" d="M62.9,40.3H47.2c-0.5,0-0.9-0.4-0.9-0.9v-0.2c0-0.5,0.4-0.9,0.9-0.9h15.7
                                                c0.5,0,0.9,0.4,0.9,0.9v0.2C63.8,39.9,63.4,40.3,62.9,40.3z"/>
                                            <path id="XMLID_45_" class="st1" d="M62.9,47.2H47.2c-0.5,0-0.9-0.4-0.9-0.9v-0.2c0-0.5,0.4-0.9,0.9-0.9h15.7
                                                c0.5,0,0.9,0.4,0.9,0.9v0.2C63.8,46.8,63.4,47.2,62.9,47.2z"/>
                                            <path id="XMLID_44_" class="st1" d="M62.9,54.1H47.2c-0.5,0-0.9-0.4-0.9-0.9v-0.2c0-0.5,0.4-0.9,0.9-0.9h15.7
                                                c0.5,0,0.9,0.4,0.9,0.9v0.2C63.8,53.7,63.4,54.1,62.9,54.1z"/>
                                            <path id="XMLID_43_" class="st2" d="M41.6,40.1h-5.8c-0.6,0-1-0.4-1-1v-6.7c0-0.6,0.4-1,1-1h5.8c0.6,0,1,0.4,1,1v6.7
                                                C42.6,39.7,42.2,40.1,41.6,40.1z"/>
                                            <path id="XMLID_42_" class="st2" d="M41.6,54.2h-5.8c-0.6,0-1-0.4-1-1v-6.7c0-0.6,0.4-1,1-1h5.8c0.6,0,1,0.4,1,1v6.7
                                                C42.6,53.8,42.2,54.2,41.6,54.2z"/>
                                            <path id="XMLID_41_" class="st1" d="M23.4,46.2l25,17.8c0.3,0.2,0.7,0.2,1.1,0l26.8-19.8l-3.3,30.9H27.7L23.4,46.2z"/>
                                            <path id="XMLID_40_" class="st3" d="M74.9,45.2L49.5,63.5c-0.3,0.2-0.7,0.2-1.1,0L23.2,45.2"/>
                                        </g>
                                    </g>
                            </svg>

                            <h3>Success !</h3>
                            <p class="font-14 mt-2"> 이메일이 <b>사용자가 입력한 이메일</b>로 전송되었습니다.
                                메일에 포함된 임시비밀번호를 확인해주세요!</p>

                            <a href="" class="btn w-100 btn-primary waves-light mt-3" style="background-color: #f2ebda; color: black; border: none;">메인화면으로 돌아가기</a>
                        </div>
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

</body>
</html>