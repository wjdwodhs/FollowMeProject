<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">

<head>
<meta charset="utf-8" />
<title>전자결재 양식 2. 자택근무신청서 | Follow me</title>
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

<!-- Plugins css -->
<link href="${ contextPath }/assets/libs/quill/quill.core.css" rel="stylesheet" type="text/css" />
<link href="${ contextPath }/assets/libs/quill/quill.bubble.css" rel="stylesheet" type="text/css" />
<link href="${ contextPath }/assets/libs/quill/quill.snow.css" rel="stylesheet" type="text/css" />

    <style>
        .a.nav-link.active{background-color:#FEBE98;}

        .card{
            align-items: center;
            width: 80%;
        }
        
        .document-info{ 
            display: flex; 
        }
        
        .top-document{
            justify-content: space-between;
            display: flex;
            align-items: flex-end; /* 아이템들을 오른쪽으로 정렬합니다. */     
        }

        .document-title{
            margin-bottom: 60px; margin-left: 70px;
        }
        
        .sign-table{
            text-align: right;
            margin-bottom: px;
        }
        
        .table-sign{
            border: 1px solid rgb(102, 88, 221);
            border-collapse: collapse;
            margin-top: 50px;
            margin-bottom: 20px;
        }

        .table-sign tr>th, .table-sign tr>td{
            text-align: center; 
            width: 100px;
            height: 25px;
            font-size: 11px;
            font-weight: lighter;
        }

        .sign{
            height:75px;
        }

        .table-info-1, .table-info-2{
            border: 1px solid rgb(102, 88, 221);
            border-collapse: collapse;
            margin-bottom: 15px;
        }
        
        .table-info-2{
            margin-left: 2px;
        }
        
        .table-2-1{
            border: 1px solid rgb(102, 88, 221);
            border-collapse: collapse;
            margin-bottom: 15px; 
        }
        
        .table-sign th, .table-sign td, .table-info-1 th, .table-info-1 td, .table-info-2 th, .table-info-2 td{
            border: 1px solid rgb(102, 88, 221);
            padding: 8px;
            text-align: left;
            
        }
        
        .table-2-1 th, .table-2-1 td{
            border: 1px solid rgb(102, 88, 221);
            padding: 8px;
            text-align: left;
            height: 40px;
        }

        #snow-editor {
            flex: 1; /* 자식 요소를 꽉 채우도록 설정합니다. */
        }

        input:focus ,td>textarea:focus{
            outline: none;
        }

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
            <!-- Start Page content -->
            <!-- 전자결재 양식 2. 재택근무신청서-->
            <!-- ============================================================== -->
                
                <div class="content" style="background-color: #F2E8DA;">

                    <!-- Start Content-->
                    <div class="container-fluid" style="display:flex; justify-content: center;">
                        
                        <div class="card" style="margin-top: 50px;">
                            <div class="card-body">
                                <div class="top-document">
                                    <div class="document-title">
                                        <h1>재택근무신청서</h1>
                                    </div>
                                    <div class="sign-table">
                                        <table class="table-sign">
                                            <tr>
                                                <th rowspan="5" style="width:20px;">결 재 선</th>
                                            </tr>
                                            <tr>
                                                <th>작 성 자</th>
                                                <th>결 재 자</th>
                                            </tr>
                                            <tr class="sign">
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>  

                                <div class="document-info">

                                    <div class="info-1">
                                        <table class="table-info-1">
                                            <tr>
                                                <th width="120px;">부서</th>
                                                <td width="266px;">경영지원</td>    
                                            </tr>
                                            <tr>
                                                <th>직급</th>
                                                <td>대리</td>
                                            </tr>
                                            <tr>
                                                <th>신청자</th>
                                                <td>유주찬</td>
                                            </tr>
                                            <tr>
                                                <th>신청일</th>
                                                <td>2024-05-13 (월)</td>
                                            </tr>
                                        </table>
                                        
                                    </div>
                                    <div class="info-2">
                                        <table class="table-info-2">
                                            <tr>
                                                <th width="120px;">참조인</th>
                                                <td width="266px;">경영지원 김성한 팀장</td>
                                            </tr>
                                            <tr>
                                                <th>보존연한</th>
                                                <td>기안일로부터 5년</td>
                                            </tr>
                                            <tr>
                                                <th>전화번호</th>
                                                <td>010-9999-9999</td>
                                            </tr>
                                            <tr>
                                                <th>결재일</th>
                                                <td>2024-05-14 (화)</td>
                                            </tr>
                                        </table>
                                    </div>
                                    
                                </div>

                                    <div class="table-2">
                                        <table class="table-2-1">
                                            <tr>
                                                <th width="120px;">제목</th>
                                                <td width="655px;">
                                                    <input type="text" name="title" size="20" style="width:100%; border:0;" value="기안자 작성란">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    
                                    
                                <!-- 내용 작성하기 -->
                                <div class="table-responsive">
                                    <table class="table table-bordered border-primary mb-0">

                                        <tbody>
                                            <tr>
                                                <th style="text-align:center; width:13%;"> 근 무 일 </th>
                                                <td>
                                                    <input type="date" id="startDate" size="20" style="width:100px; border:0;"> ~
                                                    <input type="date" id="endDate" size="20" style="width:100px; border:0;">
                                                </td>
                                            </tr>

                                            <script>
                                                // 오늘 today
                                                var today = new Date();
                                                // 내일 tomorrow
                                                var tomorrow = new Date(today);
                                                tomorrow.setDate(today.getDate() + 1);
                                                // 14일후 nextTwoWeeks
                                                var nextTwoWeeks = new Date(today);
                                                nextTwoWeeks.setDate(today.getDate() + 15); // 14일이 아닌 15일인 이유는 내일을 포함하기 때문입니다.
                                        
                                                // startDate 설정
                                                var startDateField = document.getElementById('startDate');
                                                startDateField.valueAsDate = tomorrow; // 최소날짜 내일
                                                startDateField.min = tomorrow.toISOString().split('T')[0]; // 최소날짜 설정 + 년월일까지만 표시
                                                startDateField.max = nextTwoWeeks.toISOString().split('T')[0]; // 최대날짜 설정 + 년월일까지만 표시
                                        
                                                // endDate 설정
                                                var endDateField = document.getElementById('endDate');
                                                endDateField.valueAsDate = tomorrow; // 최소날짜 내일
                                                endDateField.min = tomorrow.toISOString().split('T')[0]; // 최소날짜 설정 + 년월일까지만 표시
                                                endDateField.max = nextTwoWeeks.toISOString().split('T')[0]; // 최대날짜 설정 + 년월일까지만 표시

                                                function checkEndDate() {
                                                    if (endDateField.value < startDateField.value) {
                                                        endDateField.value = startDateField.value;
                                                    }
                                                    endDateField.min = startDateField.value;
                                                }

                                                endDateField.addEventListener('change', checkEndDate);
                                                startDateField.addEventListener('change', checkEndDate);
                                            </script>

                                            <tr>
                                                <th style="text-align:center; width:13%;">
                                                    신청사유 <br>및<br> 근무내용
                                                </th>
                                                <td style="height:250px; width:350px;">
                                                    <div id="snow-editor" style="height:250px;">
                                                        기안자 작성란
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="text-align:center; width:13%;"> 비 고 </th>
                                                <td>
                                                    <input type="text" name="etc-box" size="20" style="width:100%; border:0;" value="기안자 작성란">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="text-align:center; width:13%;">첨 부</th>
                                                <td><input type="file" style="width:645px;" id="upfile" class="form-control-file border file" name="uploadFiles" multiple></td>
                                                <!--
                                                    <td>
                                                        <c:forEach var="at" items="${ board.attachList }">
                                                            <a href="${ contextPath }${ at.filePath }/${ at.fileSystemName }" download="${ at.originalName }">[${ at.originalName }]</a>
                    	                                </c:forEach>
                                                    </td>
                                                -->
                                            </tr>
                                        </tbody>
                                    </table>
                                </div> <!-- 내용 작성하기 끝-->

                                <p style="text-align:center; font-size:16px; margin-top:20px;">상기 본인은 위의 사유로 인하여 재택근무를 신청하고자 하오니 허락하여 주시기 바랍니다.</p>
                                <!--결재 처리사유-->
                                <div class="opinion-box" style="margin-top:20px;">
                                    <table class="table table-bordered border-primary mb-0">      
                                            <tr>
                                                <th style="text-align:center; width:13%;">
                                                    처 리 <br> 사 유
                                                </th>
                                                <td>
                                                    <textarea rows="5" style="border:0; width:100%; resize:none;" readonly>결재 시 결재권자만 작성할 수 있도록 처리</textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                    </table>
                                </div> <!-- 결재 처리사유 끝-->
                            </div>
                        </div>
                    </div>
          


                        
                    </div> <!-- container -->

                </div> <!-- content -->

            </div>


      <!-- ============================================================== -->
      <!-- <-- End Page Content
      <!-- ============================================================== -->
      
      

	
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
                                        <img src="${ contextPath }/assets/images/users/user-10.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${ contextPath }/assets/images/users/user-1.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${ contextPath }/assets/images/users/user-9.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${ contextPath }/assets/images/users/user-2.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${ contextPath }/assets/images/users/user-4.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${ contextPath }/assets/images/users/user-5.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${ contextPath }/assets/images/users/user-6.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${ contextPath }/assets/images/users/user-7.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${ contextPath }/assets/images/users/user-8.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
        <script src="${ contextPath }/assets/libs/apexcharts/apexcharts.min.js"></script>
        <script src="${ contextPath }/assets/libs/selectize/js/standalone/selectize.min.js"></script>

        <!-- Dashboar 1 init js-->
        <script src="${ contextPath }/assets/js/pages/dashboard-1.init.js"></script>
        
        <!-- Plugins js -->
        <script src="${ contextPath }/assets/libs/quill/quill.min.js"></script>

        <!-- Init js-->
        <script src="${ contextPath }/assets/js/pages/form-quilljs.init.js"></script>
	
</body>
</html>