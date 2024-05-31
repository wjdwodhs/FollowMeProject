<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">

<head>
<meta charset="utf-8" />
<title>Email | Follow me</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />

<!-- App favicon -->
<link rel="shortcut icon" href="${ contextPath }/assets/images/favicon.ico">

<!-- Theme Config Js -->
<script src="${ contextPath }/assets/js/head.js"></script>

<!-- Bootstrap css -->
<link href="${ contextPath }/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="app-style" />

<!-- App css -->
<link href="${ contextPath }/assets/css/app.min.css" rel="stylesheet" type="text/css" />

<!-- Icons css -->
<link href="${ contextPath }/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

<style>
	.a.nav-link.active{background-color:#FEBE98;}
</style>

</head>

<body>
	<!-- Begin page -->
	<div id="wrapper">

  	<!-- sidemenu include -->
  	<jsp:include page="/WEB-INF/views/common/sidemenu.jsp"/>
            
  	<div class="content-page">

    	<!-- topbar include -->
      <jsp:include page="/WEB-INF/views/common/topbar.jsp"/>

      <!-- ============================================================== -->
      <!-- Start Page Content here -->
      <!-- ============================================================== -->
			
			<div class="content" style="background-color: #F2E8DA;">
			
				<!-- Start Content-->
		  	<div class="container-fluid">
		            
	            <!-- start page title -->
	            <div class="row">
	                <div class="col-12">
	                    <div class="page-title-box">
	                        <div class="page-title-right">
	                            <ol class="breadcrumb m-0">
	                            		<li class="breadcrumb-item"><a href="javascript: void(0);">FOLLOW ME</a></li>
	                                <li class="breadcrumb-item"><a href="javascript: void(0);">Email</a></li>
	                                <li class="breadcrumb-item active">Email Read</li>
	                            </ol>
	                        </div>
	                        <h4 class="page-title">Email Read</h4>
	                    </div>
	                </div>
	            </div>
	            <!-- end page title -->
	
	            <!-- Right Sidebar -->
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="card">
	                        <div class="card-body">
	                            <!-- Left sidebar -->
	                            <div class="inbox-leftbar">
	
		                          <a href="${ contextPath }/email/composeForm.do" class="btn btn-danger w-100 waves-effect waves-light"
		                             style="background-color: #FFBE98; border: 1px solid #FFBE98;">메일작성</a>
			
		                          <div class="mail-list mt-4">
		                              <a href="${contextPath }/email/email.page" class="text-danger fw-bold"><i class="dripicons-inbox me-2"></i>전체메일<span class="badge badge-soft-danger float-end ms-2"></span></a>
		                              <a href="${contextPath }/email/outbox.bo"><i class="dripicons-exit me-2"></i>보낸메일</a>
		                              <a href="${contextPath }/email/recyclebin.do"><i class="dripicons-trash me-2"></i>휴지통</a>
		                          </div>
	
	                            </div>
	                            <!-- End Left sidebar -->
	
	                            <div class="inbox-rightbar">
	
	                                <div class="btn-group">
	                                    <a href="${ contextPath }/email/detailtrash.do?no=${email.emailNo}" id="trash-btn" class="btn btn-sm btn-light waves-effect">
	                                    	<i class="mdi mdi-delete-variant font-18"></i>
	                                    </a>
	                                </div>
	                                

	
	                                <div class="mt-4">
	                                    <h5 class="font-18">${email.subject}</h5>
	
	                                    <hr/>
	
	                                    <div class="d-flex align-items-start mb-3 mt-1">
	                                        <div class="w-100">
	                                            <small class="float-end">${email.registDate}</small>
	                                            <small class="text-muted">From: ${email.emailFrom}</small>
	                                        </div>
	                                    </div>
	
	                                  	${email.text}
	                                    
	                               	<hr/>
								
                                	<div class="row">
																		<c:forEach var="at" items="${ email.attachList }">
                                     <div class="col-xl-4">
                                         <div class="card mb-1 shadow-none border">
                                             <div class="p-2">
                                                 <div class="row align-items-center">
                                                     <div class="col-auto">
                                                         <div class="avatar-sm">
                                                             <span class="avatar-title bg-soft-primary text-primary rounded">
                                                                 
                                                             </span>
                                                         </div>
                                                     </div>
                                                     <div class="col ps-0">
                                                         <a href="${ contextPath }${at.filePath}/${at.systemName}" 
	                                                          class="text-muted fw-bold" download="${ at.originName}">${at.originName}</a>
                                                         <p class="mb-0"></p>
                                                     </div>
                                                     <div class="col-auto">
                                                         <!-- Button -->
                                                         <a href="${ contextPath }${at.filePath}/${at.systemName}"  
	                                                          class="btn btn-link btn-lg text-muted" download="${ at.originName}">
                                                             <i class="dripicons-download"></i>
                                                         </a>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>
                                     </div> <!-- end col -->
	                                  </c:forEach>   
                                 	</div>   
	                                    
	                                    <div class="mt-5">
	                                        <a href="${contextPath }/email/email.page" class="btn btn-secondary me-2" style="background-color: #FFBE98; border: 1px solid #FFBE98;">
	                                        <i class="mdi mdi-reply me-1"></i> 목록
	                                        </a>
	                                    </div>
	
	                                </div>
	                                <!-- end .mt-4 -->
	
	                            </div> 
	                            <!-- end inbox-rightbar-->
	
	                            <div class="clearfix"></div>
	                        </div>
	                    </div>
	                </div> <!-- end Col -->
	
	            </div><!-- End row -->
		
		            
		        </div> <!-- container -->
		
		    </div> <!-- content -->



			</div>

      <!-- ============================================================== -->
      <!-- <-- End Page Content
      <!-- ============================================================== -->
      
	</div>

        <!-- Vendor js -->
        <script src="${ contextPath }/assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="${ contextPath }/assets/js/app.min.js"></script>
        
        <!-- Plugins js-->
        <script src="${ contextPath }/assets/libs/flatpickr/flatpickr.min.js"></script>
        <script src="${ contextPath }/assets/libs/selectize/js/standalone/selectize.min.js"></script>
</body>
</html>