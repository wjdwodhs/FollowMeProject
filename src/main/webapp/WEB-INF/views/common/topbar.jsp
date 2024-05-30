<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">

<head>
    <meta charset="utf-8" />
    <title>menubar</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- App favicon -->
<link rel="shortcut icon" href="${ contextPath }/assets/images/favicon.ico">

<!-- Plugins css -->
<link href="${ contextPath }/assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
<link href="${ contextPath }/assets/libs/selectize/css/selectize.bootstrap3.css" rel="stylesheet" type="text/css" />

<!-- Theme Config Js -->
<script src="${ contextPath }/assets/js/head.js"></script>

<!-- Bootstrap css -->
<link href="${ contextPath }/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="app-style" />

<!-- App css -->
<link href="${ contextPath }/assets/css/app.min.css" rel="stylesheet" type="text/css" />

<!-- Icons css -->
<link href="${ contextPath }/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

</head>
<body>

<script>
    
    if ("${alertMsg}" !== "") {
        alert("${alertMsg}");
       
        if ("${historyBackYN}" === "Y") {
            history.back();
        }
    }
</script>

	<!-- ========== Topbar Start ========== -->
<div class="navbar-custom">
    <div class="topbar" style="background-color: #FFBE98;">
        <div class="topbar-menu d-flex align-items-center gap-1">

            <!-- Topbar Brand Logo -->
            <div class="logo-box">
                <!-- Brand Logo Light -->
                <a href="index.html" class="logo-light">
                    <img src="${ contextPath }/assets/images/logo-follow.png" alt="logo" class="logo-lg">
                    <img src="${ contextPath }/assets/images/logo-sm.png" alt="small logo" class="logo-sm">
                </a>

                <!-- Brand Logo Dark -->
                <a href="index.html" class="logo-dark">
                    <img src="${ contextPath }/assets/images/logo-follow.png" alt="dark logo" class="logo-lg">
                    <img src="${ contextPath }/assets/images/logo-sm.png" alt="small logo" class="logo-sm">
                </a>
            </div>

            <!-- Sidebar Menu Toggle Button -->
            <button class="button-toggle-menu">
                <i class="mdi mdi-menu"></i>
            </button>
            
            <!-- Google 번역 -->
							<div id="google_translate_element" class="hd_lang"></div>
							<script>
								function googleTranslateElementInit() {
									new google.translate.TranslateElement({
										pageLanguage: 'ko',
										includedLanguages: 'ko,zh-CN,zh-TW,ja,en,fr',
										layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
										autoDisplay: false
									}, 'google_translate_element');
								}
							</script>
							<script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
					 <!-- //Google 번역 -->

           

      
        </div>

        <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
        <script>
        		const sock = new SockJS("${contextPath}/echo");
        			
        		sock.onmessage = onMessage;
        		
        		sock.onopen = function(){
        				console.log('open');
        				sock.send();
        		}
        		
        		sock.onclose = function() {
        		    console.log('close');
        		};
        		
        		//onMessage function처리해놓고
        		function onMessage(evt){ // evt.data : 웹소켓으로부터 나에게 온 메세지
        			// 해당 메세지로 아래의 알람리스트 영역에 해당 메세지 한개만 요소만들어서 append
        		  console.log("evt.data : ", evt.data);
        		  console.log("evt : ", evt);
        		          		  
		        	let msgArr = evt.data.split("/");
	        		var title = msgArr[1];	
	        		var time = msgArr[2];
	        		var msg = msgArr[3];
	        		var count = msgArr[4];
	        		
        			var alarm = document.getElementById("red");
		        			alarm.style.display = 'block';									
        		  		alarm.innerText = count;
	        		const $alarmContainer = $("#alarmContainer .simplebar-content");
	        		let $alarmArea;
			        
			        if (msgArr[0] != "성공") {
			            $alarmArea = $(
			                '<a href="' + contextPath + '/document/detail?no=' + msgArr[4] + '" class="dropdown-item p-0 notify-item card unread-noti shadow-none mb-1"></a>'
			            );
			        } else {
			            $alarmArea = $(
			                '<a href="javascript:void(0);" class="dropdown-item p-0 notify-item card unread-noti shadow-none mb-1 style="background-color:#FFD5BC;"></a>'
			            );
			        }
			        
			        let $cardBody = $('<div class="card-body" style="background-color:#FFD5BC;"></div>');
			        let $closeBtn = $('<span class="float-end noti-close-btn text-muted"></span>');
			        let $dFlex = $('<div class="d-flex align-items-center"></div>');
			        let $flexGrow = $('<div class="flex-grow-1 text-truncate ms-2"></div>');
			        let $title = $('<h5 class="noti-item-title fw-semibold font-14"></h5>');
			        let $time = $('<small class="fw-normal text-muted ms-1"></small>');
			        let $msg = $('<small class="noti-item-subtitle text-muted" id="message"></small>');
			        
			        
              $title.text(title);
              $time.text(time);
              $msg.text(msg);
			        
			        // 요소 조립
			        $title.append($time);
			        $flexGrow.append($title);
			        $flexGrow.append($msg);
			        $dFlex.append($flexGrow);
			        $cardBody.append($closeBtn);
			        $cardBody.append($dFlex);
			        $alarmArea.append($cardBody);
			        
			        $alarmContainer.prepend($alarmArea);
			       
    				
        		}
        		
        		function alarmList(){
			        $.ajax({
					    url: "${contextPath}/alarmList",
					    type: 'post',
					    success:function(alarmList){  
					    						    	
					        const $alarmContainer = $("#alarmContainer .simplebar-content");					        
					        
							        for(let i = 0; i<alarmList.length; i++){
							        		var title = alarmList[i].notiType;
							        		var time = alarmList[i].createDate;
							        		var msg = alarmList[i].notiMsg;
		
							        		if(title == 'Y' || title == 'N'){
							        			title = "전자문서";
							        		}else if(title == '1' || title == '2' || title == '3' || title == '4'){
							        			title = "근태알림";
							        		}else if(title == 'A'){
							        			title = "좌석예약";
							        		}else if(title == 'M'){
							        			title = "메일수신";
							        		}else if(title == 'G'){
							        			title = "쪽지수신";	
							        		}
							        			
							        			
							        		let $alarmArea = $('<a href="javascript:void(0);" class="dropdown-item p-0 notify-item card unread-noti shadow-none mb-1"></a>');
									        let $cardBody = $('<div class="card-body"></div>');
									        let $closeBtn = $('<span class="float-end noti-close-btn text-muted"></span>');
									        let $dFlex = $('<div class="d-flex align-items-center"></div>');
									        let $flexGrow = $('<div class="flex-grow-1 text-truncate ms-2"></div>');
									        let $title = $('<h5 class="noti-item-title fw-semibold font-14"></h5>');
									        let $time = $('<small class="fw-normal text-muted ms-1"></small>');
									        let $msg = $('<small class="noti-item-subtitle text-muted" id="message"></small>');
									        
									        
						              $title.text(title);
						              $time.text(time);
						              $msg.text(msg);
									        
									        // 요소 조립
									        $title.append($time);
									        $flexGrow.append($title);
									        $flexGrow.append($msg);
									        $dFlex.append($flexGrow);
									        $cardBody.append($closeBtn);
									        $cardBody.append($dFlex);
									        $alarmArea.append($cardBody);
									        
									        $alarmContainer.append($alarmArea);
							        }
					    }
			        });
        		
        		  

        		}

        		
        		// 리스트 조회시점 발송될떄 x		
        		// login시, 알람리스트 조회는 ajax로 처리 
		        
		        function updateAlarm(){
					    $("#red").css("display", "none");
			        
					    $.ajax({
						    url: "${contextPath}/updateAlarm",
						    type: 'post',
						    success:function(result){  
						    	
						    }
					    
			        });
		        }
		        
		        function deleteAlarm(){
		        	$("#red").css("display", "none");
		        	
			        $.ajax({
					    url: "${contextPath}/deleteAlarm",
					    type: 'post',
					    success: function(result){  
					    	sock.send("delete list");
					    	
					    	 setTimeout(function() {
					           alarmList();
					       }, 500); // 필요에 따라 딜레이를 조정합니다.
	                
					    
					    }
			        });
		        }
		        
		        $(document).ready(function() {
		            alarmList(); //알람리스트 호출
		            $("#alarmIcon").on('click', function() {
		                updateAlarm();
		            });
		            $("#deleteAlarm").on('click', function() {
		            		deleteAlarm();
		            });
		            
		        });
		        
        </script>

        <ul class="topbar-menu d-flex align-items-center">
        
		        <!-- Notofication dropdown -->
		        <li class="dropdown notification-list">
		            <a class="nav-link dropdown-toggle waves-effect waves-light arrow-none" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false" id="alarmIcon">
		                <i class="fe-bell font-22"></i>
		                <input type="hidden" id="memNo" value="${loginUser.memNo}">
	                	<span class="badge bg-danger rounded-circle noti-icon-badge" id="red" style="display:none;"></span>
		            </a>
		            <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated dropdown-lg py-0">
		                <div class="p-2 border-top-0 border-start-0 border-end-0 border-dashed border">
		                    <div class="row align-items-center">
		                        <div class="col">
		                            <h6 class="m-0 font-16 fw-semibold"> 알림</h6>
		                        </div>
		                        <div class="col-auto">
		                            <a href="javascript: void(0);" class="text-dark text-decoration-underline" id="deleteAlarm">
		                                <small>Clear All</small>
		                            </a> 
		                        </div>
		                    </div>
		                </div>
		
										<!-- 하단의 알람리스트는 AlaramController에 알람리스틑 조회하는 ajax용 controller 작성후 페이지 렌더링시 ajax실행시켜서 뿌리도록 -->
										<div class="px-1" style="max-height: 300px;" id="alarmContainer" data-simplebar>
										
										</div>
		            </div>
		        </li>       
		         
            <!-- Topbar Search Form -->
            <li class="app-search dropdown me-3 d-none d-lg-block">
                <form onsubmit="return searchEmployee();">
								    <div style="position: relative; display: inline-block;">
								        <input type="search" class="form-control rounded-pill" id="top-search" style="background-color: #F2E8DA; padding-right: 40px;" placeholder="직원 이름을 입력하세요">
								        <button type="submit" class="fe-search search-icon font-16" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); background-color: transparent; border: none;">
								        </button>
								    </div>
								</form>
            </li>
            
            <script>
				        function searchEmployee() {
				            const searchQuery = $('#top-search').val();
				
				            console.log(searchQuery);
				            
				            if (searchQuery) {
				            	
				            	// 새 창 열기
                      const popupWindow = window.open('', 'memberInfoPopUp', 'width=600,height=400,left=' + (window.innerWidth / 2 - 300) + ',top=' + (window.innerHeight / 2 - 200));
				            	
				            	
				                $.ajax({
				                    url: '${contextPath}/memberSearchPopUp',
				                    method: 'GET',
				                    data: { memName: searchQuery },
				                    success: function(response) {
				                    		// 응답받은 HTML 내용을 팝업 창에 쓰기
				                        popupWindow.document.open();
				                        popupWindow.document.write(response);
				                        popupWindow.document.close();
				                    },
				                    error: function() {
				                        alert('직원 정보를 찾을 수 없습니다.');
				                    }
				                });
				            } else {
				                alert('직원 이름을 입력하세요.');
				            }
				
				            return false; 
				        }
				    </script>

            <!-- Fullscreen Button -->
            <!-- <li class="d-none d-md-inline-block">
                <a class="nav-link waves-effect waves-light" href="" data-toggle="fullscreen">
                    <i class="fe-maximize font-22"></i>
                </a>
            </li> -->

						<%-- 
            <!-- Search Dropdown (for Mobile/Tablet) -->
            <li class="dropdown d-lg-none">
                <a class="nav-link dropdown-toggle waves-effect waves-light arrow-none" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <i class="ri-search-line font-22"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-animated dropdown-lg p-0">
                    <form class="p-3">
                        <input type="search" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                    </form>
                </div>
            </li>
            --%>

						<%-- 
            <!-- Language flag dropdown -->
            <li class="dropdown d-none d-md-inline-block">
                <a class="nav-link dropdown-toggle waves-effect waves-light arrow-none" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <img src="${ contextPath }/assets/images/flags/korea.jpg" alt="user-image" class="me-0 me-sm-1" height="18">
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated">

                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item">
                        <img src="${ contextPath }/assets/images/flags/us.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">US</span>
                    </a>
                    
                </div>
            </li>
            --%>
            
            
            <!-- Notofication dropdown -->
            <%-- <li class="dropdown notification-list">
                <a class="nav-link dropdown-toggle waves-effect waves-light arrow-none" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <i class="fe-bell font-22"></i>
                    <span class="badge bg-danger rounded-circle noti-icon-badge">9</span>
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated dropdown-lg py-0">
                    <div class="p-2 border-top-0 border-start-0 border-end-0 border-dashed border">
                        <div class="row align-items-center">
                            <div class="col">
                                <h6 class="m-0 font-16 fw-semibold"> Notification</h6>
                            </div>
                            <div class="col-auto">
                                <a href="javascript: void(0);" class="text-dark text-decoration-underline">
                                    <small>Clear All</small>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="px-1" style="max-height: 300px;" data-simplebar>

                        <h5 class="text-muted font-13 fw-normal mt-2">Today</h5>
                        <!-- item-->

                        <a href="javascript:void(0);" class="dropdown-item p-0 notify-item card unread-noti shadow-none mb-1">
                            <div class="card-body">
                                <span class="float-end noti-close-btn text-muted"><i class="mdi mdi-close"></i></span>
                                <div class="d-flex align-items-center">
                                    <div class="flex-shrink-0">
                                        <div class="notify-icon bg-primary">
                                            <i class="mdi mdi-comment-account-outline"></i>
                                        </div>
                                    </div>
                                    <div class="flex-grow-1 text-truncate ms-2">
                                        <h5 class="noti-item-title fw-semibold font-14">Datacorp <small class="fw-normal text-muted ms-1">1 min ago</small></h5>
                                        <small class="noti-item-subtitle text-muted">Caleb Flakelar commented on Admin</small>
                                    </div>
                                </div>
                            </div>
                        </a>

                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item p-0 notify-item card read-noti shadow-none mb-1">
                            <div class="card-body">
                                <span class="float-end noti-close-btn text-muted"><i class="mdi mdi-close"></i></span>
                                <div class="d-flex align-items-center">
                                    <div class="flex-shrink-0">
                                        <div class="notify-icon bg-info">
                                            <i class="mdi mdi-account-plus"></i>
                                        </div>
                                    </div>
                                    <div class="flex-grow-1 text-truncate ms-2">
                                        <h5 class="noti-item-title fw-semibold font-14">Admin <small class="fw-normal text-muted ms-1">1 hours ago</small></h5>
                                        <small class="noti-item-subtitle text-muted">New user registered</small>
                                    </div>
                                </div>
                            </div>
                        </a>

                        <h5 class="text-muted font-13 fw-normal mt-0">Yesterday</h5>

                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item p-0 notify-item card read-noti shadow-none mb-1">
                            <div class="card-body">
                                <span class="float-end noti-close-btn text-muted"><i class="mdi mdi-close"></i></span>
                                <div class="d-flex align-items-center">
                                    <div class="flex-shrink-0">
                                        <div class="notify-icon">
                                            <img src="${ contextPath }/assets/images/users/avatar-2.jpg" class="img-fluid rounded-circle" alt="" />
                                        </div>
                                    </div>
                                    <div class="flex-grow-1 text-truncate ms-2">
                                        <h5 class="noti-item-title fw-semibold font-14">Cristina Pride <small class="fw-normal text-muted ms-1">1 day ago</small></h5>
                                        <small class="noti-item-subtitle text-muted">Hi, How are you? What about our next meeting</small>
                                    </div>
                                </div>
                            </div>
                        </a>

                        <h5 class="text-muted font-13 fw-normal mt-0">30 Dec 2021</h5>

                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item p-0 notify-item card read-noti shadow-none mb-1">
                            <div class="card-body">
                                <span class="float-end noti-close-btn text-muted"><i class="mdi mdi-close"></i></span>
                                <div class="d-flex align-items-center">
                                    <div class="flex-shrink-0">
                                        <div class="notify-icon bg-primary">
                                            <i class="mdi mdi-comment-account-outline"></i>
                                        </div>
                                    </div>
                                    <div class="flex-grow-1 text-truncate ms-2">
                                        <h5 class="noti-item-title fw-semibold font-14">Datacorp</h5>
                                        <small class="noti-item-subtitle text-muted">Caleb Flakelar commented on Admin</small>
                                    </div>
                                </div>
                            </div>
                        </a>

                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item p-0 notify-item card read-noti shadow-none mb-1">
                            <div class="card-body">
                                <span class="float-end noti-close-btn text-muted"><i class="mdi mdi-close"></i></span>
                                <div class="d-flex align-items-center">
                                    <div class="flex-shrink-0">
                                        <div class="notify-icon">
                                            <img src="${ contextPath }/assets/images/users/avatar-4.jpg" class="img-fluid rounded-circle" alt="" />
                                        </div>
                                    </div>
                                    <div class="flex-grow-1 text-truncate ms-2">
                                        <h5 class="noti-item-title fw-semibold font-14">Karen Robinson</h5>
                                        <small class="noti-item-subtitle text-muted">Wow ! this admin looks good and awesome design</small>
                                    </div>
                                </div>
                            </div>
                        </a>

                        <div class="text-center">
                            <i class="mdi mdi-dots-circle mdi-spin text-muted h3 mt-0"></i>
                        </div>
                    </div>

                    <!-- All-->
                    <a href="javascript:void(0);" class="dropdown-item text-center text-primary notify-item border-top border-light py-2">
                        View All
                    </a>

                </div>
            </li> --%>

            

            <!-- User Dropdown -->
            <li class="dropdown">
                <a class="nav-link dropdown-toggle nav-user me-0 waves-effect waves-light" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <img src="${ contextPath }${loginUser.profileImgPath}" alt="user-image" class="rounded-circle">
                    <span class="ms-1 d-none d-md-inline-block">
                        ${loginUser.memName } 님<i class="mdi mdi-chevron-down"></i>
                    </span>
                </a>
                <div class="dropdown-menu dropdown-menu-end profile-dropdown ">
                    
                    <!-- item-->
                    <a href="${ contextPath }/member/mypage.do" class="dropdown-item notify-item">
                        <i class="fe-user"></i>
                        <span>마이페이지</span>
                    </a>
                    <!-- item-->
                    <a href="${ contextPath }/message/messagePage" class="dropdown-item notify-item">
                        <i class="fe-message-square"></i>
                        <span>쪽지함</span>
                    </a>


                    <div class="dropdown-divider"></div>

                    <!-- item-->
                    <a href="${ contextPath }/member/logout.do" class="dropdown-item notify-item">
                        <i class="fe-log-out"></i>
                        <span>로그아웃</span>
                    </a>

                </div>
            </li>

            <!-- Right Bar offcanvas button (Theme Customization Panel) 
            <li>
                <a class="nav-link waves-effect waves-light" data-bs-toggle="offcanvas" href="#theme-settings-offcanvas">
                    <i class="fe-settings font-22"></i>
                </a>
            </li>
            -->
        </ul>
    </div>
</div>
<!-- ========== Topbar End ========== -->

</body>
</html>