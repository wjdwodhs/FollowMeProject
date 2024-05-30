<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">

<head>
<meta charset="utf-8" />
<title>전자결재 | Follow me</title>
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
    
    .container {
        display: flex;
        flex-direction: column;
        justify-content: center; /* 세로 가운데 정렬 */
        align-items: center; /* 가로 가운데 정렬 */
        height: 100vh; /* 화면 전체를 채우도록 설정 */
    }
    
    .top-row, .bottom-row {
    display: flex;
     /* 내부 아이템을 일정한 간격으로 배치 */
    }
    
    .box, .box2 {
    background-color: white;
    width:400px;
    text-align: center;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    margin-top: 25px;
    }
    
    .box2 > div {
    background-color: white;
    width: 50%; /* 가로 공간을 반씩 차지하도록 설정 */
    text-align: center;
    }
    
    .badge.label-table {
        font-size: 12px; /* 뱃지의 텍스트 크기를 조절합니다. */
        padding: 5px; /* 뱃지의 내부 여백을 조절합니다. */
    }
    tr>th, tr>td{
        text-align:center;
    }
    
    #top-middle{
        text-align:left;
    }
    
    .items{
        justify-content: space-between;
        display: flex;
        align-items: flex-end; /* 아이템들을 오른쪽으로 정렬합니다. */ 
        width: 300px;
    }
    
    .btn-group>a{
    	background-color: #FFBE98;
        border: 1px solid #FFBE98; /* 테두리 */
        --ct-btn-active-bg:#FA9A85;    
        --ct-btn-active-border-color:#FA9A85;
        --ct-btn-hover-bg:#FA9A85;
        --ct-btn-hover-border-color:#FA9A85;   
    }	
    
    #title:hover{cursor:pointer; font-weight: bold;}

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

			<div class="content" style="background-color: #F2E8DA; display:flex;">
                
                <div style="margin-top:50px;">
                    <ul class="menu">
                    		<c:if test="${loginUser.memGrade != '대표'}">
		                        <li class="menu-item">
		                            <a href="${ contextPath }/document/insertForm" class="menu-link">
		                                <span class="menu-icon"><i data-feather="edit-3"></i></span>
		                                <span class="menu-text"> 문서 작성하기 </span>
		                            </a>
		                        </li>
                        </c:if>
                        <li class="menu-item" style="margin-top:50px;">
                            <a href="${ contextPath }/document/list" class="menu-link">
                                <span class="menu-icon"><i data-feather="archive"></i></span>
                                <span class="menu-text"> 전체 문서함 </span>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="${ contextPath }/document/pendList" class="menu-link">
                                <span class="menu-icon"><i data-feather="refresh-cw"></i></span>
                                <span class="menu-text"> 진행중인 문서 </span>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="${ contextPath }/document/approvalList" class="menu-link">
                                <span class="menu-icon"><i data-feather="check-circle"></i></span>
                                <span class="menu-text"> <b>승인 문서함</b> </span>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="${ contextPath }/document/rejectList" class="menu-link">
                                <span class="menu-icon"><i data-feather="x"></i></span>
                                <span class="menu-text"> 반려 문서함 </span>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="${ contextPath }/document/recallList" class="menu-link">
                                <span class="menu-icon"><i data-feather="trash-2"></i></span>
                                <span class="menu-text"> 회수 문서함 </span>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="${ contextPath }/document/refList" class="menu-link">
                                <span class="menu-icon"><i data-feather="link"></i></span>
                                <span class="menu-text"> 참조 문서함 </span>
                            </a>
                        </li>
                        
                        <!-- 결재권자만 보이는 메뉴 -->
                        <c:if test="${loginUser.memGrade eq '팀장' || loginUser.memGrade eq '대표'}">
		                        <li class="menu-item">
		                            <a href="${ contextPath }/document/notDoneList" class="menu-link">
		                                <span class="menu-icon"><i data-feather="user-x"></i></span>
		                                <span class="menu-text"> 미처리 결재함 </span>
		                            </a>
		                        </li>
                        </c:if>
                    </ul>
                </div>


                
                <!-- Start Content-->
                <div class="container-fluid" style="width:87%;">
       
                    <div class="row">
                        <div class="col-12">
                            <div class="card" style="margin-top: 50px;">
                                    <div class="card-body">
                                        <div>
                                            <h4 class="header-title">결재 승인 문서</h4>
                                            <p class="sub-header">
                                                Access Electronic approval documents                                     
                                            </p>
                                        </div>
    
                                        <div class="mb-2" style="display: flex; justify-content: space-between;">
                                            <div class="row row-cols-sm-auto g-2 align-items-center" id="top-list">
                                                
                                                <form id="searchForm" action="${ contextPath }/document/status" method="get" style="margin-top: 10px;">
                                                		<div style="display:flex;">
                                                    		<input type="hidden" name="page">
		                                                    <div class="col-12 text-sm-center items">
		                                                        <c:choose>
		                                                        		<c:when test="${ loginUser.memGrade != '팀장' and loginUser.memGrade == '대표'} }">
						                                                        <select id="demo-foo-filter-status" name="condition" class="form-select form-select-sm" style="width: 120px;">
						                                                            <option value="docu_category_name">문서유형</option>
						                                                            <option value="docu_title">문서제목</option>
						                                                        </select>
		                                                        		</c:when>
		                                                        		<c:otherwise>
		                                                        				<!-- 팀장, 대표일 경우 -->
						                                                        <select id="demo-foo-filter-status" name="condition" class="form-select form-select-sm" style="width: 120px;">
						                                                            <option value="docu_category_name">문서유형</option>
						                                                            <option value="docu_title">문서제목</option>
						                                                            <option value="mem_name">기안자</option>
						                                                            <option value="dept_name">기안부서</option>
						                                                        </select>
				                                                        </c:otherwise>
		                                                        </c:choose>
		                                                        <input type="text" id="demo-foo-search" name="keyword" value="${ search.keyword }" placeholder="Search" class="form-control form-control-sm" autocomplete="on" style="width:150px;">
		                                                        <button type="submit" class="btn btn-soft-secondary btn-sm waves-effect" style="margin-left: 5px; width:70px;">검색</button>
		                                                        
		                                                    </div>
		                                                </div>
                                                </form>
                                                
                                                <c:if test="${ not empty search }">
																				            <script>
																				            	$(document).ready(function(){
																				            		$("#searchForm select").val("${search.condition}");
																				            		
																				            		//검색후 페이지일 경우 페이징바의 페이지 클릭시
																				            		$("#pagingArea a").on("click", function(){
																				            			$("#searchForm input[name=page]").val($(this).text());
																				            			$("#searchForm").submit();
																				            			return false; //기본이벤트 제거(즉, a태그에 작성되어있는 href="/list.do" 실행안되도록)
																				            		})
																				            	})
																				            </script>
																			          </c:if>
                                            </div>
                                            <c:if test="${loginUser.memGrade != '대표'}">
		                                            <div class="btn-group">
		                                            		<a href="${ contextPath }/document/insertForm" class="btn btn-primary btn-middle"> 작성하기 </a>
		                                            </div>
                                            </c:if>
                                        </div>
                                        
                                        
                                        <div class="table-responsive">
                                            <table id="demo-foo-filtering" class="table table-bordered toggle-circle mb-0" data-page-size="7">
                                                <thead>
		                                                <tr>
		                                                    <th>NO</th>
		                                                    <th>문서유형</th>
		                                                    <th>문서제목</th>
		                                                    <th>기안자</th>
		                                                    <th>기안부서</th>
		                                                    <th>기안일</th>
		                                                    <th>결재상태</th>
		                                                    <th>결재일</th>
		
		                                                </tr>
		                                                </thead>
		                                                <tbody>
		                                                
		                                                <c:choose>
		                                                		<c:when test="${empty list}">
		                                                				<tr>
		                                                						<td colspan="8">존재하는 문서가 없습니다.</td>
		                                                				</tr>
						                                            </c:when>
						                                            <c:otherwise>
						                                            		<c:forEach var="d" items="${ list }">
								                                                <tr>
								                                                    <td>${d.docuNo}</td>
								                                                    <td>${d.docuCategoryName}</td>
								                                                    <td style="text-align: left;" onclick="location.href='${contextPath}/document/detail?no=${d.docuNo}';" id="title">${d.docuTitle}</td>
								                                                    <td>${d.memName}</td>
								                                                    <td>${d.memDeptName}</td>
								                                                    <td>${d.registDate}</td>
								                                                    <td>
										                                                    <c:if test="${d.status eq '0'}">
										                                                    		<span class="badge label-table bg-warning">진행중</span>
										                                                    </c:if>
										                                                    <c:if test="${d.status eq '1'}">
										                                                    		<span class="badge label-table bg-success">승인</span>
										                                                    </c:if>
										                                                    <c:if test="${d.status eq '2'}">
										                                                    		<span class="badge label-table bg-danger">반려</span>
										                                                    </c:if>
										                                                    <c:if test="${d.status eq '3'}">
										                                                    		<span class="badge label-table bg-secondary">회수</span>
										                                                    </c:if>
								                                                    </td>
								                                                    <td>${d.finalApproveDate}</td>
								                                                </tr>
								                                            </c:forEach>
						                                            </c:otherwise>
		                                                </c:choose>
                                                </tbody>
                                            </table>
                                        </div> <!-- end .table-responsive-->
                                        <div id="pagingArea" style=" display: flex; justify-content: center; margin-top: 20px;">
														                <ul class="pagination">
														                    <li class="page-item ${ pi.currentPage == 1 ? 'disabled':'' }"><a class="page-link" href="${ contextPath }/document/approvalList?page=${pi.currentPage - 1}">Previous</a></li>
														                    
														                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
														                    <li class="page-item ${ pi.currentPage == p ? 'disabled':'' }"><a class="page-link" href="${ contextPath }/document/approvalList?page=${p}">${ p }</a></li>
														                    </c:forEach>
														                    
														                    <li class="page-item ${ pi.currentPage >= pi.maxPage ? 'disabled':''}" ><a class="page-link" href="${ contextPath }/document/approvalList?page=${pi.currentPage + 1}">Next</a></li>
														                </ul>
														            </div>
                                    </div>
                                </div> <!-- end card -->
                            </div> <!-- end col -->
                        </div>
                        <!-- end row -->



                        
                    </div> <!-- container -->

                </div> <!-- content -->

            </div>
      <!-- ============================================================== -->
      <!-- <-- End Page Content
      <!-- ============================================================== -->
      
      

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
        <script src="${ contextPath }/assets/libs/selectize/js/standalone/selectize.min.js"></script>
        
	
</body>
</html>