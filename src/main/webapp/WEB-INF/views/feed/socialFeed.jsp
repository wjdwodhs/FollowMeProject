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
		                                      <span class="d-none d-md-block">피드 작성하기</span>
		                                  </a>
		                              </li>
		                              
		                             
		                          </ul> <!-- end nav-->
		                          <div class="tab-content pt-0">
		                              <div class="tab-pane show active p-3" id="newpost">
		                                  <!-- comment box -->
		                                  <div class="border rounded">
		                                      <form action="${contextPath}/feed/insert" method="post" class="comment-area-box" enctype="multipart/form-data">
		                                      		<input type="hidden" name="memNo" id="memNo" value="${loginUser.memNo}">		                                      	
		                                          <textarea rows="6" class="form-control border-0" style="resize:none;" placeholder="내용을 입력하세요" required name="sfContent"></textarea>
		                                          <div class="p-2 bg-light d-flex justify-content-between align-items-center">
		                                              <div style="display:flex;">
		                                              		<input type="file" id="upfile" name="uploadFiles" style="display:none;" multiple>
		                                                  <a href="#" class="btn btn-sm px-2 font-16 btn-light" onclick="$('#upfile').click();"><i class="mdi mdi-image-outline"></i></a>
				                                              <div id="imagePreview" style="margin-left:20px;">
				                                              	<!-- 이미지 넣는 영역 -->
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
		                  <!-- end new post -->
				   
				   				
				   				
				  <script>
				    $(document).ready(function() {
				        $('#upfile').on('change', function() {
				            var files = $(this)[0].files;
				            var imagePreview = $('#imagePreview');

				            // 이미지를 보여줄 영역 비우기
				            imagePreview.empty();

				            // 파일이 선택되었을 때
				            if (files.length > 0) {
				                for (var i = 0; i < files.length; i++) {
				                    var reader = new FileReader();
				                    reader.onload = function(e) {
				                        // 이미지 태그 생성하여 이미지 미리보기 추가
				                        var img = $('<img>');
				                        img.attr('src', e.target.result);
				                        img.attr('style', 'max-width: 65px; max-height: 65px; margin-right: 5px;');
				                        imagePreview.append(img);
				                    }
				                    reader.readAsDataURL(files[i]);
				                }
				            }
				        });
				    });
				  </script>
												
				  <script>           		
				  

				  
				  $(".memNo").val("${loginUser.memNo}");
				  
				  // 피드 게시물 ajax	 		
				  function ajaxFeedList(){
					  var contextPath = '${contextPath}';
				  		$.ajax({
			            url: '${contextPath}/feed/list',
			            type: 'post',
			            dataType: 'json',
			            success: function(data) {
			            		var feedList = data.feedList;
			            		var replyList = data.replyList;
			            	
			                let feedArea = $('#feedArea');
			                // 기존 내용을 지웁니다.
			
			                if (feedList.length === 0) {
								          feedArea.append(`
								            <div class="card" style="width: 1040px;">
								              <div class="card-body">
								                <h5>첫 게시물을 작성해주세요!</h5>
								              </div>
								            </div>
								          `);
			                } else {
			                		for (var i = 0; i < feedList.length; i++) {
			                      var socialFeed = feedList[i];
			                      var attachments = '';
			                      if (socialFeed.attachList) {
			                        attachments = '<div class="row">';
			                        for (var j = 0; j < socialFeed.attachList.length; j++) {
			                          var at = socialFeed.attachList[j];
			                          attachments +=
			                            '<div class="col-sm">' +
			                              '<img src="' + contextPath + at.filePath + '/' + at.systemName + '" alt="post-img" class="rounded me-1 img-fluid mb-3">' +
			                            '</div>';
			                        }
			                        attachments += '</div>';
			                      }
			                      
			                      var feedHtml = 
			                        '<div class="card" style="width: 1040px;">' +
			                          '<input type="hidden" id="sfNo-' + socialFeed.sfNo + '" name="sfNo" value="' + socialFeed.sfNo + '">' +
			                          '<input type="hidden" class="memNo" name="memNo" value="${loginUser.memNo}">' +  // 사용자 회원 번호 설정
			                          '<input type="hidden" class="sfMemNo" name="sfMemNo" value="' + socialFeed.memNo + '">' + 
			                          '<div class="card-body" id="reply-box">' +
			                            '<div class="d-flex align-items-start">' +
			                              '<img class="me-2 avatar-sm rounded-circle" src="' + contextPath + socialFeed.profileImgPath + '" alt="user-image">' +
			                              '<div class="w-100">' +
			                                '<div class="dropdown float-end text-muted">';
			                                

			                               console.log("글번호:", socialFeed.sfNo);
                            if(${loginUser.memNo} === parseInt(socialFeed.memNo)) {

                                feedHtml +=
                                	'<form id="frm" action="" method="get" align="center">' + 
                                		'<input type="hidden" name="sfNo" value="' + socialFeed.sfNo + '">' +
                                		'<a href="#" class="dropdown-toggle text-muted font-18" data-bs-toggle="dropdown" aria-expanded="false">' +
                                        '<i class="mdi mdi-dots-horizontal"></i>' +
                                    '</a>' +
                                    '<div class="dropdown-menu dropdown-menu-end">' +
                                        '<button type="submit" class="dropdown-item" onclick="frmFeed(1);">수정하기</a>' +
                                        '<button type="submit" class="dropdown-item" onclick="frmFeed(2);">삭제하기</a>' +
                                    '</div>' +
                                  '</form>';
                            }
			                                
			                                feedHtml += '</div>' +
			                                '<h5 class="m-0">' + socialFeed.memName + '</h5>' +
			                                '<p class="text-muted"><small>' + socialFeed.enrollDate + '</small></p>' +
			                              '</div>' +
			                            '</div>' +
			                            '<p>' + socialFeed.sfContent + '</p>' +
			                            attachments +
			  		                  		'<div class="mt-2" id="countArea">' +
					                      		'<a href="javascript: void(0);" class="btn btn-sm btn-link text-muted ps-0"><i class="mdi mdi-heart text-danger"></i> 30 좋아요</a> ' + 
					                      		'<a href="javascript: void(0);" class="btn btn-sm btn-link text-muted"><i class="mdi mdi-comment-multiple-outline"></i>댓글 <span id="rcount-' + socialFeed.sfNo + '"></span>개</a>' +
					                  			'</div>' + 
			                            '<div class="reply-list" id="replyList-' + socialFeed.sfNo + '"></div>' +
			                          '</div>' +
			                        '</div>';

			                      feedArea.append(feedHtml);
			                      
			                      


			                      
			                      // 댓글 리스트 추가
			                      var repliesForFeed = replyList.filter(function(reply) {
			                        return reply.refBno === socialFeed.sfNo;
			                      });
			                      
			                   		// 댓글 수 설정
			                   		$('#rcount-' + socialFeed.sfNo).empty();
			                      $('#rcount-' + socialFeed.sfNo).text(repliesForFeed.length);
			                      
			                      if (repliesForFeed.length > 0) {
			                    	  	for (var k = 0; k < repliesForFeed.length; k++) {
			                            var reply = repliesForFeed[k];
			                        	  var isLastReply = (k === repliesForFeed.length - 1); //마지막댓글
			                            var commentBox = 
			                              '<div class="post-user-comment-box mt-2" id="replyArea">' +
			                              	'<input type="hidden" name="replyNo" value="' + reply.replyNo + '">' +
			                                '<div class="d-flex align-items-start">' +
			                                  '<img class="me-2 avatar-sm rounded-circle" src="' + contextPath + reply.profileImgPath + '" alt="Generic placeholder image">' +
			                                  '<div class="w-100">' + 
			                                  	'<h5 class="mt-0"><a href="contacts-profile.html" class="text-reset">' + reply.memName + '</a> <small class="text-muted">' + reply.enrollDate + '</small>';
			                                  
			                                  	console.log("replyNo: ", reply.replyNo);
			                                  if(${loginUser.memNo} === parseInt(reply.memNo)) {
			                                	  commentBox += '<div style="display:flex; margin-left: auto; margin-top:-20px;"><button type="button" class="btn btn-sm" style="background-color:#lightgray; margin-left:auto;" onclick="ajaxRemoveReply(' + reply.replyNo + ');">삭제</button></div>'; 
			                                 	}
			                                    
			                                    commentBox +=
			                                    	'</h5>' +
			                                    reply.replyContent + '<br/>' +
			                                  '</div>' +
			                                '</div>' +
			                              '</div>';


			                            $('#replyList-' + reply.refBno).append(commentBox);
			                            
			                    	  	}
	                          } 
	                          
	                    	    var replyBox = 
	                    	        '<div class="d-flex align-items-start mt-2">' +
	                    	            '<a class="pe-2" href="#">' +  
	                    	                '<img src="' + contextPath + '${loginUser.profileImgPath}" class="rounded-circle" alt="Generic placeholder image" height="31">' +
	                    	            '</a>' +   
	                    	            '<div class="w-100" style="display:flex;">' +
	                    	                '<input type="text" id="replyContent-' + socialFeed.sfNo + '" class="form-control form-control-light border-0 form-control-sm" style="width:85%;" placeholder="댓글을 작성해주세요." required>' +
	                    	                '<button type="button" class="btn btn-sm" style="background-color:#febe98; color:white; width:80px; margin-left:5px;" onclick="ajaxInsertReply(' + socialFeed.sfNo + ');">' +
	                    	                    '<i class="mdi mdi-send-outline me-1"></i>등록' +
	                    	                '</button>' +
	                    	            '</div>' + 
	                    	        '</div>';
	                    	        
	                    	    $("#replyList-" + socialFeed.sfNo).append(replyBox);		                    	  	
	                                

	                                
	                      }
                     }
                   
                 },
                 error: function(xhr, status, error) {
                   console.error('AJAX feedList failed:', status, error);
                 }
             });
          }
				  
				  // 댓글 ajax로 작성 요청하는 function
        	function ajaxInsertReply(sfNo){
        		 var replyContent = $("#replyContent-" + sfNo).val().trim();
					  
        		if (replyContent.length != 0) {
        			
        			$.ajax({
        				url:"${contextPath}/feed/registReply.do",
        				type:"post",
        				data:{
        					replyContent: replyContent,
        					refBno: sfNo
        				},
        				success:function(result){
        					if(result == "SUCCESS"){
        						$("[id^='replyList-']").empty();
        						$("#replyContent-" + sfNo).val("");
        						ajaxFeedList(sfNo);
        						
        					}else if(result == "FAIL"){
        	        	alert("다시 입력해주세요.");
        					}
        					
        				}, error:function(){
        					 console.log("댓글 작성용 ajax통신 실패");
        				}
        				
        			})
        			
        		}else{
        			alert("댓글 작성 서비스", "내용을 입력해주세요.");
        		}
        	}
				  
        	     
        	// 피드글 수정/삭제
				  function frmFeed(num){
					  $("#frm").attr("action", num==1 ? "${contextPath}/feed/modifyForm.page"
																						: "${contextPath}/feed/delete.do");
				  }
				  
	        // 해당 댓글 삭제용 ajax요청
				  function ajaxRemoveReply(replyNo){
       			$.ajax({
       				url:"${contextPath}/feed/removeReply.do",
       				type:"get",
       				data:{replyNo: replyNo},
       				success:function(result){
       					if(result == "SUCCESS"){
       						$("[id^='replyList-']").empty();
       						ajaxFeedList();
       	          alert("댓글을 삭제했습니다.");

       					}
       				},
       				error:function(){
               	alert("댓글 삭제에 실패했습니다.");

       				}
       			
       			});
					   
				  }
				  
     			$(document).ready(function(){
     				ajaxFeedList();
     				
     			})
					 
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

    </body>
</html>