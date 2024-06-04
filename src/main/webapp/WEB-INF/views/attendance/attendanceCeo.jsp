<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">

<head>
<meta charset="utf-8" />
<title>직원 근태관리 | Follow me</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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
.active>.page-link, .page-link.active {
   --ct-pagination-active-bg: #febe98;}
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
    /* pointer-events: none; /* 클릭 이벤트 비활성화 */ */
}
.filter-row span {
    margin: 0 10px;
    font-size: 24px; /* 년도와 월 폰트 크기 조정 */
    font-weight: bold;
    color: black; /* 텍스트 색상 변경 */
}

/* 사원 테이블 스타일 */
#products-datatable {
    border-collapse: collapse;
    width: 100%;
}

#products-datatable th, #products-datatable td {
    border: 1px solid #dddddd;
    padding: 8px;
    text-align: center;
    background-color: #ffffff; /* 셀의 배경색을 흰색으로 설정 */
}

#products-datatable th {
    background-color: #f2f2f2;
    color: #333;
}

#products-datatable tr:hover {
    background-color: #f5f5f5; /* 호버 효과 배경색 변경 */
}

#products-datatable td.table-user {
    text-align: left;
}

#products-datatable img {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    vertical-align: middle;
    margin-right: 5px;
}

/* 상태 뱃지 스타일 */
#products-datatable .badge {
    padding: 6px 8px;
    border-radius: 3px;
    font-size: 14px;
}

#products-datatable .bg-success {
    background-color: #28a745;
    color: #fff;
}

#products-datatable .bg-danger {
    background-color: #dc3545;
    color: #fff;
}

#products-datatable .table-user {
    text-align: center;
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
      <!-- Start Page Content here -->
      <!-- ============================================================== -->

			<div class="content" style="background: #F2E8DA;">

                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
					                              		<li class="breadcrumb-item"><a href="javascript: void(0);">FOLLOW ME</a></li>
					                                  <li class="breadcrumb-item"><a href="javascript: void(0);">근태관리</a></li>
					                                  <li class="breadcrumb-item active">근태관리</li>
					                              </ol>
                                    </div>
                                    <h4 class="page-title">근태관리</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->
                        
                        <div class="row">
                            <div class="col-12">
                                <div class="filter-row">
													        <div class="col text-center" style="margin-bottom:20px;">
													          <button id="prevMonth" class="btn btn-secondary" onclick="prev();">&lt;</button>
											            		<span id="yearMonthDisplay">2024년 5월</span>
											              <button id="nextMonth" class="btn btn-secondary" onclick="next();">&gt;</button>
													        </div>
													    </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row mb-2">
                                        		
                                            
                                            <div class="col-sm-2">
                                            
	                                            <form class="search-bar">
													                            <div class="position-relative">
													                                <input type="text" class="form-control" id="keyword" name="keyword" data-pageNo="1">
													                                <span class="mdi mdi-magnify"></span>
													                            </div>
													                     </form>
                                                
                                            </div><!-- end col-->
                                        </div>
                
                                        <div class="table-responsive">
                                            <table class="table table-centered table-nowrap" id="products-datatable"  style="text-align : center;">
                                                <thead>
                                                    <tr>
                                                        <th>사원명</th>
                                                        <th>사원번호</th>
                                                        <th>부서</th>
                                                        <th>직급</th>
                                                        <th>출근</th>
                                                        <th>지각</th>
                                                        <th>조퇴</th>
                                                        <th>결근</th>
                                                        <th>월근무시간</th>
                                                        <th>상태</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                
                                                </tbody>
                                            </table>
                                        </div>
                                       
                                        <ul class="pagination pagination-rounded justify-content-end mb-0" id="pageBar">
                                        	<!-- 
                                            <li class="page-item ${ pi.currentPage == 1 ? 'disabled' : '' }">
                                                <a class="page-link" href="${ contextPath }/member/empManagement.page?page=${pi.currentPage-1}" aria-label="Previous">
                                                    <span aria-hidden="true">«</span>
                                                    <span class="visually-hidden">Previous</span>
                                                </a>
                                            </li>
                                            
                                           <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                            <li class="page-item ${ pi.currentPage == p ? 'active' : '' }"><a class="page-link" href="${ contextPath }/member/empManagement.page?page=${p}">${p}</a></li>
                                           </c:forEach>
                                           
                                            <li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' }">
                                                <a class="page-link" href="${ contextPath }/member/empManagement.page?page=${pi.currentPage+1}" aria-label="Next">
                                                    <span aria-hidden="true">»</span>
                                                    <span class="visually-hidden">Next</span>
                                                </a>
                                            </li>
                                           -->
                                        </ul>

                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col -->
                        </div>
                        <!-- end row -->
                        
                    </div> <!-- container -->

                </div> <!-- content -->
