<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">
<head>
        <meta charset="utf-8" />
        <title>Calendar | Ubold - Responsive Bootstrap 5 Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />

        <!-- App favicon -->
        <link rel="shortcut icon" href="${ contextPath }/assets/images/favicon.ico">

        <!-- Plugin css -->
        <link href="${ contextPath }/assets/libs/fullcalendar/main.min.css" rel="stylesheet" type="text/css" />

        <!-- Theme Config Js -->
        <script src="${ contextPath }/assets/js/head.js"></script>

        <!-- Bootstrap css -->
        <link href="${ contextPath }/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="app-style" />

        <!-- App css -->
        <link href="${ contextPath }/assets/css/app.min.css" rel="stylesheet" type="text/css" />

        <!-- Icons css -->
        <link href="${ contextPath }/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        
        
    </head>
<body>
	<!-- ========== Menu ========== -->
<div class="app-menu">  

    <!-- Brand Logo -->
    <div class="logo-box">
        <!-- Brand Logo Light -->
        <a href="${contextPath }/employeeMain.page" class="logo-light">
            <img src="${ contextPath }/assets/images/logo-light.png" alt="logo" class="logo-lg">
            <img src="${ contextPath }/assets/images/logo-sm.png" alt="small logo" class="logo-sm">
        </a>

        <!-- Brand Logo Dark -->
        <a href="${contextPath }/employeeMain.page" class="logo-dark">
            <img src="${ contextPath }/assets/images/logo-follow.png" alt="dark logo" class="logo-lg">
            <img src="${ contextPath }/assets/images/logo-sm.png" alt="small logo" class="logo-sm">
        </a>
    </div>

    <!-- menu-left -->
    <div class="scrollbar">

        <!-- User box -->
        <div class="user-box text-center">
            <img src="${ contextPath }/assets/images/users/user-1.jpg" alt="user-img" title="Mat Helme" class="rounded-circle avatar-md">
            <div class="dropdown">
                <a href="javascript: void(0);" class="dropdown-toggle h5 mb-1 d-block" data-bs-toggle="dropdown">Geneva Kennedy</a>
                <div class="dropdown-menu user-pro-dropdown">

                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="fe-user me-1"></i>
                        <span>My Account</span>
                    </a>

                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="fe-settings me-1"></i>
                        <span>Settings</span>
                    </a>

                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="fe-lock me-1"></i>
                        <span>Lock Screen</span>
                    </a>

                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="fe-log-out me-1"></i>
                        <span>Logout</span>
                    </a>

                </div>
            </div>
            <p class="text-muted mb-0">Admin Head</p>
        </div>

        <!--- Menu -->
        <ul class="menu">
        
       		<li class="menu-item">
                <a href="#" data-bs-toggle="collapse" class="menu-link">
                    <span class="menu-icon"><i data-feather="users"></i></span>
                    <span class="menu-text"> 조직도 </span>
                </a>
            </li>
            <li class="menu-item">
                <a href="#" data-bs-toggle="collapse" class="menu-link">
                    <span class="menu-icon"><i data-feather="clipboard"></i></span>
                    <span class="menu-text"> 게시판 </span>
                </a>
            </li>
            <li class="menu-item">
                <a href="${contextPath}/calendar.page" class="menu-link">
                    <span class="menu-icon"><i data-feather="calendar"></i></span>
                    <span class="menu-text"> 일정관리 </span>
                </a>
            </li>
            <li class="menu-item">
                <a href="#" data-bs-toggle="collapse" class="menu-link">
                    <span class="menu-icon"><i data-feather="briefcase"></i></span>
                    <span class="menu-text"> 프로젝트관리 </span>
                </a>
            </li>
            
						<li class="menu-item">
                <a href="#menuCrm" data-bs-toggle="collapse" class="menu-link">
                    <span class="menu-icon"><i data-feather="layers"></i></span>
                    <span class="menu-text"> 자산관리 </span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="menuCrm">
                    <ul class="sub-menu">
                        <li class="menu-item">
                            <a href="${contextPath }/carsReservation.page" class="menu-link">
                                <span class="menu-text">차량</span>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="${contextPath }/seatReservation.page" class="menu-link">
                                <span class="menu-text">좌석</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>
            <li class="menu-item">
                <a href="${ contextPath }/document/list.page" class="menu-link">
                    <span class="menu-icon"><i data-feather="file-text"></i></span>
                    <span class="menu-text"> 전자결재 </span>
                </a>
            </li>
            
            <li class="menu-item">
                <a href="${ contextPath }/member/empManagement.page" class="menu-link">
                    <span class="menu-icon"><i data-feather="user"></i></span>
                    <span class="menu-text"> 인사관리 </span>
                </a>
            </li>
            <li class="menu-item">
                <a href="${ contextPath }/chat/chat.page" class="menu-link">
                    <span class="menu-icon"><i data-feather="message-square"></i></span>
                    <span class="menu-text"> 채팅 </span>
                </a>
            </li>
            <li class="menu-item">
                <a href="#" data-bs-toggle="collapse" class="menu-link">
                    <span class="menu-icon"><i data-feather="mail"></i></span>
                    <span class="menu-text"> 이메일 </span>
                </a>
            </li>

            <li class="menu-item">
                <a href="${ contextPath }/board/socialFeed.page" class="menu-link">
                    <span class="menu-icon"><i data-feather="rss"></i></span>
                    <span class="menu-text"> 소셜피드 </span>
                </a>
            </li>

        </ul>
        <!--- End Menu -->
        <div class="clearfix"></div>
    </div>
</div>
<!-- ========== Left menu End ========== -->

</body>
</html>