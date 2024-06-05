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
                              <a href="${contextPath }/email/email.page"><i class="dripicons-inbox me-2"></i>전체메일</a>
                              <a href="${contextPath }/email/outbox.bo"><i class="dripicons-exit me-2"></i>보낸메일</a>
                              <a href="${contextPath }/email/recyclebin.do" class="fw-bold"><i class="dripicons-trash me-2"></i>휴지통<span class="badge bg-warning float-end ms-2">${pi.listCount}</span></a>
                          </div>

                      </div>
                      <!-- End Left sidebar -->

                      <div class="inbox-rightbar">

													<!-- 복구버튼 -->
                          <div class="btn-group">
                              <button type="button" id="backUp-btn" class="btn btn-light waves-effect">복구하기</button>
                          </div>
                          <div class="btn-group">
                          		<button type="button" class="btn btn-danger waves-effect" id="empty-btn"
                          		        data-bs-toggle="modal" >비우기</button>
													</div>
													
                          <div class="mt-3">
                              <ul class="message-list">
                              	<c:choose>
                              		<c:when test="${ empty recycleList }">
                              		 <li class="emptyMessage-list">조회된 메일이 없습니다.</li>
                              		</c:when>
                              		<c:otherwise>
	                                  <c:forEach var="mail" items="${ recycleList }">   
	                                   <li class="hasMessage-list">
	                                      <div class="col-mail col-mail-1" >
	                                          <div class="checkbox-wrapper-mail">
	                                              <input type="checkbox" id="mailCheck_${mail.emailNo}">
	                                              <label for="mailCheck_${mail.emailNo}" class="toggle"></label>
	                                              <input type="hidden" name="emailNo" value="${ mail.emailNo }">
	                                              <input type="hidden" id="forder" value="${mail.emailTo eq 'followme180624@gmail.com' ? 'INBOX' : 'OUTBOX'}">
	                                          </div>
	                                          <!-- [보낸메일] or [받은메일] 메일주소 앞에 표시하기 -->
	                                          <div class="title" style="width:300px; left:50px;">
	                                          	<c:choose>
	                                          		<c:when test="${mail.emailTo eq 'followme180624@gmail.com'}">
	                                          			<c:out value="[받은메일] ${mail.emailFrom}" escapeXml="false" />
	                                          		</c:when>
	                                          		<c:otherwise>
	                                          			[보낸메일] ${ mail.emailTo }
	                                          		</c:otherwise>
	                                          	</c:choose>
	                                          </div>
	                                      </div>
	                                      <div class="col-mail col-mail-2">
									                            <div class="subject" style="left:20px;"><c:out value="${mail.subject}" /></div>
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
			
		<!-- 메일비우기 모달 -->
		<div id="resycleBinList-delMobal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="standard-modalLabel">메일전체삭제</h4>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <p>삭제버튼을 누르시면 메일이 <b>전부</b> 삭제됩니다.</p>
	                <p>휴지통을 비우시겠습니까?</p></div>
	            <div class="modal-footer">
	                <button type="button" class="btn w-sm btn-light waves-effect" data-bs-dismiss="modal">취소</button>
	                <button type="button" id="allDelete-btn" class="btn btn-primary" 
	                        style="background-color: #FFBE98; border: none;">삭제</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	  </div>
	<!-- 선택예약 삭제 모달 -->	
			
			
			
			
			
			
			
			
	<script>
	
	// 선택한 메일 복구하기
	$(document).ready(function(){
		$("#backUp-btn").on("click", function(){
			var checkMails = [];
			
			$(".checkbox-wrapper-mail input[type='checkbox']:checked").each(function(){
				var emailNo = $(this).closest("li").find("input[name='emailNo']").val();				
				var forder = $(this).closest("li").find("#forder").val();
				checkMails.push({emailNo:emailNo, forder:forder});
			})
			console.log(checkMails);
			
			if(checkMails.length == 0){
				alert("복구할 메일을 선택해주세요.");
				return ;
			}
			
			
			$.ajax({
				url:"${contextPath}/email/backup.do",
				type:"post",
				contentType:"application/json",
				data: JSON.stringify(checkMails),
				success:function(result){
					if(result > 0){
						alert("선택하신 메일이 복구되었습니다.");
						location.reload();
					}else{
						console.log("복구실패");
					}
				},
				error:function(){
					console.log("메일복구 ajax 실패");
				}
			})
			
		})

	
	
		// 휴지통 비우기
		
		$("#empty-btn").on("click", function(){
			if($(".emptyMessage-list").length > 0){
				alert("삭제할 메일이 없습니다.");
			}else{
				$("#resycleBinList-delMobal").modal('show');
			}
		})
		
		$("#allDelete-btn").on("click", function(){
			$.ajax({
				url:"${contextPath}/email/empty.do",
				type:"post",
				success:function(result){
					console.log(result);
					if(result>0){
						alert("휴지통에 있는 메일을 전부 비웠습니다.");
						location.reload();
					}
				},
				error:function(){
					console.log("휴지통비우기 ajax실패");
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