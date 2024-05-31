<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">

<head>
<meta charset="utf-8" />
<title>와글와글 | Follow me</title>
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
	.a.nav-link.active{backgroun-color:#FEBE98;}
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

			<div class="content" style="background-color: #F2E8DA; display: flex;">

		      <!-- Start Content-->
		      <div class="container-fluid" style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
		          
		          <!-- start page title -->
		          <div class="row">
		              <div class="col-12">
		                  <div class="page-title-box">
		                      <h4 class="page-title">Follow Me 와글와글</h4>
		                  </div>
		              </div>
		          </div>
		          <!-- end page title -->
		
		          <div class="row">
		              <div class="col-xl-6 col-lg-12 order-lg-2 order-xl-1" id="feedArea">
		                  <!-- new post -->
		                  <div class="card" style="width: 1040px;">
		                      <div class="card-body p-0">
		                          <ul class="nav nav-tabs nav-bordered">
		                              <li class="nav-item">
		                                  <a href="#newpost" data-bs-toggle="tab" aria-expanded="false" class="nav-link active px-3 py-2">
		                                      <i class="mdi mdi-pencil-box-multiple font-18 d-md-none d-block"></i>
		                                      <span class="d-none d-md-block">피드 수정하기</span>
		                                  </a>
		                              </li>
		                              
		                             
		                          </ul> <!-- end nav-->
		                          <div class="tab-content pt-0">
		                              <div class="tab-pane show active p-3" id="newpost">
		                                  <!-- comment box -->
		                                  <div class="border rounded">
		                                      <form action="${contextPath}/feed/modify.do" id="updateForm" method="post" class="comment-area-box" enctype="multipart/form-data">
		                                      		<input type="hidden" name="memNo" id="memNo" value="${loginUser.memNo}">		                                      	
		                                      		<input type="hidden" name="sfNo" id="sfNo" value="${socialFeed.sfNo}">		                                      	
		                                          <textarea rows="6" class="form-control border-0" style="resize:none;" placeholder="내용을 입력하세요" required name="sfContent">${socialFeed.sfContent}</textarea>
		                                          <div class="p-2 bg-light d-flex justify-content-between align-items-center">
		                                              <div style="display:flex;">
		                                              		<input type="file" id="upfile" name="uploadFiles" style="display:none;" multiple>
		                                                  <a href="#" class="btn btn-sm px-2 font-16 btn-light" onclick="$('#upfile').click();"><i class="mdi mdi-image-outline"></i></a>
				                                              <div id="imagePreview" style="margin-left:20px;">
				                                              	<c:forEach var="at" items="${socialFeed.attachList}">
				                                              		<span class="origin_del" data-fileno="${ at.fileNo }">
				                                              			<img src="${contextPath}${at.filePath}/${at.systemName}" style="max-width: 65px; max-height: 65px; margin-right: 5px; cursor: pointer;" onclick="removeImage(this, '${at.filePath}/${at.systemName}')">
				                                              		</span>
				                                              	</c:forEach>
				                                              </div>
		                                              </div>
		                                              <button type="submit" class="btn btn-sm" style="background-color:#febe98; color:white;"><i class='mdi mdi-send-outline me-1'></i>등록하기</button>
		                                          </div>
		                                      </form>
		                                  </div> <!-- end .border-->
		                                  <!-- end comment box -->
		                              </div> <!-- end preview-->
		                          </div> <!-- end tab-content-->
		                          
		                      </div>
		                  </div>
		                  <button type="button" id="back" class="btn btn-sm" style="background-color:lightgray; color:black;" onclick="javascript:history.go(-1);">이전 페이지로 이동</button>
		                  <!-- end new post -->
				   
				   				
				   				
				  <script>
				    $(document).ready(function() {
				        $('#upfile').on('change', function() {
				            var files = $(this)[0].files;
				            var imagePreview = $('#imagePreview');
				            
				            imagePreview.find('.origin_del').each(function() {
				                let inputEl = document.createElement("input");
				                inputEl.type = "hidden";
				                inputEl.name = "delFileNo";
				                inputEl.value = $(this).data("fileno");
				                document.getElementById("updateForm").append(inputEl);
				                $(this).remove();
				            });
				            
				            // 파일이 선택되었을 때
				            if (files.length > 0) {
				                for (var i = 0; i < files.length; i++) {
				                    var reader = new FileReader();
				                    reader.onload = function(e) {
				                        // 이미지 태그 생성하여 이미지 미리보기 추가
				                        var img = $('<img>');
				                        img.attr('src', e.target.result);
				                        img.attr('style', 'max-width: 65px; max-height: 65px; margin-right: 5px; cursor: pointer;');
				                        
				                        img.on('click', function() {
				                            $(this).remove();
				                        });
				                        imagePreview.append(img);
				                    }
				                    reader.readAsDataURL(files[i]);
				                }
				            }
				        });
				    });
				    
				    function removeImage(imgElement, filePath) {
				        // 기존 이미지를 삭제할 때 수행할 추가 작업이 있다면 이곳에 추가합니다.
				        // 예를 들어, 삭제된 이미지를 서버에 알려주는 로직을 추가할 수 있습니다.
				        $(imgElement).remove();
				    }
				    
                	$(document).ready(function(){
                		$(".origin_del").on("click", function(){
                			// 삭제하고자 하는 해당 첨부파일 번호를 form submit시 넘기기 위한 작업
                			// => 해당 form요소내에 input type="hidden" 만들어서 append
                			let inputEl = document.createElement("input");
                			inputEl.type = "hidden";
                			inputEl.name = "delFileNo";
                			inputEl.value = $(this).data("fileno");
                			
                			document.getElementById("updateForm").append(inputEl);
                			

                		})
                	})

				    
				    </script>
												
						<script>
						    document.getElementById("back").addEventListener("click", function() {
						        window.location.href = '${contextPath}/feed';
						    });
						</script>

		                  
		      </div>
		
		              
		    </div> <!--end row -->
		          
		  </div> <!-- container -->
		
		</div> <!-- content -->
		
		   
	</div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


</div>

        
        <!-- Vendor js -->
        <script src="${ contextPath }/assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="${ contextPath }/assets/js/app.min.js"></script>

    </body>
</html>