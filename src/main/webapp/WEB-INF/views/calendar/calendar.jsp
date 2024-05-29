<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">
<head>
<meta charset="utf-8" />
<title>일정관리 | FollowMe</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />

<!-- fullcalendar -->
<link href="${contextPath }/assets/libs/fullcalendar/main.min.css"
	rel="stylesheet" />
<script
	src="${contextPath}/assets/libs/fullcalendar/fullcalendar.global.min.js"></script>
<script
	src="${contextPath}/assets/libs/fullcalendar/google-calendar.global.js"></script>


<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<!-- Bootstrap JavaScript -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script> -->

<!--dateformat 바꿀 때 필요한 자바스크립트 라이브러리-->
<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <style>
 a.fc-event{
 	cursor:pointer;
 }
 
/* 버튼 E: 어두운 색상, 밝은 텍스트 */
.btn-customE {
    background-color: #8C3737; /* 어두운 색상 */
    width: 265px;
    height: 37px;
    color: #ffffff; /* 흰색 텍스트 */
    border: none; /* 버튼 테두리 제거 */
}

.btn-customE:hover {
    background-color: #6F2E2E; /* 호버 시 배경색: 더 어둡게 */
}

/* 버튼 D: 중간 색상, 밝은 텍스트 */
.btn-customD {
    background-color: #BA6B6B; /* 중간 색상 */
    width: 265px;
    height: 37px;
    color: #ffffff; /* 흰색 텍스트 */
    border: none; /* 버튼 테두리 제거 */
}

.btn-customD:hover {
    background-color: #9F5151; /* 호버 시 배경색: 더 어둡게 */
}

/* 버튼 C: 밝은 색상, 어두운 텍스트 */
.btn-customC {
    background-color: #FF7F7F; /* 밝은 색상 */
    width: 265px;
    height: 37px;
    color: #ffffff; /* 흰색 텍스트 */
    border: none; /* 버튼 테두리 제거 */
}

.btn-customC:hover {
    background-color: #E66666; /* 호버 시 배경색: 더 어둡게 */
}

/* 버튼 A: 가장 밝은 색상, 어두운 텍스트 */
.btn-customA {
    background-color: #FFB2A5; /* 가장 밝은 색상 */
    width: 265px;
    height: 37px;
    color: #ffffff; /* 흰색 텍스트 */
    border: none; /* 버튼 테두리 제거 */
}

.btn-customA:hover {
    background-color: #E09F93; /* 호버 시 배경색: 더 어둡게 */
}



  </style>
