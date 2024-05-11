<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대표 메인페이지 | Follow Me</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />

<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- Plugins css -->
<link href="${ contextPath }/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
<link href="${ contextPath }/assets/libs/selectize/css/selectize.bootstrap3.css" rel="stylesheet" type="text/css" />

<!-- Theme Config Js -->
<script src="${ contextPath }/assets/js/head.js"></script>

<!-- Bootstrap css -->
<link href="${ contextPath }/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="app-style" />

<!-- App css -->
<link href="${ contextPath }/assets/css/app.min.css" rel="stylesheet" type="text/css" />

<!-- Icons css -->
<link href="${ contextPath }/assets/css/icons.min.css" rel="stylesheet" type="text/css" />


<!-- 캘린더 -->
			<!-- fullcalendar -->
     <link href="${contextPath }/assets/libs/fullcalendar/main.min.css" rel="stylesheet"/>
     <script src="${contextPath}/assets/libs/fullcalendar/fullcalendar.global.min.js"></script>
		 <script src="${contextPath}/assets/libs/fullcalendar/google-calendar.global.js"></script>
		 
		 
	   <!-- jquery CDN -->  
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     
     <!-- fullcalendar 언어 CDN -->  
     <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
     
     <!-- Bootstrap JavaScript -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>


<style>

