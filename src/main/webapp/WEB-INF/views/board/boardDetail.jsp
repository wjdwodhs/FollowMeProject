<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />

<style>
.photo>a>img{
    height: 25px;
    width: 25px;
}

.department{
    display: inline-block; 
    padding-bottom: 10px;
}

.info{display: inline-block;}

.article_view{
    padding: 25px;
    min-height: 300px;
   padding-bottom: 100px;
}

.editor_view{
    line-height: 1.5;
}

.content_view{

}

.part{
    margin: 5px;
}

.reply_warp>ul{
    list-style-type: none;
    padding-left: 0;
}

.reply_warp>ul>li{
    text-align: left;
}

.horizontal-line {
border-top: 1px solid lightgray; /* 가로 줄의 스타일 지정 */
margin: 10px 0; /* 원하는 여백 추가 */
}

.aaaa{
    margin-right: 15%;
}

.info-area{
	position:relative;
	overflow: auto;
}

.button>button{
	float: right;
	margin:2px;
	background-color: #FFBE98;
    border: 1px solid #FFBE98; /* 테두리 */
    --ct-btn-active-bg:#FA9A85;    
    --ct-btn-active-border-color:#FA9A85;
    --ct-btn-hover-bg:#FA9A85;
    --ct-btn-hover-border-color:#FA9A85;
}



#myLink {
	color:black;
}

#myLink:hover{
	text-decoration: underline;
    text-decoration-color: black;
}

.content-view>img{
	max-width: 500px; 
    max-height: 800px;
}