</head>
<body>

	<!-- Begin page -->
	<div id="wrapper">
		<!-- sidemenu include -->
		<jsp:include page="/WEB-INF/views/common/sidemenu.jsp" />
		<!-- ============================================================== -->
		<!-- Start Page Content here -->
		<!-- ============================================================== -->
		<div class="content-page">
			<!-- topbar include -->
			<jsp:include page="/WEB-INF/views/common/topbar.jsp" />

			<div class="content" style="background-color: #F2E8DA;">

				<!-- Start Content-->
				<div class="container-fluid">

					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">FollowMe</a></li>
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">일정관리</a></li>
										<li class="breadcrumb-item active">일정관리</li>
									</ol>
								</div>
								<h4 class="page-title">일정관리</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-12">

							<div class="card">
			           <div class="card-body">
			               <div class="row" style="display:flex; justify-content:center;">
			                    
			                    <div class="col-lg-3">
			                       <div id="external-events" style="margin-top: 50px;">
	                              <button type="button" class="btn-customA" data-type="">전체 일정</button>
														    <button type="button" class="btn-customC" data-type="C">회사 일정</button>
														    <button type="button" class="btn-customD" data-type="D">부서 일정</button>
														    <button type="button" class="btn-customE" data-type="E">개인 일정</button>
	                          </div>
			                   </div> 
			                   
			                   <!-- end col -->
			
			                   <div class="col-lg-9">
			                       <div id="calendar"></div>
			                   </div> <!-- end col -->
			
			               </div>  <!-- end row -->
			           </div> <!-- end card body-->
			       </div> <!-- end card -->

							<!-- 부트스트랩 modal 추가 부분 -->
							<!-- start modal -->
							<div class="modal fade" id="event-addmodal" tabindex="-1">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header py-3 px-4 border-bottom-0 d-block">
											<button type="button" class="btn-close float-end"
												data-bs-dismiss="modal" aria-label="Close"></button>
											<h5 class="modal-title" id="modal-title">일정 추가</h5>
										</div>
										 <input type="hidden" id="event-memNo" value="${loginUser.memNo}" />
										 <input type="hidden" id="event-calNo">
						
										<div class="modal-body px-4 pb-4 pt-0">
											<form class="needs-validation" name="event-form"
												id="form-addEvent" novalidate>
												<div class="row">
													<div class="col-12">
														<div class="mb-3">
															<label class="form-label">일정 제목</label> <input
																class="form-control" type="text" name="title"
																id="event-title" required />
														</div>
													</div>
													<div class="col-12">
														<div class="mb-3">
															<label class="form-label">일정 내용</label>
															<textarea class="form-control" name="content"
																id="event-content" style="resize: none;"></textarea>
														</div>
													</div>
													<div class="col-12">
														<div class="mb-3">
															<label class="form-label">시작 일자</label> <input
																class="form-control" type="datetime-local" name="start"
																id="event-start" min=""/>
														</div>
													</div>
													<div class="col-12">
														<div class="mb-3">
															<label class="form-label">종료 일자</label> <input
																class="form-control" type="datetime-local" name="end"
																id="event-end" min=""/>
														</div>
													</div>
													<div class="col-12">
														<div class="mb-3">
													    <label class="form-label">카테고리</label> 
													    <select class="form-select" name="category" id="event-category" required>
													        <c:choose>
													            <c:when test="${loginUser.memGrade == '팀장'}">
													                <option value="#8C3737" selected>개인</option>
													                <option value="#BA6B6B">부서</option>
													            </c:when>
													            <c:when test="${loginUser.memGrade == '대표'}">
													                <option value="#8C3737" selected>개인</option>
													                <option value="#BA6B6B">부서</option>
													                <option value="#FF7F7F">회사</option>
													            </c:when>
													            <c:otherwise>
													                <option value="#8C3737" selected>개인</option>
													            </c:otherwise>
													        </c:choose>
													    </select>
													</div>
													</div>
												</div>
												<div class="row mt-2">
													<div class="col-md-12 col-8 text-end">
														<button type="button" class="btn btn-light me-1"
															data-bs-dismiss="modal">Close</button>
														<button type="button" class="btn"
															style="background-color: #FFBE98; color: white;"
															id="btn-save-event" onclick="saveEvent();">Save</button>
													</div>
												</div>
											</form>
										</div>
									</div>
									<!-- end modal-content-->
								</div>
								<!-- end modal dialog-->
							</div>
							<!-- end modal-->
							<!-- 부트스트랩 modal 수정 부분 -->
							<!-- start modal -->
							<div class="modal fade" id="event-modifymodal" tabindex="-1">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header py-3 px-4 border-bottom-0 d-block">
											<button type="button" class="btn-close float-end"
												data-bs-dismiss="modal" aria-label="Close"></button>
											<h5 class="modal-title" id="modal-title">일정 수정</h5>
										</div>
										<div class="modal-body px-4 pb-4 pt-0">
											<form class="needs-validation" name="event-form"
												id="form-modifyEvent" novalidate>
												<div class="row">
													<input type="hidden" id="modify-event-calNo">
													<!-- calNo를 hidden 필드로 추가 -->
													<div class="col-12">
														<div class="mb-3">
															<label class="form-label">일정 제목</label> <input
																class="form-control" type="text" name="title"
																id="modify-event-title" required />
														</div>
													</div>
													<div class="col-12">
														<div class="mb-3">
															<label class="form-label">일정 내용</label>
															<textarea class="form-control" name="content"
																id="modify-event-content" style="resize: none;"></textarea>
														</div>
													</div>
													<div class="col-12">
														<div class="mb-3">
															<label class="form-label">시작 일자</label> <input
																class="form-control" type="datetime-local" name="start"
																id="modify-event-start" />
														</div>
													</div>
													<div class="col-12">
														<div class="mb-3">
															<label class="form-label">종료 일자</label> <input
																class="form-control" type="datetime-local" name="end"
																id="modify-event-end" />
														</div>
													</div>
													<div class="col-12">
														<div class="mb-3">
													    <label class="form-label">카테고리</label> 
													    <select class="form-select" name="category" id="modify-event-category" required>
													        <c:choose>
													            <c:when test="${loginUser.memGrade == '팀장'}">
													                <option value="#8C3737" selected>개인</option>
													                <option value="#BA6B6B">부서</option>
													            </c:when>
													            <c:when test="${loginUser.memGrade == '대표'}">
													                <option value="#8C3737" selected>개인</option>
													                <option value="#BA6B6B">부서</option>
													                <option value="#FF7F7F">회사</option>
													            </c:when>
													            <c:otherwise>
													                <option value="#8C3737" selected>개인</option>
													            </c:otherwise>
													        </c:choose>
													    </select>
													</div>
													</div>
												</div>
												<div class="row mt-2">
													<div class="col-md-12 col-8 text-end">
														<button type="button" class="btn btn-light me-1"
															data-bs-dismiss="modal">Close</button>
														<button type="button" class="btn"
															style="background-color: #FFBE98; color: white;"
															id="btn-modify-event" onclick="modifyEvent();">Save</button>
															<button type="button" class="btn"
																style="background-color: #FFBE98; color: white;"
																id="btn-delete-event" onclick="deleteEvent();">Delete</button>
													</div>
												</div>
											</form>
										</div>
									</div>
									<!-- end modal-content-->
								</div>
								<!-- end modal dialog-->
							</div>
							<!-- end modal-->
							<!-- 부트스트랩 modal 확인 부분 -->
							<!-- start modal -->
							<div class="modal fade" id="event-modal" tabindex="-1">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header py-3 px-4 border-bottom-0 d-block">
											<button type="button" class="btn-close float-end"
												data-bs-dismiss="modal" aria-label="Close"></button>
											<h5 class="modal-title" id="modal-title">일정 확인</h5>
										</div>
										<div class="modal-body px-4 pb-4 pt-0">
											<form class="needs-validation" name="event-form"
												id="form-addEvent" novalidate>
												<div class="row">
													<div class="col-12">
														<div class="mb-3">
															<label class="form-label">일정 제목</label> <input
																class="form-control" type="text" name="title"
																id="chk-event-title" required />
														</div>
													</div>
													<div class="col-12">
														<div class="mb-3">
															<label class="form-label">일정 내용</label>
															<textarea class="form-control" name="content"
																id="chk-event-content" style="resize: none;"></textarea>
														</div>
													</div>
													<div class="col-12">
														<div class="mb-3">
															<label class="form-label">시작 일자</label> <input
																class="form-control" type="datetime-local" name="start"
																id="chk-event-start" min=""/>
														</div>
													</div>
													<div class="col-12">
														<div class="mb-3">
															<label class="form-label">종료 일자</label> <input
																class="form-control" type="datetime-local" name="end"
																id="chk-event-end" min=""/>
														</div>
													</div>
													<div class="col-12">
														<div class="mb-3">
															<label class="form-label">카테고리</label> 
															<select
																class="form-select" name="category" id="chk-event-category"
																required>
																<option value="#8C3737" selected>개인</option>
																<option value="#BA6B6B">부서</option>
																<option value="#FF7F7F">회사</option>
															</select>
														</div>
													</div>
												</div>
												<div class="row mt-2">
													<div class="col-md-12 col-8 text-end">
														<button type="button" class="btn btn-light me-1"
															data-bs-dismiss="modal">Close</button>
													</div>
												</div>
											</form>
										</div>
									</div>
									<!-- end modal-content-->
								</div>
								<!-- end modal dialog-->
							</div>
							<!-- end modal-->

						</div>
						<!-- end col-12 -->

					</div>
					<!-- end row -->

				</div>
				<!-- container -->

			</div>
			<!-- content -->
		</div>

		<!-- ============================================================== -->
		<!-- End Page content -->
		<!-- ============================================================== -->


	</div>
	<!-- END wrapper -->




	<!-- Theme Settings -->
	<div class="offcanvas offcanvas-end right-bar" tabindex="-1"
		id="theme-settings-offcanvas">
		<div class="d-flex align-items-center w-100 p-0 offcanvas-header">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs nav-bordered nav-justified w-100"
				role="tablist">
				<li class="nav-item"><a class="nav-link py-2"
					data-bs-toggle="tab" href="#chat-tab" role="tab"> <i
						class="mdi mdi-message-text d-block font-22 my-1"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link py-2"
					data-bs-toggle="tab" href="#tasks-tab" role="tab"> <i
						class="mdi mdi-format-list-checkbox d-block font-22 my-1"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link py-2 active"
					data-bs-toggle="tab" href="#settings-tab" role="tab"> <i
						class="mdi mdi-cog-outline d-block font-22 my-1"></i>
				</a></li>
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
						<a href="javascript: void(0);"
							class="text-reset notification-item ps-3 mb-2 d-block"> <i
							class="mdi mdi-checkbox-blank-circle-outline me-1 text-success"></i>
							<span class="mb-0 mt-1">App Development</span>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item ps-3 mb-2 d-block"> <i
							class="mdi mdi-checkbox-blank-circle-outline me-1 text-warning"></i>
							<span class="mb-0 mt-1">Office Work</span>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item ps-3 mb-2 d-block"> <i
							class="mdi mdi-checkbox-blank-circle-outline me-1 text-danger"></i>
							<span class="mb-0 mt-1">Personal Group</span>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item ps-3 d-block"> <i
							class="mdi mdi-checkbox-blank-circle-outline me-1"></i> <span
							class="mb-0 mt-1">Freelance</span>
						</a>
					</div>

					<h6 class="fw-medium mt-3 text-uppercase">
						Favourites <a href="javascript: void(0);"
							class="font-18 text-danger"><i
							class="float-end mdi mdi-plus-circle"></i></a>
					</h6>

					<div>
						<a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="assets/images/users/user-10.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status online"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Andrew Mackie</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">It will seem like simplified
											English.</p>
									</div>
								</div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="assets/images/users/user-1.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status away"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Rory Dalyell</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">To an English person, it
											will seem like simplified</p>
									</div>
								</div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="assets/images/users/user-9.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status busy"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Jaxon Dunhill</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">To achieve this, it would be
											necessary.</p>
									</div>
								</div>
							</div>
						</a>
					</div>

					<h6 class="fw-medium mt-3 text-uppercase">
						Other Chats <a href="javascript: void(0);"
							class="font-18 text-danger"><i
							class="float-end mdi mdi-plus-circle"></i></a>
					</h6>

					<div class="pb-4">
						<a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="assets/images/users/user-2.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status online"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Jackson Therry</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">Everyone realizes why a new
											common language.</p>
									</div>
								</div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="assets/images/users/user-4.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status away"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Charles Deakin</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">The languages only differ in
											their grammar.</p>
									</div>
								</div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="assets/images/users/user-5.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status online"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Ryan Salting</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">If several languages
											coalesce the grammar of the resulting.</p>
									</div>
								</div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="assets/images/users/user-6.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status online"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Sean Howse</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">It will seem like simplified
											English.</p>
									</div>
								</div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="assets/images/users/user-7.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status busy"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Dean Coward</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">The new common language will
											be more simple.</p>
									</div>
								</div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="assets/images/users/user-8.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status away"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Hayley East</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">One could refuse to pay
											expensive translators.</p>
									</div>
								</div>
							</div>
						</a>

						<div class="text-center mt-3">
							<a href="javascript:void(0);" class="btn btn-sm btn-white"> <i
								class="mdi mdi-spin mdi-loading me-2"></i> Load more
							</a>
						</div>
					</div>

				</div>

				<div class="tab-pane" id="tasks-tab" role="tabpanel">
					<h6 class="fw-medium p-3 m-0 text-uppercase">Working Tasks</h6>
					<div class="px-2">
						<a href="javascript: void(0);"
							class="text-reset item-hovered d-block p-2">
							<p class="text-muted mb-0">
								App Development<span class="float-end">75%</span>
							</p>
							<div class="progress mt-2" style="height: 4px;">
								<div class="progress-bar bg-success" role="progressbar"
									style="width: 75%" aria-valuenow="75" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset item-hovered d-block p-2">
							<p class="text-muted mb-0">
								Database Repair<span class="float-end">37%</span>
							</p>
							<div class="progress mt-2" style="height: 4px;">
								<div class="progress-bar bg-info" role="progressbar"
									style="width: 37%" aria-valuenow="37" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset item-hovered d-block p-2">
							<p class="text-muted mb-0">
								Backup Create<span class="float-end">52%</span>
							</p>
							<div class="progress mt-2" style="height: 4px;">
								<div class="progress-bar bg-warning" role="progressbar"
									style="width: 52%" aria-valuenow="52" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</a>
					</div>

					<h6 class="fw-medium mb-0 mt-4 text-uppercase">Upcoming Tasks</h6>

					<div>
						<a href="javascript: void(0);"
							class="text-reset item-hovered d-block p-2">
							<p class="text-muted mb-0">
								Sales Reporting<span class="float-end">12%</span>
							</p>
							<div class="progress mt-2" style="height: 4px;">
								<div class="progress-bar bg-danger" role="progressbar"
									style="width: 12%" aria-valuenow="12" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset item-hovered d-block p-2">
							<p class="text-muted mb-0">
								Redesign Website<span class="float-end">67%</span>
							</p>
							<div class="progress mt-2" style="height: 4px;">
								<div class="progress-bar bg-primary" role="progressbar"
									style="width: 67%" aria-valuenow="67" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset item-hovered d-block p-2">
							<p class="text-muted mb-0">
								New Admin Design<span class="float-end">84%</span>
							</p>
							<div class="progress mt-2" style="height: 4px;">
								<div class="progress-bar bg-success" role="progressbar"
									style="width: 84%" aria-valuenow="84" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</a>
					</div>

					<div class="p-3 mt-2 d-grid">
						<a href="javascript: void(0);"
							class="btn btn-success waves-effect waves-light">Create Task</a>
					</div>

				</div>

				<div class="tab-pane active" id="settings-tab" role="tabpanel">

					<div class="mt-n3">
						<h6
							class="fw-medium py-2 px-3 font-13 text-uppercase bg-light mx-n3 mt-n3 mb-3">
							<span class="d-block py-1">Theme Settings</span>
						</h6>
					</div>

					<div class="alert alert-warning" role="alert">
						<strong>Customize </strong> the overall color scheme, sidebar
						menu, etc.
					</div>

					<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Color Scheme</h5>

					<div class="colorscheme-cardradio">
						<div class="d-flex flex-column gap-2">
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-bs-theme" id="layout-color-light" value="light">
								<label class="form-check-label" for="layout-color-light">Light</label>
							</div>

							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-bs-theme" id="layout-color-dark" value="dark">
								<label class="form-check-label" for="layout-color-dark">Dark</label>
							</div>
						</div>
					</div>

					<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Content Width</h5>
					<div class="d-flex flex-column gap-2">
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox"
								name="data-layout-width" id="layout-width-default"
								value="default"> <label class="form-check-label"
								for="layout-width-default">Fluid (Default)</label>
						</div>

						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox"
								name="data-layout-width" id="layout-width-boxed" value="boxed">
							<label class="form-check-label" for="layout-width-boxed">Boxed</label>
						</div>
					</div>

					<div id="layout-mode">
						<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Layout Mode</h5>

						<div class="d-flex flex-column gap-2">
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-layout-mode" id="layout-mode-default"
									value="default"> <label class="form-check-label"
									for="layout-mode-default">Default</label>
							</div>


							<div id="layout-detached">
								<div class="form-check form-switch">
									<input class="form-check-input" type="checkbox"
										name="data-layout-mode" id="layout-mode-detached"
										value="detached"> <label class="form-check-label"
										for="layout-mode-detached">Detached</label>
								</div>
							</div>
						</div>
					</div>

					<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Topbar Color</h5>

					<div class="d-flex flex-column gap-2">
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox"
								name="data-topbar-color" id="topbar-color-light" value="light">
							<label class="form-check-label" for="topbar-color-light">Light</label>
						</div>

						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox"
								name="data-topbar-color" id="topbar-color-dark" value="dark">
							<label class="form-check-label" for="topbar-color-dark">Dark</label>
						</div>

						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox"
								name="data-topbar-color" id="topbar-color-brand" value="brand">
							<label class="form-check-label" for="topbar-color-brand">Brand</label>
						</div>
					</div>

					<div>
						<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Menu Color</h5>

						<div class="d-flex flex-column gap-2">
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-menu-color" id="leftbar-color-light" value="light">
								<label class="form-check-label" for="leftbar-color-light">Light</label>
							</div>

							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-menu-color" id="leftbar-color-dark" value="dark">
								<label class="form-check-label" for="leftbar-color-dark">Dark</label>
							</div>
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-menu-color" id="leftbar-color-brand" value="brand">
								<label class="form-check-label" for="leftbar-color-brand">Brand</label>
							</div>
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-menu-color" id="leftbar-color-gradient"
									value="gradient"> <label class="form-check-label"
									for="leftbar-color-gradient">Gradient</label>
							</div>
						</div>
					</div>

					<div id="menu-icon-color">
						<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Menu Icon Color</h5>

						<div class="d-flex flex-column gap-2">
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-two-column-color" id="twocolumn-menu-color-light"
									value="light"> <label class="form-check-label"
									for="twocolumn-menu-color-light">Light</label>
							</div>

							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-two-column-color" id="twocolumn-menu-color-dark"
									value="dark"> <label class="form-check-label"
									for="twocolumn-menu-color-dark">Dark</label>
							</div>
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-two-column-color" id="twocolumn-menu-color-brand"
									value="brand"> <label class="form-check-label"
									for="twocolumn-menu-color-brand">Brand</label>
							</div>
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-two-column-color" id="twocolumn-menu-color-gradient"
									value="gradient"> <label class="form-check-label"
									for="twocolumn-menu-color-gradient">Gradient</label>
							</div>
						</div>
					</div>

					<div>
						<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Menu Icon Tone</h5>

						<div class="d-flex flex-column gap-2">
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-menu-icon" id="menu-icon-default" value="default">
								<label class="form-check-label" for="menu-icon-default">Default</label>
							</div>

							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-menu-icon" id="menu-icon-twotone" value="twotones">
								<label class="form-check-label" for="menu-icon-twotone">Twotone</label>
							</div>
						</div>
					</div>

					<div id="sidebar-size">
						<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Sidebar Size</h5>

						<div class="d-flex flex-column gap-2">
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-sidenav-size" id="leftbar-size-default"
									value="default"> <label class="form-check-label"
									for="leftbar-size-default">Default</label>
							</div>

							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-sidenav-size" id="leftbar-size-compact"
									value="compact"> <label class="form-check-label"
									for="leftbar-size-compact">Compact (Medium Width)</label>
							</div>

							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-sidenav-size" id="leftbar-size-small"
									value="condensed"> <label class="form-check-label"
									for="leftbar-size-small">Condensed (Icon View)</label>
							</div>

							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-sidenav-size" id="leftbar-size-full" value="full">
								<label class="form-check-label" for="leftbar-size-full">Full
									Layout</label>
							</div>

							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-sidenav-size" id="leftbar-size-fullscreen"
									value="fullscreen"> <label class="form-check-label"
									for="leftbar-size-fullscreen">Fullscreen Layout</label>
							</div>
						</div>
					</div>

					<div id="sidebar-user">
						<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Sidebar User
							Info</h5>

						<div class="form-check form-switch">
							<input type="checkbox" class="form-check-input"
								name="data-sidebar-user" id="sidebaruser-check"> <label
								class="form-check-label" for="sidebaruser-check">Enable</label>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="offcanvas-footer border-top py-2 px-2 text-center">
			<div class="d-flex gap-2">
				<button type="button" class="btn btn-light w-50" id="reset-layout">Reset</button>
				<a href="https://1.envato.market/uboldadmin"
					class="btn btn-danger w-50" target="_blank"><i
					class="mdi mdi-basket me-1"></i> Buy</a>
			</div>
		</div>
	</div>

	<!-- Vendor js -->
	<script src="${ contextPath }/assets/js/vendor.min.js"></script>

	<!-- App js -->
	<script src="${ contextPath }/assets/js/app.min.js"></script>

	<!-- plugin js -->
	<script src="${ contextPath }/assets/libs/moment/min/moment.min.js"></script>
	