</style>
</head>
<body>
<!-- Begin page -->
  <div id="wrapper">

     <!-- sidemenu include -->
     <jsp:include page="/WEB-INF/views/common/sidemenu.jsp"/>
      

      <!-- ============================================================== -->
      <!-- Start Page Content here -->
      <!-- ============================================================== -->

      <div class="content-page" style="background-color:#F2E8DA;">
		    <jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
			    <div class="content" style="background-color:#F2E8DA;">
			        <div class="container-fluid">
			            <div class="row">
			                <div class="col-12">
			                    <div class="page-title-box">
			                        <div class="page-title-right">
			                        </div>
			                        <h4 class="page-title"></h4>
			                    </div>
			                </div>
			            </div>     
			            <div class="row">
			                <div class="col-3">
			                    <div class="card">
			                        <div class="card-body" style="height: 400px; text-align:center">
			                            
			                            <div style="display: flex; justify-content: center; margin-top: 20px;">
	                                    <h4 style="margin-right: 20px;">04월 28일 <br> 오전 7:47:03</h4>
	                                    <button type="button" class="btn btn-secondary btn-sm rounded-pill waves-effect waves-light"> 출근 전</button>
	                                </div>
	                                <div style="margin-top: 20px;">
	                                    <button type="button" class="btn btn-soft-success btn-lg waves-effect waves-light" data-bs-toggle="modal" data-bs-target="#in-check" style="height: 80px;">출근하기</button>&nbsp &nbsp &nbsp
	                                    <button type="button" class="btn btn-soft-blue btn-lg waves-effect waves-light" data-bs-toggle="modal" data-bs-target="#out-check" style="height: 80px;">퇴근하기</button>
	                                </div>
	                                <div style="margin-top: 30px;"> 
	                                    <button type="button" class="btn btn-outline-secondary waves-effect" data-bs-toggle="modal" data-bs-target="#check-modal" style="width: 130px; height: 40px; margin-top: 15px;" value="업무">업무</button>&nbsp &nbsp 
	                                    <button type="button" class="btn btn-outline-secondary waves-effect" data-bs-toggle="modal" data-bs-target="#check-modal" style="width: 130px; height: 40px; margin-top: 15px;" value="회의">회의</button>
	                                    <button type="button" class="btn btn-outline-secondary waves-effect" data-bs-toggle="modal" data-bs-target="#check-modal" style="width: 130px; height: 40px; margin-top: 20px;" value="외출">외출</button>&nbsp &nbsp 
	                                    <button type="button" class="btn btn-outline-secondary waves-effect" data-bs-toggle="modal" data-bs-target="#check-modal" style="width: 130px; height: 40px; margin-top: 20px;" value="외근">외근</button>
	                                </div>
			                            
			                            <!-- 출근하기 버튼 모달 -->
					                        <div id="in-check" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
					                            <div class="modal-dialog modal-top">
					                                <div class="modal-content">
					                                    <div class="modal-header">
					                                        <h4 class="modal-title" id="topModalLabel">임직원 근무 변경</h4>
					                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					                                    </div>
					                                    <div class="modal-body">
					                                        <h5>출근하시겠습니까?</h5>
					                                        <p>확인을 누르시면 근무형태가 '출근'으로 변경됩니다.</p>
					                                    </div>
					                                    <div class="modal-footer">
					                                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
					                                        <button type="button" class="btn btn-primary">확인</button>
					                                    </div>
					                                </div><!-- /.modal-content -->
					                            </div><!-- /.modal-dialog -->
					                        </div><!-- /.modal -->
					
					                        <!-- 퇴근하기 버튼 모달 -->
					                        <div id="out-check" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
					                            <div class="modal-dialog modal-top">
					                                <div class="modal-content">
					                                    <div class="modal-header">
					                                        <h4 class="modal-title" id="topModalLabel">임직원 근무 변경</h4>
					                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					                                    </div>
					                                    <div class="modal-body">
					                                        <h5>퇴근하시겠습니까?</h5>
					                                        <p>확인을 누르시면 근무형태가 '퇴근'으로 변경됩니다.</p>
					                                    </div>
					                                    <div class="modal-footer">
					                                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
					                                        <button type="button" class="btn btn-primary">확인</button>
					                                    </div>
					                                </div><!-- /.modal-content -->
					                            </div><!-- /.modal-dialog -->
					                        </div><!-- /.modal -->
					
					                        <!-- 근무변경 modal content -->
					                        <div id="check-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
					                            <div class="modal-dialog">
					                                <div class="modal-content">
					                                    <div class="modal-body">
					                                        <form action="#" class="px-3">
					                                            <p><br>근무 변경을 위한 본인확인 절차가 필요합니다. <br></p>
					                                            <div class="mb-3">
					                                                <label for="checkPwd" class="form-label">비밀번호</label>
					                                                <input class="form-control" type="password" required="" id="checkPwd" placeholder="비밀번호를 입력해주세요.">
					                                            </div>
					
					                                            <div class="mb-2 text-center">
					                                                <button class="btn rounded-pill btn-primary" type="submit">확인</button>
					                                            </div>
					
					                                        </form>
					                                    </div>
					                                </div><!-- /.modal-content -->
					                            </div><!-- /.modal-dialog -->
					                        </div><!-- /.modal -->                        
							                            
			                            
			                        </div>
			                    </div> <!-- end card -->
			                </div> <!-- end col-->
			                
			                
			                <div class="col-5">
			                    <div class="card">
			                        <div class="card-body" style="height: 400px;"> <!-- 달력 표시용 -->
			                            <div class="row" style="display:flex; justify-content:center;">
                                      
                                    	<div id="calendar"></div>
                                     
                                  </div>  <!-- end row -->
		                          </div>
			                    </div> <!-- end card-->
			                </div> <!-- end col -->
			                
			                
			                <div class="col-4">
			                    <div class="card">
			                        <div class="card-body" >
			                            <div class="dropdown float-end">
			                                <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
			                                    <i class="mdi mdi-dots-vertical"></i>
			                                </a>
			                                <div class="dropdown-menu dropdown-menu-end">
			                                    <!-- item-->
			                                    <a href="javascript:void(0);" class="dropdown-item">Settings</a>
			                                    <!-- item-->
			                                    <a href="javascript:void(0);" class="dropdown-item">Action</a>
			                                </div>
			                            </div>
			                            <h4 class="header-title mb-3">Weekly Best Item</h4>
			                            <div class="table-responsive">
			                                <table class="table table-striped table-sm table-nowrap table-centered mb-0">
			                                    <thead>
			                                        <tr>
			                                            <th>상품명</th>
			                                            <th>판매량</th>
			                                            <th>매출액</th>
			                                        </tr>
			                                    </thead>
			                                    <tbody>
			                                        <tr>
			                                            <td>
			                                                <h5 class="font-15 my-1 fw-normal">${revenueList.proName}</h5>
			                                            </td>
			                                            <td style="text-align:center;">${revenueList.orderAmount}</td>
			                                            <td>${revenueList.revenue}</td>
			                                        </tr>
			                                    </tbody>
			                                </table>
			                            </div>
			                        </div>
			                    </div> <!-- end card-->
			                </div> <!-- end col -->
			            </div> <!-- end row -->
			            <div class="row">
			                <div class="col-3">
			                    <div class="card">
			                        <div class="card-body" style="height: 200px;">
			                        		<h4 class="header-title">오늘의 결재</h4>
			                            <div> 
	                                    <button type="button" class="btn btn-outline-secondary waves-effect"  style="width: 130px; height: 40px; margin-top: 15px;" value="대기">대기</button>&nbsp &nbsp 
	                                    <button type="button" class="btn btn-outline-success waves-effect"  style="width: 130px; height: 40px; margin-top: 15px;" value="완료">완료</button>
	                                    <button type="button" class="btn btn-outline-info waves-effect"  style="width: 130px; height: 40px; margin-top: 15px;" value="예정">예정</button>&nbsp &nbsp 
	                                    <button type="button" class="btn btn-outline-blue waves-effect"  style="width: 130px; height: 40px; margin-top: 15px;" value="진행">진행</button>
	                                </div>
			                        </div>
			                    </div> <!-- end card-->
			                </div> <!-- end col -->
			                
			                <div class="col-5">
			                    <div class="card">
			                        <div class="card-body" style="height: 200px;">
			                            
			                            
			                            
			                            
			                            
			                        </div>
			                    </div> <!-- end card-->
			                </div> <!-- end col -->
			                
			                
			                <div class="col-4">
			                    <div class="card" style="margin-top:-202px;">
			                        <div class="card-body">
			                            <h4 class="header-title">오늘의 패션 뉴스</h4>
			                            <div id="news-container" style="height: 330px; overflow-y:auto;"></div>
			                            <script>
			                                $(document).ready(function() {
			                                    $.ajax({
			                                        url: '${contextPath}/chart/naverNews.do', 
			                                        method: 'GET',
			                                        success: function(response) {
			                                            displayBlog(response, 'news-container');
			                                        },
			                                        error: function(xhr, status, error) {
			                                            console.error('Error fetching blog:', error);
			                                        }
			                                    });
			                                });
			                                function displayBlog(newsData, containerId) {
			                                    var newsContainer = document.getElementById(containerId);
			                                    var newsHtml = '';
			                                    if (!Array.isArray(newsData.items)) {
			                                    	newsData.items = [newsData.items];
			                                    }
			                                    newsData.items.forEach(function(item) {
			                                        if (item.title.includes('패션')) {
			                                        	newsHtml += '<div class="blog-item">' +
			                                                '<h5><a href="' + item.link + '" target="_blank">' + item.title + '</a></h5>' +
			                                                '<p>' + item.description + '</p>' +
			                                                '</div>';
			                                        }
			                                    });
			                                    newsContainer.innerHTML = newsHtml;
			                                }
			                            </script>
				                        </div>
				                    </div>
				                </div>	
				            </div> <!-- end row -->
				        </div> <!-- container -->
				    </div> <!-- content -->
				</div>
		</div>


        <!-- Theme Settings -->
        <div class="offcanvas offcanvas-end right-bar" tabindex="-1" id="theme-settings-offcanvas">
            <div class="d-flex align-items-center w-100 p-0 offcanvas-header">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs nav-bordered nav-justified w-100" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link py-2" data-bs-toggle="tab" href="#chat-tab" role="tab">
                            <i class="mdi mdi-message-text d-block font-22 my-1"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link py-2" data-bs-toggle="tab" href="#tasks-tab" role="tab">
                            <i class="mdi mdi-format-list-checkbox d-block font-22 my-1"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link py-2 active" data-bs-toggle="tab" href="#settings-tab" role="tab">
                            <i class="mdi mdi-cog-outline d-block font-22 my-1"></i>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="offcanvas-body p-3 h-100" data-simplebar>
                <!-- Tab panes -->
                <div class="tab-content pt-0">
                    <div class="tab-pane" id="chat-tab" role="tabpanel">

                        <form class="search-bar">
                            <div class="position-relative">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="mdi mdi-magnify"></span>
                            </div>
                        </form>

                        <h6 class="fw-medium mt-2 text-uppercase">Group Chats</h6>

                        <div>
                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 mb-2 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1 text-success"></i>
                                <span class="mb-0 mt-1">App Development</span>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 mb-2 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1 text-warning"></i>
                                <span class="mb-0 mt-1">Office Work</span>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 mb-2 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1 text-danger"></i>
                                <span class="mb-0 mt-1">Personal Group</span>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item ps-3 d-block">
                                <i class="mdi mdi-checkbox-blank-circle-outline me-1"></i>
                                <span class="mb-0 mt-1">Freelance</span>
                            </a>
                        </div>

                        <h6 class="fw-medium mt-3 text-uppercase">Favourites <a href="javascript: void(0);" class="font-18 text-danger"><i class="float-end mdi mdi-plus-circle"></i></a></h6>

                        <div>
                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-10.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status online"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Andrew Mackie</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">It will seem like simplified English.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-1.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status away"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Rory Dalyell</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">To an English person, it will seem like simplified</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-9.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status busy"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Jaxon Dunhill</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">To achieve this, it would be necessary.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <h6 class="fw-medium mt-3 text-uppercase">Other Chats <a href="javascript: void(0);" class="font-18 text-danger"><i class="float-end mdi mdi-plus-circle"></i></a></h6>

                        <div class="pb-4">
                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-2.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status online"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Jackson Therry</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">Everyone realizes why a new common language.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-4.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status away"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Charles Deakin</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">The languages only differ in their grammar.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-5.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status online"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Ryan Salting</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">If several languages coalesce the grammar of the resulting.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-6.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status online"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Sean Howse</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">It will seem like simplified English.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-7.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status busy"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Dean Coward</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">The new common language will be more simple.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset notification-item">
                                <div class="d-flex align-items-start noti-user-item">
                                    <div class="position-relative me-2">
                                        <img src="assets/images/users/user-8.jpg" class="rounded-circle avatar-sm" alt="user-pic">
                                        <i class="mdi mdi-circle user-status away"></i>
                                    </div>
                                    <div class="overflow-hidden">
                                        <h6 class="mt-0 mb-1 font-14">Hayley East</h6>
                                        <div class="font-13 text-muted">
                                            <p class="mb-0 text-truncate">One could refuse to pay expensive translators.</p>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            <div class="text-center mt-3">
                                <a href="javascript:void(0);" class="btn btn-sm btn-white">
                                    <i class="mdi mdi-spin mdi-loading me-2"></i>
                                    Load more
                                </a>
                            </div>
                        </div>

                    </div>

                    <div class="tab-pane" id="tasks-tab" role="tabpanel">
                        <h6 class="fw-medium p-3 m-0 text-uppercase">Working Tasks</h6>
                        <div class="px-2">
                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">App Development<span class="float-end">75%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Database Repair<span class="float-end">37%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 37%" aria-valuenow="37" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Backup Create<span class="float-end">52%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 52%" aria-valuenow="52" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>
                        </div>

                        <h6 class="fw-medium mb-0 mt-4 text-uppercase">Upcoming Tasks</h6>

                        <div>
                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Sales Reporting<span class="float-end">12%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 12%" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">Redesign Website<span class="float-end">67%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 67%" aria-valuenow="67" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>

                            <a href="javascript: void(0);" class="text-reset item-hovered d-block p-2">
                                <p class="text-muted mb-0">New Admin Design<span class="float-end">84%</span></p>
                                <div class="progress mt-2" style="height: 4px;">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 84%" aria-valuenow="84" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </a>
                        </div>

                        <div class="p-3 mt-2 d-grid">
                            <a href="javascript: void(0);" class="btn btn-success waves-effect waves-light">Create Task</a>
                        </div>

                    </div>

                    <div class="tab-pane active" id="settings-tab" role="tabpanel">

                        <div class="mt-n3">
                            <h6 class="fw-medium py-2 px-3 font-13 text-uppercase bg-light mx-n3 mt-n3 mb-3">
                                <span class="d-block py-1">Theme Settings</span>
                            </h6>
                        </div>

                        <div class="alert alert-warning" role="alert">
                            <strong>Customize </strong> the overall color scheme, sidebar menu, etc.
                        </div>

                        <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Color Scheme</h5>

                        <div class="colorscheme-cardradio">
                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-bs-theme" id="layout-color-light" value="light">
                                    <label class="form-check-label" for="layout-color-light">Light</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-bs-theme" id="layout-color-dark" value="dark">
                                    <label class="form-check-label" for="layout-color-dark">Dark</label>
                                </div>
                            </div>
                        </div>

                        <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Content Width</h5>
                        <div class="d-flex flex-column gap-2">
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="data-layout-width" id="layout-width-default" value="default">
                                <label class="form-check-label" for="layout-width-default">Fluid (Default)</label>
                            </div>

                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="data-layout-width" id="layout-width-boxed" value="boxed">
                                <label class="form-check-label" for="layout-width-boxed">Boxed</label>
                            </div>
                        </div>

                        <div id="layout-mode">
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Layout Mode</h5>

                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-layout-mode" id="layout-mode-default" value="default">
                                    <label class="form-check-label" for="layout-mode-default">Default</label>
                                </div>


                                <div id="layout-detached">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" name="data-layout-mode" id="layout-mode-detached" value="detached">
                                        <label class="form-check-label" for="layout-mode-detached">Detached</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Topbar Color</h5>

                        <div class="d-flex flex-column gap-2">
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="data-topbar-color" id="topbar-color-light" value="light">
                                <label class="form-check-label" for="topbar-color-light">Light</label>
                            </div>

                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="data-topbar-color" id="topbar-color-dark" value="dark">
                                <label class="form-check-label" for="topbar-color-dark">Dark</label>
                            </div>

                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="data-topbar-color" id="topbar-color-brand" value="brand">
                                <label class="form-check-label" for="topbar-color-brand">Brand</label>
                            </div>
                        </div>

                        <div>
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Menu Color</h5>

                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-color" id="leftbar-color-light" value="light">
                                    <label class="form-check-label" for="leftbar-color-light">Light</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-color" id="leftbar-color-dark" value="dark">
                                    <label class="form-check-label" for="leftbar-color-dark">Dark</label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-color" id="leftbar-color-brand" value="brand">
                                    <label class="form-check-label" for="leftbar-color-brand">Brand</label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-color" id="leftbar-color-gradient" value="gradient">
                                    <label class="form-check-label" for="leftbar-color-gradient">Gradient</label>
                                </div>
                            </div>
                        </div>

                        <div id="menu-icon-color">
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Menu Icon Color</h5>

                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-two-column-color" id="twocolumn-menu-color-light" value="light">
                                    <label class="form-check-label" for="twocolumn-menu-color-light">Light</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-two-column-color" id="twocolumn-menu-color-dark" value="dark">
                                    <label class="form-check-label" for="twocolumn-menu-color-dark">Dark</label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-two-column-color" id="twocolumn-menu-color-brand" value="brand">
                                    <label class="form-check-label" for="twocolumn-menu-color-brand">Brand</label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-two-column-color" id="twocolumn-menu-color-gradient" value="gradient">
                                    <label class="form-check-label" for="twocolumn-menu-color-gradient">Gradient</label>
                                </div>
                            </div>
                        </div>

                        <div>
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Menu Icon Tone</h5>

                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-icon" id="menu-icon-default" value="default">
                                    <label class="form-check-label" for="menu-icon-default">Default</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-menu-icon" id="menu-icon-twotone" value="twotones">
                                    <label class="form-check-label" for="menu-icon-twotone">Twotone</label>
                                </div>
                            </div>
                        </div>

                        <div id="sidebar-size">
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Sidebar Size</h5>

                            <div class="d-flex flex-column gap-2">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-default" value="default">
                                    <label class="form-check-label" for="leftbar-size-default">Default</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-compact" value="compact">
                                    <label class="form-check-label" for="leftbar-size-compact">Compact (Medium Width)</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-small" value="condensed">
                                    <label class="form-check-label" for="leftbar-size-small">Condensed (Icon View)</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-full" value="full">
                                    <label class="form-check-label" for="leftbar-size-full">Full Layout</label>
                                </div>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-fullscreen" value="fullscreen">
                                    <label class="form-check-label" for="leftbar-size-fullscreen">Fullscreen Layout</label>
                                </div>
                            </div>
                        </div>

                        <div id="sidebar-user">
                            <h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Sidebar User Info</h5>

                            <div class="form-check form-switch">
                                <input type="checkbox" class="form-check-input" name="data-sidebar-user" id="sidebaruser-check">
                                <label class="form-check-label" for="sidebaruser-check">Enable</label>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="offcanvas-footer border-top py-2 px-2 text-center">
                <div class="d-flex gap-2">
                    <button type="button" class="btn btn-light w-50" id="reset-layout">Reset</button>
                    <a href="https://1.envato.market/uboldadmin" class="btn btn-danger w-50" target="_blank"><i class="mdi mdi-basket me-1"></i> Buy</a>
                </div>
            </div>
        </div>
        
        <!-- Vendor js -->
        <script src="${ contextPath }/assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="${ contextPath }/assets/js/app.min.js"></script>
        
        <!-- Plugins js-->
        <script src="${ contextPath }/assets/libs/flatpickr/flatpickr.min.js"></script>
        <script src="${ contextPath }/assets/libs/moment/min/moment.min.js"></script>
        <script src="${ contextPath }/assets/libs/selectize/js/standalone/selectize.min.js"></script>


        <!-- Chart JS -->
        <script src="${ contextPath }/assets/libs/chart.js/Chart.bundle.min.js"></script>

        <script src="${ contextPath }/assets/libs/moment/min/moment.min.js"></script>
        <script src="${ contextPath }/assets/libs/jquery.scrollto/jquery.scrollTo.min.js"></script>

        <!-- Chat app -->
        <script src="${ contextPath }/assets/js/pages/jquery.chat.js"></script>

        <!-- Todo app -->
        <script src="${ contextPath }/assets/js/pages/jquery.todo.js"></script>

        <!-- Dashboard init JS -->
        <script src="${ contextPath }/assets/js/pages/dashboard-3.init.js"></script>
        
        <!-- Calendar init -->
		 	  <script src="${ contextPath }/assets/js/pages/calendar.init.js"></script>
       
       

</body>
</html>