</style>
</head>
<body>

	<!-- Begin page -->
	<div id="wrapper">

  	<!-- sidemenu include -->
  	<jsp:include page="/WEB-INF/views/common/sidemenu.jsp"/>
  	
  	
  	
  	<div class="content-page">

                <div class="content" style="background-color: #F2E8DA">
					<!-- topbar include -->
    				<jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
    				
                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">FollowMe</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">게시판</a></li>
                                            <li class="breadcrumb-item active">상세페이지</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">전자게시판</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="row aaaa">
                        	<div class="col-1"></div>
                            <div class="col-10">
                            
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            
                                            <h3><b>${ board.boardTitle }</b></h3>
                                            <div class="info-area">
                                                <span class="department">
                                                    <p>${ board.deptName }</p>
                                                </span>
                                                <div class="info">
                                                    <a id="myLink" href="">${ board.memNo }</a>
                                                    <span> ${ board.enrollDate }</span>   
                                                </div>
                                                <div class="button">
                                                	<button class="btn btn-primary btn-sm historyBack" onclick="historyBack();" >목록가기 </button>
                                                	<form action="" method="post" id="Upd">
                                                	<input type="hidden" name="no" value="${ board.subNo }">
                                                		<button type="submit" class="btn btn-primary btn-sm" onclick="UpdSubmit(1);">수정하기</button>
                                                		<button type="submit" class="btn btn-primary btn-sm" onclick="UpdSubmit(2);">삭제하기</button>
                                                	</form>
                                                </div>
                                            </div>
                                            <hr>
                                            
                                            <script>
                                            	function UpdSubmit(num){
                                            		$("#Upd").attr("action", num==1 ? "${contextPath}/board/boardModify.Page" : "${contextPath}/board/boardRemove.do");
                                            	}
                                            </script>
                                            
                                            
                                            <div class="modal" id="myModal">
											  <div class="modal-dialog">
											    <div class="modal-content">
											
											      <!-- Modal Header -->
											      <div class="modal-header">
											        <h4 class="modal-title">사원 정보</h4>
											        <button type="button" class="close" data-dismiss="modal">&times;</button>
											      </div>
											
											      <!-- Modal body -->
											      <div class="modal-body">
											        직급: ${ board.memGrade } <br>
											        사원명: ${ board.memNo } <br>
											        부서: ${ board.deptName } <br>
											        Email: ${ board.memEmail }
											      </div>
											
											    </div>
											  </div>
											</div>

                                            <article class="article_view">
                                                <span class="editor_view">
                                                    <div class="content-view">
                                                    <p>
                                                    	${ board.boardContent }
                                                    </p>
                                                    	<c:forEach var="at" items="${ board.attachList }">
                                                    		<img src="${ contextPath }${ at.filePath }/${ at.systemName }">
                                                    	</c:forEach>
                                                    	
                                                    	<c:forEach var="at" items="${ board.attachList }">
                                                    		<div>
                                                    			<a href="${ contextPath }${at.filePath}/${at.systemName}" download="${ at.originName }">${ at.originName }</a>
                                                    		</div>
                                                    	</c:forEach>
                                                    </div>
                                                </span>
                                            </article>

                                            <div class="reply_warp">
                                                <ul class="reply_view">
                                                    <li>
                                                        <span class="reply ">댓글</span>
                                                        <span class="part">|</span>
                                                        <span>조회수 ${ board.readCount }</span>
                                                    </li>
                                                </ul>
                                                <div class="horizontal-line"></div>
                                            </div>
                                            

                                            
                                                <table id="replyArea" class="table">
                                                	<thead>
	                                                    <tr>
	                                                        <td style="width: 10%;">댓글</td>
	                                                        <td style="width: 80%;"><textarea name="" id="replyContent" cols="50" rows="2" style="width: 100%;"></textarea></td>
	                                                        <td style="width: 10%;"><button class="btn btn-primary btn-sm " onclick="ajaxReplyInsert();">등록</button></td>
	                                                    </tr>
                                                    </thead>
                                                    <tbody>
	                                                    
                                                    </tbody>
                                                </table>
                                            
                                            

                                        </div>  <!-- end row -->
                                    </div> <!-- end card body-->
                                </div> <!-- end card -->

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
                                                                    <option value="bg-danger" selected>Danger</option>
                                                                    <option value="bg-success">Success</option>
                                                                    <option value="bg-primary">Primary</option>
                                                                    <option value="bg-info">Info</option>
                                                                    <option value="bg-dark">Dark</option>
                                                                    <option value="bg-warning">Warning</option>
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
                            <div class="col-1"></div>
                            <!-- end col-12 -->
                        </div> <!-- end row -->
                        
                    </div> <!-- container -->

                </div> <!-- content -->

                <!-- Footer Start -->
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6">
                                <div><script>document.write(new Date().getFullYear())</script> © Ubold - <a href="https://coderthemes.com/" target="_blank">Coderthemes.com</a></div>
                            </div>
                            <div class="col-md-6">
                                <div class="d-none d-md-flex gap-4 align-item-center justify-content-md-end footer-links">
                                    <a href="javascript: void(0);">About</a>
                                    <a href="javascript: void(0);">Support</a>
                                    <a href="javascript: void(0);">Contact Us</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- end Footer -->

            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


        </div>
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
        <script>
        	function historyBack(){
        		location.href = "${ contextPath }/board/list.do"
        	}
        
	        function openModal() {
			  var modal = document.getElementById("myModal");
			  modal.style.display = "block";
			}
			
			// 모달 창 닫기
			function closeModal() {
			  var modal = document.getElementById("myModal");
			  modal.style.display = "none";
			}
			
			// 링크 클릭 시 모달 창 열기
			document.getElementById("myLink").addEventListener("click", function(event) {
			  event.preventDefault(); // 기본 이벤트(링크 이동) 방지
			  openModal();
			});
			
			// 모달 닫기 버튼과 모달 외부를 클릭 시 모달 창 닫기
			var closeBtn = document.getElementsByClassName("close")[0];
			var modal = document.getElementById("myModal");
			window.addEventListener("click", function(event) {
			  if (event.target == modal) {
			    closeModal();
			  }
			});
			closeBtn.addEventListener("click", function() {
			  closeModal();
			});
			
			
			
			$(document).ready(function(){
	      		ajaxReplyList();
	      		
	      		// 동적으로 만들어진 요소에 이벤트 걸때 => 이벤트 메소드방식 안됨
	      		//$(".removeReply").click(function(){
	      		//$(".removeReply").on("click", function(){
	      		$(document).on("click", ".removeReply", function(){
	      			
	      			console.log("삭제할댓글번호", $(this).data("replyno"));
	      			
	      			// 해당 댓글 삭제용 ajax요청
	      			$.ajax({
	      				url:"${contextPath}/board/replyDelete.do",
	      				type:"get",
	      				data:"no=" + $(this).data("replyno"),
	      				success:function(result){
	      					if(result == "SUCCESS"){
	      						ajaxReplyList();
	      					}
	      				}
	      			})
	      			
	      			
	      		})
	      		
	      	})
	      	
	      	function ajaxReplyInsert(){
	      		if($("#replyContent").val().trim().length != 0){
	      			$.ajax({
	      				url: "${contextPath}/board/replyInsert.do",
	      				type: "post",
	      				data:{
	      					replyContent:$("#replyContent").val(),
	      					refBno:${board.subNo},
	      					
	      				},
	      				success:function(result){
	      					if(result == "SUCCESS"){
	      						$("#replyContent").val("");
	      						ajaxReplyList();
	      					}else if(result == "FAIL"){
	      						alertify.alert("댓글 작성 서비스", "다시 입력해주세요")
	      					}
	      				},error:function(){
	      					console.log("ajax 통신 실패")
	      				}
	      			})
	      			
	      		}else{
	      			alertify.alert("댓글 작성 서비스", "다시 입력해주세요")
	      		}
	      	}
	      	
	      	
			
			
			function ajaxReplyList(){
	      		
	      		// 비동기식으로 "/board/replyList.do" url요청 
	      		// 요청처리 결과로 조회된 댓글리스트를 응답데이터로 받기
	      		// 해당 응답데이터 가지고 댓글 한개당 하나의 tr요소로 만들어서
	      		// tbody 영역에 뿌리기 
	      		// + 댓글 갯수도 수정
	      		$.ajax({
	      			url:"${contextPath}/board/replyList.do",
	      			type:"get",
	      			data:"no=${board.subNo}",
	      			success:function(resData){ // [{}, {}, {}, ..]
	      			
	      				console.log("댓글 리스트:", resData)
	      				
	      			
	      				$("#rcount").text(resData.length);
	      			
	      				let tr = "";
	      				for(let i=0; i<resData.length; i++){
	      					tr += "<tr>"
	      								+	 "<th>" + resData[i].memGrade + resData[i].memNo + "</th>"
	      								+	 "<td>" + resData[i].replyContent + "</td>"
	      								+	 "<td>" + resData[i].enrollDate;
	      					
	 								// 현재로그인한 회원이 해당 댓글의 작성자일 경우
	      					if(resData[i].memNo == '${loginUser.memName}')	{
	      						tr += "<button class='btn btn-sm btn-danger removeReply' data-replyno='" + resData[i].replyNo + "'>삭제</button>"
	      					}		
	      								
	      					tr += 	"</td>"
	      							 + "</tr>";
	      				}
	      				
	      				$("#replyArea tbody").html(tr);
	      			
	      			},error:function(){
	      				console.log("댓글 목록 조회용 ajax통신 실패");
	      			}
	      		})
	      		
	      	}
</script>
        
       

        

        <!-- plugin js -->
        <script src="assets/libs/moment/min/moment.min.js"></script>
     
        
        
        <!-- Vendor js -->
	        <script src="${ contextPath }/assets/js/vendor.min.js"></script>
			
			<!-- App js -->
	        <script src="${ contextPath }/assets/js/app.min.js"></script>
		
			<!-- Plugins js-->
	        <script src="${ contextPath }/assets/libs/flatpickr/flatpickr.min.js"></script>
	        <script src="${ contextPath }/assets/libs/apexcharts/apexcharts.min.js"></script>
	        <script src="${ contextPath }/assets/libs/selectize/js/standalone/selectize.min.js"></script>
	        
	        <!-- Dashboar 1 init js-->
	        
	        <!-- Plugins js -->
	        <script src="${ contextPath }/assets/libs/quill/quill.min.js"></script>
	
	        <!-- Init js-->
	        <script src="${ contextPath }/assets/js/pages/form-quilljs.init.js"></script>
  	
	
</body>
</html>