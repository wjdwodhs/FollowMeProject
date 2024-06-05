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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	.a.nav-link.active{background-color:#FEBE98;}
  .active>.page-link, .page-link.active {
   --ct-pagination-active-bg: #febe98;

 	.btn-group>button{
    background-color: #FFBE98;
     border: 1px solid #FFBE98; /* 테두리 */
     --ct-btn-active-bg:#FA9A85;    
     --ct-btn-active-border-color:#FA9A85;
     --ct-btn-hover-bg:#FA9A85;
     --ct-btn-hover-border-color:#FA9A85;   
  } 
 .message-list li .col-mail-2 .date {
    right: 0;
    width: 130px;
    padding-left: 10px;
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
			
      <!-- content start-------------------------------------------------------------------------------------- -->

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
                              <li class="breadcrumb-item active">보낸메일함</li>
                          </ol>
                      </div>
                      <h4 class="page-title">Email</h4>
                  </div>
              </div>
          </div>
          <!-- end page title -->


          <div class="row">

              <!-- Right Sidebar -->
              <div class="col-12">
                  <div class="card">
                      <div class="card-body">
                          <!-- Left sidebar -->
                      <div class="inbox-leftbar">

                          <a href="${ contextPath }/email/composeForm.do" class="btn btn-danger w-100 waves-effect waves-light"
                             style="background-color: #FFBE98; border: 1px solid #FFBE98;">메일작성</a>

                          <div class="mail-list mt-4">
                              <a href="${contextPath }/email/email.page"><i class="dripicons-inbox me-2"></i>전체메일<span class="badge badge-soft-danger float-end ms-2">7</span></a>
                              <a href="javascript: void(0);"><i class="dripicons-star me-2"></i>중요</a>
                              <a href="${contextPath }/email/outbox.bo" class="text-danger fw-bold"><i class="dripicons-exit me-2"></i>보낸메일</a>
                              <a href="javascript: void(0);"><i class="dripicons-document me-2"></i>임시보관함<span class="badge badge-soft-info float-end ms-2">32</span></a>
                              <a href="javascript: void(0);"><i class="dripicons-trash me-2"></i>휴지통</a>
                          </div>

                      </div>
                      <!-- End Left sidebar -->

                      <div class="inbox-rightbar">

													<!-- 삭제버튼 -->
                          <div class="btn-group">
                              <button type="button" id="trash-btn" class="btn btn-sm btn-light waves-effect"><i class="mdi mdi-delete-variant font-18"></i></button>
                          </div>
                          
                          <!-- 이동버튼  -->
                          <div class="btn-group">
                              <button type="button" class="btn btn-sm btn-light dropdown-toggle waves-effect" data-bs-toggle="dropdown" aria-expanded="false">
                                  <i class="mdi mdi-folder font-18"></i>
                                  <i class="mdi mdi-chevron-down"></i>
                              </button>
                              <div class="dropdown-menu">
                                  <span class="dropdown-header">이동</span>
                                  <a class="dropdown-item" href="javascript: void(0);">임시보관함</a>
                              </div>
                          </div>

                          <div class="mt-3">
                              <ul class="message-list">
                              	<c:choose>
                              		<c:when test="${ empty outList }">
                              		 <li>조회된 메일이 없습니다.</li>
                              		</c:when>
                              		<c:otherwise>
	                                  <c:forEach var="mail" items="${ outList }">   
	                                   <li onclick="location.href='${contextPath}/email/readsendmail.do?no=${mail.emailNo}';">
	                                      <div class="col-mail col-mail-1" onclick="location.href='${contextPath}/email/readsendmail.do?no=${mail.emailNo}';">
	                                          <div class="checkbox-wrapper-mail">
	                                              <input type="checkbox" id="mailCheck_${mail.emailNo}">
	                                              <label for="mailCheck_${mail.emailNo}" class="toggle"></label>
	                                              <input type="hidden" id="emailNo" value="${ mail.emailNo }">
	                                          </div>
	                                          <div class="title">${ mail.emailTo }</div>
	                                      </div>
	                                      <div class="col-mail col-mail-2" onclick="location.href='${contextPath}/email/readsendmail.do?no=${mail.emailNo}';">
									                            <div class="subject"><c:out value="${mail.subject}" /></div>
									                            <div class="date" style="width: 130px;">${mail.registDate}</div>
	                                      </div>
	                                  	</li>
                              			</c:forEach>
                              		</c:otherwise>
                              	</c:choose>
                              </ul>
                          </div>
                          <!-- end .mt-4 -->
                          <br><br>

													                          
                          <!-- 페이징 -->
                          <ul class="pagination pagination-rounded justify-content-end mb-0">
												    <li class="page-item ${pi.currentPage == 1 ? 'disabled' : ''}">
												        <a class="page-link" href="${contextPath}/email/outbox.bo?page=${pi.currentPage - 1}" aria-label="Previous">
												            <span aria-hidden="true">«</span>
												            <span class="visually-hidden">Previous</span>
												        </a>
												    </li>
												    
                            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                            	<li class="page-item ${ pi.currentPage == p ? 'active' : '' }"><a class="page-link" href="${ contextPath }/email/outbox.bo?page=${p}">${ p }</a></li>
                            </c:forEach>
												    
												    <li class="page-item ${pi.currentPage == pi.maxPage ? 'disabled' : ''}">
												        <a class="page-link" href="${contextPath}/email/outbox.bo?page=${pi.currentPage + 1}" aria-label="Next">
												            <span aria-hidden="true">»</span>
												            <span class="visually-hidden">Next</span>
												        </a>
												    </li>
													</ul>
                          <!-- 페이징 끝 -->
                          
                          
                          <!-- end row-->
                      </div> 
                      <!-- end inbox-rightbar-->

                      <div class="clearfix"></div>
                      </div>
                  </div> <!-- end card -->

              </div> <!-- end Col -->
          </div><!-- End row -->
          
      </div> <!-- container -->

      </div> <!-- content -->
	

			</div>
			
			
			
	<script>
	
	// 선택한 메일 휴지통으로 이동
	$(document).ready(function(){
		$("#trash-btn").on("click", function(){
			
				var checkMails = [];
				
				$(".checkbox-wrapper-mail input[type='checkbox']:checked").each(function(){
					var emailNo = $(this).closest("li").find("input[type='hidden']").val();
					checkMails.push(emailNo);
				});
				
					console.log("checkMails :", checkMails);
				
				var checkMailStr = checkMails.join(",");
				
			$.ajax({
				url:"${contextPath}/email/updatetrash.do",
				type:"post",
				data:{checkMailStr:checkMailStr},
				success:function(result){
					if(result > 0){				
						console.log("휴지통으로 이동 성공");
						location.reload();
					}else{
						console.log("이동실패");
					}
				},
				error:function(){
					console.log("휴지통으로 이동 ajax통신 실패");
				}
			})	
			
				
		})
	})

	
	
	
	</script>			
			
			
			
			
			

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