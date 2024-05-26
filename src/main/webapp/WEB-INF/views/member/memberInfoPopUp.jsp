<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">

<head>
<meta charset="utf-8" />
<title>직원정보 | Follow me</title>
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
	.a.nav-link.active{background-color:#FEBE98;}
</style>

</head>

<body>
	<!-- Begin page -->
	<div id="wrapper">

  	
  	<div class="content-page">

      <!-- ============================================================== -->
      <!-- Start Page Content here -->
      <!-- ============================================================== -->
			
			<div class="content" style="background-color: #F2E8DA;">
			
				<!-- Start Content-->
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                
                            </div>
                        </div>
                        <!-- end page title -->
                        <!-- end page title -->

                        <div class="row">
                            <div class="col-lg-4 col-xl-4">
                                <div class="card text-center">
                                    <div class="card-body">
                                        <img src="${contextPath}${member.profileImgPath}" class="rounded-circle avatar-lg img-thumbnail"
                                        alt="profile-image">

                                        <h4 class="mb-0">${member.memName}</h4>
                                        <p class="text-muted">@${member.memNo}</p>

                                        <div class="text-start mt-3">
                                            
                                            <p class="text-muted mb-2 font-13"><strong>소속부서 :</strong> <span class="ms-2">${member.deptName}</span></p>

                                            <p class="text-muted mb-2 font-13"><strong>직급 :</strong> <span class="ms-2">${member.memGrade}</span></p>
                                        
                                            <p class="text-muted mb-2 font-13"><strong>내선번호 :</strong><span class="ms-2">${member.extensionNumber}</span></p>

                                            <p class="text-muted mb-2 font-13"><strong>휴대폰번호 :</strong><span class="ms-2">${member.phone}</span></p>
                                        
                                            <p class="text-muted mb-2 font-13"><strong>Email :</strong> <span class="ms-2">${member.memEmail }</span></p>
                                        </div>                                    

                                        
                                    </div>                                 
                                </div> <!-- end card -->
														</div>
												</div>
							</div>
			</div>

      <!-- ============================================================== -->
      <!-- <-- End Page Content
      <!-- ============================================================== -->
      
		</div>
</div>
        
        <!-- Vendor js -->
        <script src="assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="assets/js/app.min.js"></script>

    </body>

</html>