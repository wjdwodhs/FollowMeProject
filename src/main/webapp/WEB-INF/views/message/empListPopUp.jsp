<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark" style="background: #F2E8DA;">

<head>
<meta charset="utf-8" />
<title>인사관리 | Follow me</title>
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

</style>

</head>

<body>

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
		});

		function displayUserList(response) {
		    let value = "";
		    // 유저 정보
		    for (let i = 0; i < response.memberList.length; i++) {
		        // enrollDate를 타임스탬프에서 Date 객체로 변환
		        var date = new Date(response.memberList[i].enrollDate);

		        // 날짜를 "yyyy-mm-dd" 형식으로 포맷팅
		        var formattedDate = date.getFullYear() + '-' + ('0' + (date.getMonth() + 1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2);

		        value += "<tr>" +
		        		"<input type='hidden' class='deptNo' value='" + response.memberList[i].deptNo + "'>" +
		        		"<input type='hidden' class='statusValue' value='" + response.memberList[i].status + "'>" +
		        		"<input type='hidden' class='memNo' value='" + response.memberList[i].memNo + "'>" +
		            "<td class='table-user'><img src='${ contextPath }" + response.memberList[i].profileImgPath + "' class='me-2 rounded-circle'>" +
		            "<a href='javascript:void(0);' class='text-body fw-semibold'>" + response.memberList[i].memName + "</a></td>" +
		            "<td> " + response.memberList[i].deptName + "</td>" +
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

		function searchAllList() {
		    $.ajax({
		        type: "get",
		        url: "${contextPath}/member/allList",
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
		        url: "${contextPath}/member/searchList",
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
	   
		$(document).ready(function() {
		    // URL 파라미터에서 currentMemNo 값을 가져오기
		    const urlParams = new URLSearchParams(window.location.search);
		    const currentMemNo = urlParams.get('currentMemNo');
		    const currentChatMembers = urlParams.get('currentChatMembers');

		    // 검색과 관련된 이벤트 처리
		    $('#keyword').on('keyup', function() {
		        var pageNo = 1;
		        searchList(pageNo);
		    });

		    $(document).on('click', '#searchPage', function() {
		        var pageNo = $(this).text();
		        searchList(pageNo);
		    });

		    $(document).on('click', '#searchPage2', function() {
		        var pageNo = $(this).data('page');
		        searchList(pageNo);
		    });

		    // 직원 이름 클릭 시 정보 받아오기 -> 부모창으로 전달
		    $(document).on('click', '.text-body', function() {
		        var row = $(this).closest('tr');
		        
		        var profileImgPath = row.find('td:eq(0) img').attr('src');
		        var memName = row.find('td:eq(0) a').text().trim();
		        var deptName = row.find('td:eq(1)').text().trim();
		        
		        // 부서번호를 추출
		        var deptNo = row.find('.deptNo').val();
		        
		        // 재직, 휴직에 해당하는 value 값을 추출
		        var status = row.find('.statusValue').val();
		        
		        // 선택한 memNo 값을 추출
		        var memNo = row.find('.memNo').val();
		        
		        console.log(memNo);
		        console.log(memName);
		        console.log(deptName);
		        console.log(deptNo);
		        console.log(status);
		        console.log(profileImgPath);
		        
		    		 // 현재 로그인한 멤버인 경우
		        if (memNo === currentMemNo) {
		            alert('현재 로그인한 멤버는 선택할 수 없습니다.');
		            return false; 
		        }

		        // 기존 대화방이 있는 멤버인 경우
		        if (currentChatMembers.includes(memName)) {
		            alert('이 직원은 기존에 존재하는 쪽지함이 있습니다.');
		            return false; 
		        }
		        
		        if(status == 'R') {
		        	  alert('이 직원은 현재 휴직 상태입니다.');
		        	  return false;
		        }

		     		// 부모창 (원래의 쪽지함 페이지)으로 직원 번호 전달하기
		        opener.receiveEmpInfo(memNo, memName, deptName, deptNo, status, profileImgPath);
		        
		        // 자식창 닫기
		        window.close();
		    });
		    
		});
	   
	   
		</script>


	<!-- Begin page -->
	<div id="wrapper">

  	
            
  	<div class="content-page">


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
                                    <h4 class="page-title">직원 목록</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->


                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row mb-2">
                                        	<form class="search-bar">
									                            <div class="position-relative">
									                                <input type="text" class="form-control" id="keyword" name="keyword" data-pageNo="1">
									                                <span class="mdi mdi-magnify"></span>
									                            </div>
									                        </form>
                                          </div><!-- end col-->
                                        </div>
                
                                        <div class="table-responsive">
                                            <table class="table table-centered table-nowrap table-striped" id="products-datatable"  style="text-align : center;">
                                                <thead>
                                                    <tr>
                                                        <th>사원명</th>
                                                        <th>부서</th>
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

                

            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->

        
        
        <!-- Vendor js -->
        <script src="${ contextPath }/assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="${ contextPath }/assets/js/app.min.js"></script>
        
	</body>
	
</html>