<script>
								   
								   $(document).ready(function() {
									   
										   	var keyword = $("#keyword").val();
										   	if (keyword === "") {
										        // 검색 키워드가 비어있는 경우에는 전체 리스트를 불러오도록 함
										        searchAllList();
										    } else {
										        var pageNo = 1;
										        searchList(pageNo);
										    }
										   	
										    // 검색과 관련된 이벤트 처리
										    $('#keyword').on('keyup', function(){
										        var pageNo = 1;
										        searchList(pageNo);
										    });
										    
										    $('#keyword').on('keydown', function(e){
										        if (e.keyCode === 13) {
										            e.preventDefault(); // 엔터키 눌렀을 때 기본 동작 막기
										        }
										    });
									        
									      $(document).on('click','#searchPage',function(){
										        var pageNo = $(this).text();
										        searchList(pageNo);
										    });

										    $(document).on('click','#searchPage2',function(){
										        var pageNo = $(this).data('page');
										        searchList(pageNo);
										    });
										    
										    /*
										    $(document).on('click','#searchPage3',function(){
										        var pageNo = $(this).text();
										        monthSearchList(pageNo,year,month);
										    });

										    $(document).on('click','#searchPage4',function(){
										        var pageNo = $(this).data('page');
										        monthSearchList(pageNo,year,month);
										    });
										    */
									});
								
								
									function searchAllList() {
									    $.ajax({
									        type: "get",
									        url: "${contextPath}/attendance/allList",
									        success: function(response) {
									            displayUserList(response);
									        },
									        error: function(xhr, status, error) {
									            console.error("Ajax 오류:", error);
									        }
									    });
									}
									
									function searchList(pageNo) {
									    var keyword = $("#keyword").val();

									    $.ajax({
									        type: "get",
									        url: "${contextPath}/attendance/searchList",
									        data: {
									            keyword: keyword,
									            pageNo: pageNo
									        },
									        timeout: 5000,
									        success: function(response) {
									            displayUserList(response);
									        },
									        error: function(xhr, status, error) {
									            console.error("Ajax 오류:", error);
									        }
									    });
									}
									
									function monthSearchList(pageNo) {
									    var keyword = $("#keyword").val();

									    $.ajax({
									        type: "get",
									        url: "${contextPath}/attendance/monthSearchList",
									        data: {
									            keyword: keyword,
									            pageNo: pageNo
									        },
									        timeout: 5000,
									        success: function(response) {
									            displayUserList(response);
									        },
									        error: function(xhr, status, error) {
									            console.error("Ajax 오류:", error);
									        }
									    });
									}

                function displayUserList(response) {
							    let value = "";
							    // 유저 정보
							    for (let i = 0; i < response.memberList.length; i++) {
						
							        value += "<tr>" +
							        		"<input type='hidden' class='deptNo' value='" + response.memberList[i].deptNo + "'>" +
							        		"<input type='hidden' class='statusValue' value='" + response.memberList[i].status + "'>" +
							            "<td class='table-user'><img src='${ contextPath }" + response.memberList[i].profileImgPath + "' class='me-2 rounded-circle'>" +
							            "<a href='javascript:void(0);' class='text-body fw-semibold'>" + response.memberList[i].memName + "</a></td>" +
							            "<td> " + response.memberList[i].memNo + "</td>" +
							            "<td> " + response.memberList[i].deptName + "</td>" +
							            "<td> " + response.memberList[i].memGrade + "</td>" +
							            "<td> " + response.memberList[i].countB + "회</td>" + // 출근
							            "<td> " + response.memberList[i].countE + "회</td>" + // 지각
							            "<td> " + response.memberList[i].countC + "회</td>" + // 조퇴
							            "<td> " + response.memberList[i].countD + "회</td>" + // 결근
							            "<td> " + response.memberList[i].monthWorkTime + "시간</td>" + // 월근무시간
							            "<td><span class='badge " + (response.memberList[i].status == 'Y' ? 'bg-success' : 'bg-danger') + "'>" + (response.memberList[i].status == 'Y' ? "재직" : "휴직") + "</span></td>" +
							            "</tr>";
							    }
					
							    
							    $('#products-datatable tbody').html(value);
					
							    var paginationHtml = "";
							    if (response.pi.currentPage == 1) {
							        paginationHtml += "<li class='page-item disabled'>" +
							            "<a class='page-link' href='#' aria-label='Previous'>" +
							            "<span aria-hidden='true'>«</span>" +
							            "<span class='visually-hidden'>Previous</span>" +
							            "</a>" +
							            "</li>";
							    } else {
							        paginationHtml += "<li class='page-item'>" +
							            "<a class='page-link' href='#' aria-label='Previous' id='searchPage2' data-page='" + (response.pi.currentPage - 1) + "'>" +
							            "<span aria-hidden='true'>«</span>" +
							            "<span class='visually-hidden'>Previous</span>" +
							            "</a>" +
							            "</li>";
							    }
					
							    for (var p = response.pi.startPage; p <= response.pi.endPage; p++) {
							        paginationHtml += "<li class='page-item " + (response.pi.currentPage == p ? 'active' : '') + "'><a class='page-link' href='#' id='searchPage'>" + p + "</a></li>";
							    }
					
							    if (response.pi.currentPage == response.pi.maxPage) {
							        paginationHtml += "<li class='page-item disabled'>" +
							            "<a class='page-link' href='#' aria-label='Next'>" +
							            "<span aria-hidden='true'>»</span>" +
							            "<span class='visually-hidden'>Next</span>" +
							            "</a>" +
							            "</li>";
							    } else {
							        paginationHtml += "<li class='page-item'>" +
							            "<a class='page-link' href='#' aria-label='Next' id='searchPage2' data-page='" + (response.pi.currentPage + 1) + "'>" +
							            "<span aria-hidden='true'>»</span>" +
							            "<span class='visually-hidden'>Next</span>" +
							            "</a>" +
							            "</li>";
							    }
					
							    $("#pageBar").html(paginationHtml);
							}
                
                function monthdisplayUserList(response) {
								    let value = "";
								    // 유저 정보
								    for (let i = 0; i < response.memberList.length; i++) {
							
								        value += "<tr>" +
								        		"<input type='hidden' class='deptNo' value='" + response.memberList[i].deptNo + "'>" +
								        		"<input type='hidden' class='statusValue' value='" + response.memberList[i].status + "'>" +
								            "<td class='table-user'><img src='${ contextPath }" + response.memberList[i].profileImgPath + "' class='me-2 rounded-circle'>" +
								            "<a href='javascript:void(0);' class='text-body fw-semibold'>" + response.memberList[i].memName + "</a></td>" +
								            "<td> " + response.memberList[i].memNo + "</td>" +
								            "<td> " + response.memberList[i].deptName + "</td>" +
								            "<td> " + response.memberList[i].memGrade + "</td>" +
								            "<td> " + response.memberList[i].countB + "회</td>" + // 출근
								            "<td> " + response.memberList[i].countE + "회</td>" + // 지각
								            "<td> " + response.memberList[i].countC + "회</td>" + // 조퇴
								            "<td> " + response.memberList[i].countD + "회</td>" + // 결근
								            "<td> " + response.memberList[i].monthWorkTime + "시간</td>" + // 월근무시간
								            "<td><span class='badge " + (response.memberList[i].status == 'Y' ? 'bg-success' : 'bg-danger') + "'>" + (response.memberList[i].status == 'Y' ? "재직" : "휴직") + "</span></td>" +
								            "</tr>";
								    }
						
								    
								    $('#products-datatable tbody').html(value);
						
								    var paginationHtml = "";
								    if (response.pi.currentPage == 1) {
								        paginationHtml += "<li class='page-item disabled'>" +
								            "<a class='page-link' href='#' aria-label='Previous'>" +
								            "<span aria-hidden='true'>«</span>" +
								            "<span class='visually-hidden'>Previous</span>" +
								            "</a>" +
								            "</li>";
								    } else {
								        paginationHtml += "<li class='page-item'>" +
								            "<a class='page-link' href='#' aria-label='Previous' id='searchPage3' data-page='" + (response.pi.currentPage - 1) + "'>" +
								            "<span aria-hidden='true'>«</span>" +
								            "<span class='visually-hidden'>Previous</span>" +
								            "</a>" +
								            "</li>";
								    }
						
								    for (var p = response.pi.startPage; p <= response.pi.endPage; p++) {
								        paginationHtml += "<li class='page-item " + (response.pi.currentPage == p ? 'active' : '') + "'><a class='page-link' onclick='loadMonthData(" + currentYear + "," + currentMonth + ", " + p +")'>" + p + "</a></li>";
								    }
						
								    if (response.pi.currentPage == response.pi.maxPage) {
								        paginationHtml += "<li class='page-item disabled'>" +
								            "<a class='page-link' href='#' aria-label='Next'>" +
								            "<span aria-hidden='true'>»</span>" +
								            "<span class='visually-hidden'>Next</span>" +
								            "</a>" +
								            "</li>";
								    } else {
								        paginationHtml += "<li class='page-item'>" +
								            "<a class='page-link' href='#' aria-label='Next' id='searchPage4' data-page='" + (response.pi.currentPage + 1) + "'>" +
								            "<span aria-hidden='true'>»</span>" +
								            "<span class='visually-hidden'>Next</span>" +
								            "</a>" +
								            "</li>";
								    }
						
								    $("#pageBar").html(paginationHtml);
								}
 </script>    
 
 <script>
												  
				    var currentYear;
				    var currentMonth;
				    
				    function loadMonthData(year, month, page) {
		            $.ajax({
		                url: "${contextPath}/attendance/monthList",
		                method: 'GET',
		                data: {
		                    year: year,
		                    month: month,
		                    pageNo:page
		                },
		                success: function(response) {
		                		
		                		console.log('성공');
		                		monthdisplayUserList(response);

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
                
                
                

            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->

        <!-- Modal -->
        <div class="modal fade" id="employee-insert-modal" tabindex="-1" role="dialog" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered">
			        <div class="modal-content">
			            <div class="modal-header bg-light">
			                <h4 class="modal-title" id="myCenterModalLabel">신규 직원정보 등록</h4>
			                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
			            </div>
			            <div class="modal-body p-4">
			                <form action="${ contextPath }/member/insertNewEmp" method="post">
			                    <div class="row">
			                        <div class="col-md-6">
			                            <div class="mb-3">
			                                <label for="memName" class="form-label">이름</label>
			                                <input type="text" class="form-control" id="memName" name="memName" required>
			                            </div>
			                        </div>
			                        <div class="col-md-6">
			                            <div class="mb-3">
			                                <label for="deptSelect" class="form-label">성별</label>
			                                <select class="form-select" id="genderSelect" name="gender" aria-label="Default select example">
			                                    <option value="F">F</option>
			                                    <option value="M">M</option>
			                                </select>
			                            </div>
			                        </div>
			                        <div class="col-md-6">
			                            <div class="mb-3">
			                                <label for="memNo" class="form-label">사원번호(그룹웨어 아이디)</label>
			                                <input type="text" class="form-control" id="memNo" name="memNo" required>
			                            </div>
			                        </div>
			                        <div class="col-md-6">
			                            <div class="mb-3">
			                                <label for="memPwd" class="form-label">(임시)그룹웨어 비밀번호</label>
			                                <input type="password" class="form-control" id="memPwd" name="memPwd" required>
			                            </div>
			                        </div>
			                        <div class="col-md-6">
			                            <div class="mb-3">
			                                <label for="deptSelect" class="form-label">부서명</label>
			                                <select class="form-select" id="deptSelect" name="deptNo" aria-label="Default select example">
			                                    <option value="1">영업팀</option>
			                                    <option value="2">마케팅팀</option>
			                                    <option value="3">경영지원팀</option>
			                                    <option value="4">물류팀</option>
			                                    <option value="5">대기발령</option>
			                                </select>
			                            </div>
			                        </div>
			                        <div class="col-md-6">
			                            <div class="mb-3">
			                                <label for="memGrade" class="form-label">직급</label>
			                                <input type="text" class="form-control" id="memGrade" name="memGrade" required>
			                            </div>
			                        </div>
			                        <div class="col-md-6">
			                            <div class="mb-3">
			                                <label for="phone" class="form-label">핸드폰번호</label>
			                                <input type="text" class="form-control" id="phone" name="phone" required>
			                            </div>
			                        </div>
			                        <div class="col-md-6">
			                            <div class="mb-3">
			                                <label for="memEmail" class="form-label">이메일</label>
			                                <input type="text" class="form-control" id="memEmail" name="memEmail" required>
			                            </div>
			                        </div>
			                        <div class="col-md-6">
			                            <div class="mb-3">
			                                <label for="address" class="form-label">주소</label>
			                                <input type="text" class="form-control" id="address" name="address" required>
			                            </div>
			                        </div>
			                        <div class="col-md-6">
			                            <div class="mb-3">
			                                <label for=extensionNumber class="form-label">내선번호</label>
			                                <input type="text" class="form-control" id="extensionNumber" name="extensionNumber" required>
			                            </div>
			                        </div>
			                        <div class="col-md-6">
			                            <div class="mb-3">
			                                <label for="memSalary" class="form-label">계약연봉</label>
			                                <input type="text" class="form-control" id="memSalary" name="memSalary" required>
			                            </div>
			                        </div>
			                        <div class="col-md-6">
			                            <div class="mb-3">
			                                <label for="enrollDate" class="form-label">입사일</label>
			                                <input type="date" class="form-control" id="enrollDate" name="enrollDate" required>
			                            </div>
			                        </div>
			                        <div class="col-md-6">
			                            <div class="mb-3">
			                                <label for="authLevelSelect" class="form-label">권한레벨</label>
			                                <select class="form-select" id="authLevelSelect" name="authLevel" aria-label="Default select example">
			                                    <option value="0">0</option>
			                                    <option value="1">1</option>
			                                    <option value="2">2</option>
			                                    <option value="3">3</option>
			                                </select>
			                            </div>
			                        </div>
			                       </div>
			                    <div class="text-end">
			                        <button type="submit" class="btn btn-success waves-effect waves-light" style="background-color: #febe98; border: #febe98;">추가</button>
			                        <button type="button" class="btn btn-danger waves-effect waves-light" data-bs-dismiss="modal" style="border: none;">취소</button>
			                    </div>
			                </form>
			            </div>
			        </div><!-- /.modal-content -->
			    </div><!-- /.modal-dialog -->
			</div><!-- /.modal -->


        <!-- Modal -->
       
        <div class="modal fade" id="employee-modify-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-light">
                        <h4 class="modal-title" id="myCenterModalLabel">직원정보 수정</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                    </div>
                    <div class="modal-body p-4">
                        <form action="${ contextPath }/member/modifyEmpInfo" method="post">
                        		<input type="hidden" name="memNo">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex align-items-start mb-3">
                                            <img class="d-flex me-3 rounded-circle avatar-lg" id="profileImg" src="" alt="image">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="mb-2">
                                                        <label for="memName" class="form-label">이름</label>
                                                        <input type="text" class="form-control" id="memName" name="memName">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-2">
                                                      <div class="authLevelSelect">
                                                     		<label for="authLevelSelect" class="form-label">권한레벨</label>
																		                    	<select class="form-select" id="authLevelSelect" name="authLevel" aria-label="Default select example">
																													    <option value="0" <c:if test="${authLevelSelect eq '0'}">selected</c:if>>0</option>
																													    <option value="1" <c:if test="${authLevelSelect eq '1'}">selected</c:if>>1</option>
																													    <option value="2" <c:if test="${authLevelSelect eq '2'}">selected</c:if>>2</option>
																													    <option value="3" <c:if test="${authLevelSelect eq '3'}">selected</c:if>>3</option>
																													</select>

																		                	</div> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
    
                                        <h5 class="mb-3 mt-4 text-uppercase bg-light p-2"><i class="mdi mdi-account-circle me-1"></i> 인사정보</h5>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="mb-2">
                                                    <div class="deptSelect">
																										    <label for="deptSelect" class="form-label">부서명</label>
																										    <select class="form-select" id="deptSelect" name="deptNo" aria-label="Default select example">
																										        <option value="1" <c:if test="${deptSelect eq '1'}">selected</c:if>>영업팀</option>
																										        <option value="2" <c:if test="${deptSelect eq '2'}">selected</c:if>>마케팅팀</option>
																										        <option value="3" <c:if test="${deptSelect eq '3'}">selected</c:if>>경영지원팀</option>
																										        <option value="4" <c:if test="${deptSelect eq '4'}">selected</c:if>>물류팀</option>
																										        <option value="5" <c:if test="${deptSelect eq '5'}">selected</c:if>>대기발령</option>
																										    </select>
																										</div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-2">
                                                    <label for="memGrade" class="form-label">직급</label>
                                                    <input type="text" class="form-control" id="memGrade" name="memGrade" value="">
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <div class="row">
                                        		<div class="col-md-6">
                                                <div class="mb-2">
                                                    <label for="memSalary" class="form-label">계약연봉</label>
                                                    <input type="text" class="form-control" id="memSalary" name="memSalary" value="">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-2">
                                                    <label for="enrollDate" class="form-label">입사일</label>
                                                    <input type="date" class="form-control" id="enrollDate" name="enrollDate" value="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                        		<div class="col-md-6">
                                                <div class="mb-2">
                                                    <label for="memRole" class="form-label">직무</label>
                                                    <input type="text" class="form-control" id="memRole" name="memRole" value="">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-2">
                                                     <label for="status" class="form-label">상태</label>
							                                        <select class="form-select" id="statusSelect" name="status">
							                                            <option value="Y" <c:if test="${statusSelect eq 'Y'}">selected</c:if>>재직</option>
							                                            <option value="R" <c:if test="${statusSelect eq 'R'}">selected</c:if>>휴직</option>
							                                        </select>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div> <!-- end card-->
                            
        
                            <div class="text-end">
                                <button type="submit" class="btn btn-success waves-effect waves-light" style="background-color: #febe98; border: #febe98;">수정</button>
                                <button type="button" class="btn btn-danger waves-effect waves-light" data-bs-dismiss="modal" style="border: none;">취소</button>
                            </div>
                           
                        </form>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
       

			
        <div class="modal fade" id="employee-delete-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-light">
                        <h4 class="modal-title" id="myCenterModalLabel">직원정보 삭제</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                    </div>
                    <div class="modal-body p-4">
                    	<form action="${ contextPath }/member/deleteEmpInfo" method="post">
                    		<input type="hidden" name="memNo">
                        <p id="employee-info"></p>

                        <div class="text-end">
                            <button type="submit" class="btn btn-success waves-effect waves-light" style="background-color: #febe98; border: #febe98;">삭제</button>
                            <button type="button" class="btn btn-danger waves-effect waves-light" data-bs-dismiss="modal" style="border: none;">취소</button>
                        </div>
                      </form>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
      



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
                                <input type="text" class="form-control">
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
                                        <img src="${contextPath }/assets/images/users/user-10.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${contextPath }/assets/images/users/user-1.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${contextPath }/assets/images/users/user-9.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${contextPath }/assets/images/users/user-2.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${contextPath }/assets/images/users/user-4.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${contextPath }/assets/images/users/user-5.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${contextPath }/assets/images/users/user-6.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${contextPath }/assets/images/users/user-7.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${contextPath }/assets/images/users/user-8.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
        
	</body>
	
</html>