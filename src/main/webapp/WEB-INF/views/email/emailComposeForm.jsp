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

<!-- Include the Quill library -->
<script src="https://cdn.jsdelivr.net/npm/quill@2.0.1/dist/quill.js"></script>
<link href="https://cdn.jsdelivr.net/npm/quill@2.0.1/dist/quill.snow.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<style>
 /* 로딩에니메이션 오버레이 */
 .loader-overlay{
 	display: none;
 	position: fixed;
 	top: 0;
 	left:0;
 	width: 100%;
 	height: 100%;
 	background: rgba(0, 0, 0, 0.5);
 	z-index:9998;
 }
 /* 로딩애니메이션 */
 .loader {
  display:none;
  position:fixed;
  z-index:9999;
  left: 50%;
  top: 50%;
  width: 120px;
  heigth: 120px;
  border: 16px solid #f3f3f3; /* 전체색상지정 */
  border-top: 16px solid #3498db; /* 로딩영역색상 */
  border-radius: 50%;
  width: 120px;
  height: 120px;
  transform: translate(-50%, -50%);
  animation: spin 2s linear infinite;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
	.a.nav-link.active{background-color:#FEBE98;}
  .attach_box{
     border: 2px dashed #ddd;
     padding: 8px 0;
     box-sizing: border-box;
     max-height: 200px;
     width: 100%;
     position: relative;
     overflow-y: auto;
 }
 .mail-box{
     margin-bottom: 5px;
 }
 .mail_write_autocomplete {
    position: relative;
    margin-bottom: 10px;
 }
 
</style>

</head>

<body>
	<!-- 로딩 에니메이션 -->
	<div class="loader-overlay">
		<div class="loader"></div>
	</div>
	
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
			
			<div class="content" style="background-color: #F2E8DA;">
			
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
	                                  <li class="breadcrumb-item active">메일작성</li>
	                              </ol>
	                          </div>
	                          <h4 class="page-title">메일작성</h4>
	                      </div>
	                  </div>
	              </div>
	              <!-- end page title -->
	
	              <!-- Right Sidebar -->
	              <div class="row">
	                  <div class="col-lg-12">
	                      <div class="card">
	                          <div class="card-body">
	                              <!-- Left sidebar -->
	                              <div class="inbox-leftbar">
	
	                                  <a href="${contextPath }/email/email.page" class="btn btn-danger w-100 waves-effect waves-light"
	                                     style="background-color: #FFBE98; border: 1px solid #FFBE98;">전체메일</a>
	
	                                  <div class="mail-list mt-4">
	                                      <a href="${contextPath }/email/email.page"><i class="dripicons-inbox me-2"></i>전체메일</a>
	                                      <a href="${contextPath }/email/outbox.bo"><i class="dripicons-exit me-2"></i>보낸메일</a>
	                                      <a href="${contextPath }/email/recyclebin.do"><i class="dripicons-trash me-2"></i>휴지통</a>
	                                  </div>
	
	                              </div>
	                              <!-- End Left sidebar -->
	
	                              <div class="inbox-rightbar">
	
	                                  <div class="btn-group">
	                                      <button type="button" class="btn btn-sm btn-light waves-effect"><i class="mdi mdi-delete-variant font-18"></i></button>
	                                  </div>
	                                  
	                                  
	                                  <div class="mt-4" >
	                                      <form id="mailSend-form" enctype="multipart/form-data">
	                                          <div class="mb-3 mail-box">
																						    <input type="hidden" id="emailFrom" name="emailFrom" value="followme180624@gmail.com">
																						    받는사람
																						    <div id="emailToContainer" class="form-control" style="border: 1px solid #ccc; padding: 5px; min-height: 30px;">
																						        <input type="text" id="emailTo" style="border: none; outline: none; width: 100%;" placeholder="이메일 주소를 입력하세요">
																						    </div>
																						    <div id="emailList" class="email-list" style="display:none; position:absolute; background:white; border:1px solid #ccc; z-index:1000; max-height: 200px; overflow-y: auto;"></div>
																						</div>
	                                          <div class="mb-3 mail-box">
	                                              제목<input type="text" class="form-control" id="subject" name="subject" placeholder="Subject">
	                                          </div>
	                                          <div class="mb-3 attach_box mail-box" id="upfile"  style="border: 2px dashed #ddd;" >
			                                      	<div>
	                                              <span>
	                                                  <input type="file" title="upfile" id="uploadFiles" name="uploadFiles" class="form-control-file border file " multiple>
	                                              </span>
			                                      	</div>
			                                      </div>
	                                          <div class="mb-3 card border-0">
	                                              <div id="snow-editor" style="min-height: 500px;" class="text">
	                                                  
	                                                  
	                                                  
	                                                  
	                                              </div> <!-- end Snow-editor-->
	                                          </div>
	  
	                                          <div>
	                                              <div class="text-end">
	                                                  <button type="reset" class="btn btn-success waves-effect waves-light" style="background-color:lightgray; border: none;"><i class="mdi mdi-delete"></i></button>
	                                                  <button class="btn btn-primary waves-effect waves-light" id="email-send-btn"
	                                                  				style="background-color: #FFBE98; border: 1px solid #FFBE98;">
	                                                  	<span>보내기</span> <i class="mdi mdi-send ms-2"></i> 
	                                                 	</button>
	                                              </div>
	                                          </div>
	  
	                                      </form>
	                                  </div> <!-- end card-->
	      
	                              </div> 
	                              <!-- end inbox-rightbar-->
	
	                              <div class="clearfix"></div>
	                          </div>
	                      </div>
	                  </div> <!-- end Col -->
	
	              </div><!-- End row -->
	              
	          </div> <!-- container -->
	
	      </div> <!-- content -->		
	      
	    
	      	
	<script>
    // Quill 에디터 초기화 함수
    function textEditorInit() {
        const quill = new Quill('#snow-editor', {
            theme: 'snow'
        });
    }

    // window.onload 이벤트에 textEditorInit 함수 등록
    window.onload = function() {
        textEditorInit();
    };
		

 // 메일 직원 목록 조회
    function validateEmail(email) {
        var re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    }

    $(document).ready(function(){
        var emailList = $("#emailList");
        var emailToContainer = $("#emailToContainer");

        var memList = [
            <c:forEach var="member" items="${memList}" varStatus="loop">
                {
                    memNo: '${member.memNo}',
                    deptName: '${member.deptName}',
                    memName: '${member.memName}',
                    memEmail: '${member.memEmail}',
                    memStatus: '${member.status}'
                }
                <c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ];

        // 받는사람 input 클릭시 직원 메일 목록 표시
        $("#emailToContainer").on('click', function() {
            emailList.show();
        });

        // 외부 클릭시 메일목록 숨김
        $(document).on('click', function(e) {
            if (!$(e.target).closest('#emailToContainer, #emailList').length) {
                emailList.hide();
            }
        });

        // 이메일 클릭시 입력 필드에 추가 및 X 버튼 생성
        $(document).on('click', '.email-item', function() {
            var email = $(this).text().split(' - ').pop();
            addEmailToContainer(email);
            emailList.hide();
        });

        // X 버튼 클릭하여 이메일 항목 제거
        $(document).on('click', '.remove-email-btn', function(e) {
            e.stopPropagation(); // 이벤트 전파 방지
            $(this).parent().remove();
        });

        // 이메일 항목 생성 및 추가 함수
        function addEmailToContainer(email) {
            var emailSpan = $('<span class="selected-email" style="margin-right: 5px; display: inline-block; border: 1px solid #ccc; padding: 2px 5px;">' + 
                              email + 
                              ' <button type="button" class="remove-email-btn" style="background: none; border: none; color: red; cursor: pointer;">X</button></span>');
            $('#emailToContainer').append(emailSpan);
        }

        // 초기 메일 목록 채우기
        memList.forEach(function(member) {
            if (member.memStatus == 'Y') {
                var emailItem = $('<div class="email-item" style="padding: 5px; cursor: pointer;">' +
                                  member.memName + ' [' + member.deptName + ' ] - ' + member.memEmail + '</div>');
                emailList.append(emailItem);
            }
        });

        // 엔터 키를 눌렀을 때 이메일을 추가하는 이벤트
        $('#emailTo').on('keydown', function(e) {
            if (e.which == 13) { // 엔터 키 코드
                e.preventDefault();
                var email = $(this).val().trim();
                if (email) {
                    if (validateEmail(email)) {
                        addEmailToContainer(email);
                        $(this).val(''); // 입력 필드 초기화
                    } else {
                        alert("유효하지 않은 이메일 주소입니다: " + email);
                    }
                }
            }
        });

        // 메일발송
        $("#email-send-btn").click(function(e){
            e.preventDefault();

            var emailFrom = $('#emailFrom').val();
            var emailTo = [];
            var invalidEmails = [];

            $("#emailToContainer .selected-email").each(function(){
                var email = $(this).text().replace(' X', '').trim();
                if (validateEmail(email)) {
                    emailTo.push(email);
                } else {
                    invalidEmails.push(email);
                }
            });

            if (invalidEmails.length > 0) {
                alert("다음 이메일 주소가 유효하지 않습니다: " + invalidEmails.join(", "));
                return;
            }

            if (emailTo.length === 0) {
                alert("유효한 받는사람 이메일 주소를 입력해주세요.");
                return;
            }

            var subject = $('#subject').val();
            var text = $('#snow-editor .ql-editor').html();
            var uploadFiles = $('#uploadFiles')[0].files;

            var formData = new FormData();
            formData.append('emailFrom', emailFrom);
            formData.append('emailTo', emailTo.join(',')); 
            formData.append('subject', subject);
            formData.append('text', text);
            for(var i = 0; i < uploadFiles.length; i++){
                formData.append('uploadFiles[]', uploadFiles[i]);
            }

            
            // 로딩 에니메이션 표시
            $(".loader-overlay").show();
            $(".loader").show();
            
            $.ajax({
                url: "${contextPath}/email/sendemail.do",
                type: "post",
                data: formData,
                processData: false,
                contentType: false,
                dataType: "json",
                success: function(response){
                		$(".loader-overlay").hide(); // 로딩에니메이션 숨기기
                		$(".loader").hide(); 
                		
                    if (response.redirect) { 
                        alert("메일이 전송 되었습니다.");
                        location.href = response.redirect;
                    }
                },
                error: function(xhr, status, error){
                	$(".loader-overlay").hide(); // 로딩에니메이션 숨기기
                	$(".loader").hide(); 
                	
                    console.log("Error:", error);
                    console.log("XHR:", xhr);
                    console.log("Status:", status);
                    alert("메일 전송 실패");
                }
            });
        });
    });

		
	</script>		








			</div>

      <!-- ============================================================== -->
      <!-- <-- End Page Content
      <!-- ============================================================== -->
      
	</div>
</div>
        
        <!-- Vendor js -->
        <script src="${ contextPath }/assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="${ contextPath }/assets/js/app.min.js"></script>
        
        <!-- Plugins js-->
        
        <script src="${ contextPath }/assets/libs/flatpickr/flatpickr.min.js"></script>
        <script src="${ contextPath }/assets/libs/selectize/js/standalone/selectize.min.js"></script>


<%--         <!-- Plugins js -->
        <script src="${ contextPath }/assets/libs/quill/quill.min.js"></script>
        <!-- Init js-->
        <script src="${ contextPath }/assets/js/pages/form-quilljs.init.js"></script> 
	 --%>
</body>
</html>