<script>

	    var currentUserID = "${loginUser.memNo}";
	    var holidaySource = {
	        googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
	        backgroundColor: 'red'  // 공휴일 배경색 지정
	    };
	    var calendar;
		//페이지 로드 시 실행될 함수
		$(document).ready(function () {
		
		    // 일정 리스트 조회 요청
		    $.ajax({
		        url: "${contextPath}/calendar/list.do", // 일정 리스트 조회 URL
		        method: "GET",
		        dataType: "json",
		        success: function (data) {
		            initializeCalendar(data); // 캘린더 초기화 함수 호출
		        },
		        error: function (xhr, status, error) {
		            console.error("일정 리스트 조회 실패:", error);
		        }
		    });
		});
		
	// 캘린더 생성 함수 
	function initializeCalendar(events){
		
				const targetDiv = document.getElementById('calendar');
        calendar = new FullCalendar.Calendar(targetDiv, {
            slotDuration: "00:15:00",
            slotMinTime: "08:00:00",
            slotMaxTime: "19:00:00",
            eventTimeFormat: { // like '14:30:00'
					    hour: '2-digit',
					    minute: '2-digit',
					    hour12: false
					  },
            themeSystem: "bootstrap",
            customButtons: {
                PlusButton: {
                    text: "일정 추가하기",
                    click: function () {
                        // 부트스트랩 모달(일정 추가)
                        $("#event-addmodal").modal("show");
                    }
                },
            },
            bootstrapFontAwesome: false,
            buttonText: {
                today: "오늘",
                month: "월별",
                week: "주간",
                day: "일별",
                list: "오늘의 일정",
                prev: "이전",
                next: "다음"
            },
            initialView: "dayGridMonth",
            titleFormat: function (date) {
                year = date.date.year;
                month = date.date.month + 1;
                return year + "년 " + month + "월";
            },
            handleWindowResize: true,
            headerToolbar: {
                left: "prev,next today,PlusButton",
                center: "title",
                right: "dayGridMonth,timeGridWeek,timeGridDay"
            },
            eventSources: [holidaySource], // 공휴일 추가
            editable: false,
            droppable: false,
            selectable: true,
            events: events, // 데이터를 가져와서 캘린더에 표시
            dateClick: function (eventInfo) {
                console.log(eventInfo);
                dateClickEvent(eventInfo);
            },
            eventClick: function (eventInfo) {
            	  console.log(eventInfo); 
                eventInfo.jsEvent.preventDefault();
                eventClickEvent(eventInfo);
            },
            googleCalendarApiKey: 'AIzaSyC0QldKNU6DxP9twtldrmsnfJPimNvzRXo',
            
        });
       calendar.render();
	}
	
	// 이벤트 선택 시 수정 모달 표시 
     function eventClickEvent(info) {
         if (info.event.backgroundColor === '') {
             return;
         }

         if (info.event.extendedProps.memNo === currentUserID) {
             $("#event-modifymodal").modal("show");
             $("#modify-event-title").val(info.event.title);
             $("#modify-event-content").val(info.event.extendedProps.content);
             $("#modify-event-start").val(formatDate(info.event.start)); 
             $("#modify-event-end").val(formatDate(info.event.end)); 
             $("#modify-event-category").val(info.event.extendedProps.category);
             $("#modify-event-calNo").val(info.event.extendedProps.calNo);
             console.log(info.event.start);
         } else { // 일치하지 않으면 제목과 내용, 카테고리 확인만
             $("#event-modal").modal("show");
             $("#chk-event-title").val(info.event.title);
             $("#chk-event-content").val(info.event.extendedProps.content);
             $("#chk-event-category").val(info.event.extendedProps.category);
             $("#chk-event-start").val(formatDate(info.event.start)); 
             $("#chk-event-end").val(formatDate(info.event.end)); 

             // 확인 모달에서 입력 필드를 읽기 전용으로 설정
             $("#chk-event-title").prop("readonly", true);
             $("#chk-event-content").prop("readonly", true);
             $("#chk-event-start").prop("readonly", true);
             $("#chk-event-end").prop("readonly", true);
             $("#chk-event-category").prop("disabled", true);
         }
     }
	
	// 일정 수정 버튼 클릭 시 실행되는 함수
    function modifyEvent() {
        var eventData = {
            title: $("#modify-event-title").val(),
            content: $("#modify-event-content").val(),
            start: $("#modify-event-start").val(),
            end: $("#modify-event-end").val(),
            category: $("#modify-event-category").val(),
            calNo : $("#modify-event-calNo").val()
        };
        $.ajax({
            url: "${contextPath}/calendar/update.do",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(eventData),
            dataType: "json",
            success: function () {
                alert('일정이 성공적으로 수정되었습니다.');
                calendar.refetchEvents(); // 캘린더에서 일정 다시 불러오기
                $("#event-modifymodal").modal("hide");
                location.reload();
            }
        });
    }
	
 // 일정 저장 버튼 클릭 시 실행되는 함수
    function saveEvent() {
        var eventData = {
            title: $("#event-title").val(),
            content: $("#event-content").val(),
            start: $("#event-start").val(),
            end: $("#event-end").val(),
            category: $("#event-category").val(),
            backgroundColor: $("#event-category").val(),
            memNo: $("#event-memNo").val(),
            calNo: $("#event-calNo").val(),
        };

        console.log(eventData);
        // 빈값 입력 시 오류 처리
        if (
            eventData.title == "" ||
            eventData.start == "" ||
            eventData.end == ""
        ) {
            alert("입력하지 않은 값이 있습니다.");
        } else if ($("#start").val() > $("#end").val()) {
            alert("시간을 잘못입력 하셨습니다.");
        } else { // 일정 추가
            console.log(eventData);
            $.ajax({
                url: "${contextPath}/calendar/insert.do",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(eventData),
                dataType: "json",
                success: function () {
                    alert('일정이 성공적으로 추가되었습니다.');
                    //calendar.addEvent(eventData); // 새로운 이벤트 추가
                    location.reload();
                    $("#event-addmodal").modal("hide");
                    $("#event-title").val("");
                    $("#event-content").val("");
                    $("#event-start").val("");
                    $("#event-end").val("");
                    $("#event-category").val("");
                    $("#event-memNo").val("");
                }
            });
        }
    }
	
	// 일정 삭제 버튼 클릭 시 실행되는 함수
    function deleteEvent() {
        var eventCalNo = $("#modify-event-calNo").val();
        var confirmation = confirm("일정을 삭제하시겠습니까?");
        if (confirmation) {
            $.ajax({
                url: "${contextPath}/calendar/delete.do",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ no: eventCalNo }),
                dataType: "json",
                success: function () {
                    alert('일정이 성공적으로 삭제되었습니다.');
                    $("#event-modifymodal").modal("hide");
                    calendar.refetchEvents(); // 캘린더에서 일정 다시 불러오기
                    location.reload();
                }
            });
        }
    }
	
 // 카테고리별 일정 조회
   $(".btn-customA, .btn-customE, .btn-customD, .btn-customC").click(function() {
       var type = $(this).data("type"); // 클릭한 버튼의 타입 가져오기

       // 서버에 해당 타입의 일정 조회 요청 보내기
       $.ajax({
           url: "${contextPath}/calendar/listType.do", // 타입별 일정 조회 URL로 변경
           method: "GET",
           dataType: "json",
           data: { type: type }, 
           success: function(data) {
               //calendar.removeAllEvents(); // 기존 일정 모두 제거
               //initializeCalendar(data); // 캘린더 초기화 함수 호출
                
               // 기존 일정과 공휴일 소스 모두 제거
                calendar.getEventSources().forEach(function(source) {
                    source.remove();
                });
                
                // 새로운 일정 데이터 추가
                calendar.addEventSource(holidaySource); // 공휴일 소스 추가
                calendar.addEventSource(data); // 새로운 일정 데이터 추가
           },
           error: function(xhr, status, error) {
               console.error("일정 조회 실패:", error);
           }
       });
   });
	
	// 날짜 형식 지정 함수
	function formatDate(date) {
		const d1 = new Date(date);
		const offset = new Date().getTimezoneOffset() * 60000;
		const today =new Date(d1 - offset);
	
		return today.toISOString().slice(0, 16);
	}

</script>
	
</body>
</html>