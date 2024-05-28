<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">

<head>
    <meta charset="utf-8" />
    <title>근태관리 | FollowMe</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />

<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.vacation-btn {
    background-color: #FFBE98 !important; /* 배경색 설정 */
    border-color: #FFBE98 !important; /* 버튼 테두리 색상 설정 */
    color: #ffffff !important; /* 버튼 텍스트 색상 설정 */
}

.vacation-btn:hover {
    background-color: #F2E8DA !important; /* hover 시 배경색 변경 */
    border-color: #F2E8DA !important; /* hover 시 테두리 색상 변경 */
}
.fc-toolbar-chunk>button{--ct-btn-color:#fff;--ct-btn-bg:#FFBE98;--ct-btn-border-color:#FFBE98;--ct-btn-hover-color:#fff;--ct-btn-hover-bg:#F2E8DA;--ct-btn-hover-border-color:#F2E8DA;--ct-btn-active-color:#fff;--ct-btn-active-bg:#F2E8DA;--ct-btn-active-border-color:#F2E8DA;--ct-btn-disabled-bg:#FFBE98;--ct-btn-disabled-border-color:#FFBE98;}
.table th, .table td {
            vertical-align: middle;
            font-size: 16px;
        }
        .table th {
            background-color: #f8f9fa;
            font-weight: bold;
            color: #343a40;
            padding: 8px;
        }
        
        .btn-group button {
            width: 120px;
            height: 36px;
            font-size: 14px;
            font-weight: 500;
        }
        .card {
            margin-bottom: 20px;
        }
        table {
            table-layout: fixed;
            width: 100%;
        }
        th, td {
            width: 33.33%;
            padding: 8px;
        }
        .at-item {
            display: inline-flex;
            align-items: center;
            margin-bottom: 10px;
            color: #343a40;
        }
        .at-item .at-icon {
            margin-right: 8px;
            font-size: 18px;
            color: #6c757d;
        }
        .at-item .at-text {
            font-size: 16px;
            font-weight: bold;
        }
         .filter-row {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
            margin-top: 20px;
        }
        .filter-row button {
            width: 45px;
            height: 45px;
            font-size: 16px;
            font-weight: bold;
            background-color: transparent; /* 버튼 배경 숨김 */
            border: none; /* 테두리 제거 */
            color: black; /* 텍스트 색상 변경 */
        }
        .filter-row span {
            margin: 0 10px;
            font-size: 24px; /* 년도와 월 폰트 크기 조정 */
            font-weight: bold;
            color: black; /* 텍스트 색상 변경 */
        }
        .mb-3 {
            margin-bottom: 20px;
        }
      
        
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

       <div class="content-page">
<!-- topbar include -->
          <jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
           <div class="content" style="background-color: #F2E8DA;">

               <!-- Start Content-->
               <div class="container-fluid">
                   
                   <!-- start page title -->
                   <div class="row">
                       <div class="col-12">
                           <div class="page-title-box">
                               <div class="page-title-right">
                                   <ol class="breadcrumb m-0">
                                       <li class="breadcrumb-item"><a href="javascript: void(0);">FollowMe</a></li>
                                       <li class="breadcrumb-item"><a href="javascript: void(0);">근태관리</a></li>
                                       <li class="breadcrumb-item active">근태관리</li>
                                   </ol>
                               </div>
                               <h4 class="page-title">근태관리</h4>
                           </div>
                       </div>
                   </div>
	                 <!-- 근태관리 페이지 시작 -->
	                       <div class="container">
	                        <!-- 년도와 월 선택 -->
											    <div class="filter-row">
											        <div class="col text-center">
											            <button id="prevMonth" class="btn btn-secondary" onclick="prev();">&lt;</button>
											            <span id="yearMonthDisplay">2024년 5월</span>
											            <button id="nextMonth" class="btn btn-secondary" onclick="next();">&gt;</button>
											        </div>
											    </div>
	                        <!-- 근태현황 -->
	                        <div class="row mb-4">
	                            <div class="col-md-12">
	                                <div class="menu-item at-item">
	                                    <span class="menu-icon at-icon"><i data-feather="list"></i></span>
	                                    <span class="menu-text at-text">근태현황</span>
	                                </div>
	                                <div class="card">
	                                    <div class="card-body">
	                                        <table class="table table-bordered text-center" id="countAttendanceByType">
	                                            <thead>
	                                                <tr>
	                                                		<th>출근</th>
	                                                    <th>지각</th>
	                                                    <th>조퇴</th>
	                                                    <th>결근</th>
	                                                </tr>
	                                            </thead>
	                                            <tbody>
	                                                <tr>
	                                                		<td>${countMap.B}회</td>
	                                                    <td>${countMap.E}회</td>
	                                                    <td>${countMap.C}회</td>
	                                                    <td>${countMap.D}회</td>
	                                                </tr>
	                                            </tbody>
	                                        </table>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    
	                        <!-- 근무현황 -->
	                        <div class="row mb-4">
	                            <div class="col-md-12">
	                                <div class="menu-item at-item">
	                                    <span class="menu-icon at-icon"><i data-feather="list"></i></span>
	                                    <span class="menu-text at-text">근무현황</span>
	                                </div>
	                                <div class="card">
	                                    <div class="card-body">
	                                        <table class="table table-bordered text-center" id="monthAttendanceTime">
	                                            <thead>
	                                                <tr>
	                                                    <th>근무일수</th>
	                                                    <th>근무시간</th>
	                                                    <th>평균근무시간</th>
	                                                </tr>
	                                            </thead>
	                                            <tbody>
	                                                <tr>
	                                                    <td>${attDto.workingDays}일</td>
	                                                    <td>${attDto.monthWorkTime}시간</td>
	                                                    <td>${attDto.avgWorkTime}시간</td>
	                                                </tr>
	                                            </tbody>
	                                        </table>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    
	                        <!-- 주간 및 월간 근무시간 -->
	                        <div class="row mb-4">
	                            <div class="col-md-12">
	                                <div class="menu-item at-item">
	                                    <span class="menu-icon at-icon"><i data-feather="clock"></i></span>
	                                    <span class="menu-text at-text">총 근무시간</span>
	                                </div>
	                                <div class="card">
	                                    <div class="card-body">
	                                        <table class="table table-bordered text-center" id="totalAttendanceTime">
	                                            <thead>
	                                                <tr>
	                                                    <th>총 근무시간</th>
	                                                    <th>총 근무일수</th>
	                                                </tr>
	                                            </thead>
	                                            <tbody>
	                                                <tr>
	                                                    <td>${totalDto.totalWorkTime}시간</td>
	                                                    <td>${totalDto.totalWorkingDays}일</td>
	                                                </tr>
	                                            </tbody>
	                                        </table>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        
	                        <!-- 올해 휴가현황 -->
	                        <div class="row mb-4">
	                            <div class="col-md-12">
	                                <div class="menu-item at-item">
	                                    <span class="menu-icon at-icon"><i data-feather="layers"></i></span>
	                                    <span class="menu-text at-text">올해 휴가현황</span>
	                                </div>
	                                <div class="card">
	                                    <div class="card-body">
	                                        <table class="table table-bordered text-center">
	                                            <thead>
	                                                <tr>
	                                                    <th>잔여 휴가</th>
	                                                    <th>휴가 신청</th>
	                                                    <th>휴가 신청 내역</th>
	                                                </tr>
	                                            </thead>
	                                            <tbody>
	                                                <tr>
	                                                    <td>${leftLeave}일</td>
	                                                    <td><button type="button" class="btn vacation-btn" onclick="location.href='${contextPath}/document/insertForm'">휴가 신청</button></td>
	                                                    <td><button type="button" class="btn vacation-btn" onclick="location.href='${contextPath}/document/list'">휴가 신청 내역</button></td>
	                                                </tr>
	                                            </tbody>
	                                        </table>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
														<!-- 근태관리 페이지 끝 -->
														<script>
												  
												    var currentYear;
												    var currentMonth;
												    
												    function loadMonthData(year, month) {
										            $.ajax({
										                url: "${contextPath}/attendance/attlist.do",
										                method: 'GET',
										                data: {
										                    year: year,
										                    month: month
										                },
										                success: function(data) {
										                		console.log(data);
										                		console.log('성공');
										                		
										                		var countAttendanceTableTd = '<tr>';
										                		countAttendanceTableTd += '<td>' + data.countMap.B + '회</td>';
										                		countAttendanceTableTd += '<td>' + data.countMap.E + '회</td>';
										                		countAttendanceTableTd += '<td>' + data.countMap.C + '회</td>';
										                		countAttendanceTableTd += '<td>' + data.countMap.D + '회</td>';
										                		countAttendanceTableTd += '</tr>';
										                		$('#countAttendanceByType tbody').html(countAttendanceTableTd);
	
										                		var monthAttendanceTableTd = '<tr>';
										                		monthAttendanceTableTd += '<td>' + data.attDto.workingDays + '일</td>';
										                		monthAttendanceTableTd += '<td>' + data.attDto.monthWorkTime + '시간</td>';
										                		monthAttendanceTableTd += '<td>' + data.attDto.avgWorkTime + '시간</td>';
										                		monthAttendanceTableTd += '</tr>';
										                		$('#monthAttendanceTime tbody').html(monthAttendanceTableTd);

										                },
										                error: function(error) {
										                    console.error('데이터를 가져오는 데 실패했습니다:', error);
										                }
										            });
											        }
												
												    // 이전 월 함수
												    function prev() {
												        if (currentMonth === 1) {
												            currentYear--;
												            currentMonth = 12;
												        } else {
												            currentMonth--;
												        }
												        updateYearMonthDisplay();
												        loadMonthData(currentYear, currentMonth);
												    }
												
												    // 다음 월 함수
												    function next() {
												        if (currentMonth === 12) {
												            currentYear++;
												            currentMonth = 1;
												        } else {
												            currentMonth++;
												        }
												        updateYearMonthDisplay();
												        loadMonthData(currentYear, currentMonth);
												    }
												
												    // 초기화 함수
												    function init() {
												        var currentDate = new Date();
												        currentYear = currentDate.getFullYear();
												        currentMonth = currentDate.getMonth() + 1;
												
												        // 초기 년/월 표시
												        updateYearMonthDisplay();
												    }
												    
														// 전역으로 선언할 함수
												    function updateYearMonthDisplay() {
												        $('#yearMonthDisplay').text(currentYear + '년 ' + currentMonth + '월');
												    }
												
												    // 문서가 준비되면 초기화 함수 호출
												    $(document).ready(function(){
												        init();
												    });
												</script>
														
               

                           <!-- Add New Event MODAL -->
                           <div class="modal fade" id="event-modal" tabindex="-1">
                               <div class="modal-dialog">
                                   <div class="modal-content">
                                       <div class="modal-header py-3 px-4 border-bottom-0 d-block">
                                           <button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"></button>
                                           <h5 class="modal-title" id="modal-title">Event</h5>
                                       </div>
                                       <div class="modal-body px-4 pb-4 pt-0">
                                           <form class="needs-validation" name="event-form" id="form-event" novalidate>
                                               <div class="row">
                                                   <div class="col-12">
                                                       <div class="mb-3">
                                                           <label class="form-label">Event Name</label>
                                                           <input class="form-control" placeholder="Insert Event Name"
                                                               type="text" name="title" id="event-title" required />
                                                           <div class="invalid-feedback">Please provide a valid event name</div>
                                                       </div>
                                                   </div>
                                                   <div class="col-12">
                                                       <div class="mb-3">
                                                           <label class="form-label">Category</label>
                                                           <select class="form-select" name="category" id="event-category" required>
                                                               <!-- <option value="bg-danger" selected>Danger</option> -->
                                                               <option value="bg-success">Employee</option>
                                                               <!-- <option value="bg-primary">Primary</option> -->
                                                               <option value="bg-info">Department</option>
                                                               <!-- <option value="bg-dark">Dark</option> -->
                                                               <option value="bg-warning">Company</option>
                                                           </select>
                                                           <div class="invalid-feedback">Please select a valid event category</div>
                                                       </div>
                                                   </div>
                                               </div>
                                               <div class="row mt-2">
                                                   <div class="col-md-6 col-4">
                                                       <button type="button" class="btn btn-danger" id="btn-delete-event">Delete</button>
                                                   </div>
                                                   <div class="col-md-6 col-8 text-end">
                                                       <button type="button" class="btn btn-light me-1" data-bs-dismiss="modal">Close</button>
                                                       <button type="submit" class="btn btn-success" id="btn-save-event">Save</button>
                                                   </div>
                                               </div>
                                           </form>
                                       </div>
                                   </div> <!-- end modal-content-->
                               </div> <!-- end modal dialog-->
                           </div>
                           <!-- end modal-->
                           
                       </div>
                       <!-- end col-12 -->
                   </div> <!-- end row -->
                   
               </div> <!-- container -->

           </div> <!-- content -->


   

       <!-- ============================================================== -->
       <!-- End Page content -->
       <!-- ============================================================== -->

   <!-- END wrapper -->

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

   <!-- plugin js -->
   <script src="${ contextPath }/assets/libs/moment/min/moment.min.js"></script>
  
   <!-- Calendar init -->
    <script src="${ contextPath }/assets/js/pages/calendar.init.js"></script>

</body>
</html>