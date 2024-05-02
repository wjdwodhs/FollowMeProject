<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">


<head>
<meta charset="utf-8" />
<title>마이페이지 | Follow Me</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />

<!-- App favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- Theme Config Js -->
<script src="${ contextPath }/assets/js/head.js"></script>

<!-- Bootstrap css -->
<link href="${ contextPath }/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="app-style" />

<!-- App css -->
<link href="${ contextPath }/assets/css/app.min.css" rel="stylesheet" type="text/css" />

<!-- Icons css -->
<link href="${ contextPath }/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

<style>
	.a.nav-link.active{backgroun-color:#febe98;}
</style>

<script>
		//"이메일 중복 확인" 링크 클릭 시 모달 창 표시
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelector('#emailCheckLink').addEventListener('click', function() {
            $('#emailCheckModal').modal('show'); 
        });
    });
   
		// 이메일 변경 모달창 '변경' 버튼 클릭 시 함수
		function changeEmail() {
			var originalEmail = document.getElementById('originMemEmail').value;
			var newEmail = document.getElementById('newMemEmail').value;
			
			if(newEmail == '') {
				alert('변경할 이메일을 입력해주세요');
			} else if(originalEmail == newEmail) {
				alert('기존과 다른 이메일 주소를 입력해주세요');
			} else {
				location.href = "${contextPath}/member/changeEmail.do?originalEmail=" + originalEmail + "&newEmail=" + newEmail;
			}
			
		}
		
		// 비밀번호 버튼 클릭 시 모달창 표시
		 document.addEventListener('DOMContentLoaded', function() {
        document.querySelector('#memPwd').addEventListener('click', function() {
            $('#pwdChangeModal').modal('show'); 
        });
    });
		
		// 비밀번호 변경 모달창 '변경' 버튼 클릭 시 함수
		function validatePassword(password) {
			
	    const regex = /^(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*])[a-z\d!@#$%^&*]{8,15}$/;
	    return regex.test(password);
		}
		
		function changePwd() {
			 	var memNo = document.getElementById('memNo').value;
		    var newMemPwd = document.getElementById('newMemPwd').value;
		    var newMemPwdConfirm = document.getElementById('newMemPwdConfirm').value;
		
		    if (!validatePassword(newMemPwd)) {
		        alert('비밀번호는 8~15자 사이의 영문, 숫자, 특수문자를 포함해야 합니다.');
		        return;
		    }
		
		    if (newMemPwd !== newMemPwdConfirm) {
		        alert('비밀번호가 일치하지 않습니다.');
		        return;
		    }
		
		    // 비밀번호 변경 로직
		    location.href = "${contextPath}/member/changePwd.do?newMemPwd=" + newMemPwd + "&memNo=" + memNo;
		}
    
    
</script>


</head>

<body>
<!-- Begin page -->
        <div id="wrapper">

           <!-- sidemenu include -->
           <jsp:include page="/WEB-INF/views/common/sidemenu.jsp"/>
            

            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

            <div class="content-page">

               <!-- topbar include -->
               <jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
            
		           <div class="content">
		
		                    <!-- Start Content-->
		                    <div class="container-fluid">
		
		                        <!-- start page title -->
		                        <div class="row">
		                            <div class="col-12">
		                                <div class="page-title-box">
		                                    <div class="page-title-right">
		                                        
		                                    </div>
		                                    <h4 class="page-title">마이페이지</h4>
		                                </div>
		                            </div>
		                        </div>
		                        <!-- end page title -->
		                        <!-- end page title -->
		
		                        <div class="row">
		                            <div class="col-lg-4 col-xl-4">
		                                <div class="card text-center">
		                                    <div class="card-body">
		                                        <img src="${ contextPath }/assets/images/users/user-1.jpg" class="rounded-circle avatar-lg img-thumbnail"
		                                        alt="profile-image">
		
		                                        <h4 class="mb-0">${ mypageUser.memName }</h4>
		                                        <p class="text-muted">@${ mypageUser.memNo }</p>
		
		                                        <div class="text-start mt-3">
		                                            
		                                            <p class="text-muted mb-2 font-13"><strong>소속부서 :</strong> <span class="ms-2">${ mypageUser.deptName }</span></p>
		
		                                            <p class="text-muted mb-2 font-13"><strong>직급 :</strong> <span class="ms-2">${ mypageUser.memGrade }</span></p>
		                                        
		                                            <p class="text-muted mb-2 font-13"><strong>내선번호 :</strong><span class="ms-2">${ mypageUser.extensionNumber }</span></p>
		
		                                            <p class="text-muted mb-2 font-13"><strong>휴대폰번호 :</strong><span class="ms-2">${ mypageUser.phone }</span></p>
		                                        
		                                            <p class="text-muted mb-2 font-13"><strong>Email :</strong> <span class="ms-2">${ mypageUser.memEmail }</span></p>
		                                        </div>                                    
		
		                                        
		                                    </div>                                 
		                                </div> <!-- end card -->
		
		                                <div class="card">
		                                    <div class="card-body" style="height: 472px;">
		                                        <h4 class="header-title mb-3">쪽지함</h4>
		
		                                        <div class="inbox-widget" data-simplebar style="max-height: 350px;">
		                                            <div class="inbox-item">
		                                                <div class="inbox-item-img"><img src="${ contextPath }/assets/images/users/user-2.jpg" class="rounded-circle" alt=""></div>
		                                                <p class="inbox-item-author">라이언 사원</p>
		                                                <p class="inbox-item-text">지난번에 말씀하셨던 그 프로젝트는 이번주...</p>
		                                                <p class="inbox-item-date">
		                                                    <a href="javascript:(0);" class="btn btn-sm btn-link text-info font-13"> 답장 </a>
		                                                </p>
		                                            </div>
		                                            <div class="inbox-item">
		                                                <div class="inbox-item-img"><img src="${ contextPath }/assets/images/users/user-3.jpg" class="rounded-circle" alt=""></div>
		                                                <p class="inbox-item-author">어피치 사원</p>
		                                                <p class="inbox-item-text">말씀하신 결재 기안 올렸습니다!</p>
		                                                <p class="inbox-item-date">
		                                                    <a href="javascript:(0);" class="btn btn-sm btn-link text-info font-13"> 답장 </a>
		                                                </p>
		                                            </div>
		                                            <div class="inbox-item">
		                                                <div class="inbox-item-img"><img src="${ contextPath }/assets/images/users/user-4.jpg" class="rounded-circle" alt=""></div>
		                                                <p class="inbox-item-author">프로도 사원</p>
		                                                <p class="inbox-item-text">메일로 전달드린 보고서 확인 부탁드립니다.</p>
		                                                <p class="inbox-item-date">
		                                                    <a href="javascript:(0);" class="btn btn-sm btn-link text-info font-13"> 답장 </a>
		                                                </p>
		                                            </div>
		
		                                            <div class="inbox-item">
		                                                <div class="inbox-item-img"><img src="${ contextPath }/assets/images/users/user-5.jpg" class="rounded-circle" alt=""></div>
		                                                <p class="inbox-item-author">무지 매니저</p>
		                                                <p class="inbox-item-text">아 맞다, 언제 휴가라고 했지?</p>
		                                                <p class="inbox-item-date">
		                                                    <a href="javascript:(0);" class="btn btn-sm btn-link text-info font-13"> 답장 </a>
		                                                </p>
		                                            </div>
		                                            <div class="inbox-item">
		                                                <div class="inbox-item-img"><img src="${ contextPath }/assets/images/users/user-6.jpg" class="rounded-circle" alt=""></div>
		                                                <p class="inbox-item-author">네오 사원</p>
		                                                <p class="inbox-item-text">다음 회의는 목요일 오전 10시로 확정되었습니다.</p>
		                                                <p class="inbox-item-date">
		                                                    <a href="javascript:(0);" class="btn btn-sm btn-link text-info font-13"> 답장 </a>
		                                                </p>
		                                            </div>
		
		                                            
		                                        </div> <!-- end inbox-widget -->
		                                    </div>
		                                </div> <!-- end card-->
		
		                            </div> <!-- end col-->
		
		                            <div class="col-lg-8 col-xl-8">
		                                <div class="card">
		                                    <div class="card-body">
		                                        <ul class="nav nav-pills nav-fill navtab-bg">
		                                            <li class="nav-item">
		                                                <a href="#aboutme" data-bs-toggle="tab" aria-expanded="true" class="nav-link active">
		                                                    경력정보
		                                                </a>
		                                            </li>
		                                            <li class="nav-item">
		                                                <a href="#settings" data-bs-toggle="tab" aria-expanded="true" class="nav-link">
		                                                    인사정보
		                                                </a>
		                                            </li>
		                                        </ul>
		                                        <div class="tab-content">
		                                            <div class="tab-pane show active" id="aboutme">
		    
		                                                <h5 class="mb-4 text-uppercase"><i class="mdi mdi-briefcase me-1"></i>
		                                                    경력 정보</h5>
		    
		                                                <ul class="list-unstyled timeline-sm">
		                                                    <li class="timeline-sm-item">
		                                                        <span class="timeline-sm-date">2015 - 18</span>
		                                                        <h5 class="mt-0 mb-1">경영지원팀</h5>
		                                                        <p>websitename.com</p>
		                                                        <p class="mt-2" style="overflow-y: auto; max-height: 100px;">고객 지원 및 문서 처리 분야에서 다양한 경험을 쌓아왔습니다. 
		                                                            고객들의 요구를 신속하게 처리하고, 정확한 문서 작성 및 관리를 통해 팀의 생산성을 높이는 데
		                                                            주력하고 있습니다. 또한, 효율적인 업무 프로세스를 개선하고 팀원들 간의 원활한 커뮤니케이션을
		                                                             촉진하여 팀의 목표를 달성하는 데 기여하고 있습니다.고객 지원 및 문서 처리 분야에서 다양한 경험을 쌓아왔습니다. 
		                                                            고객들의 요구를 신속하게 처리하고, 정확한 문서 작성 및 관리를 통해 팀의 생산성을 높이는 데
		                                                            주력하고 있습니다. 또한, 효율적인 업무 프로세스를 개선하고 팀원들 간의 원활한 커뮤니케이션을
		                                                             촉진하여 팀의 목표를 달성하는 데 기여하고 있습니다.</p>
		    
		                                                    </li>
		                                                    <li class="timeline-sm-item">
		                                                        <span class="timeline-sm-date">2012 - 15</span>
		                                                        <h5 class="mt-0 mb-1">경영기획팀</h5>
		                                                        <p>Software Inc.</p>
		                                                        <p class="mt-2" style="overflow-y: auto; max-height: 100px;">다양한 전략적 프로젝트를 수행했습니다. 
		                                                            수치 분석 및 예산 관리에 능숙하며, 비즈니스 목표를 달성하기 위한 전략을 개발하는 데에 주력해 왔습니다. 
		                                                            또한, 팀원들과의 긴밀한 협업을 통해 조직의 성장과 발전을 위한 전략을 수립하고 실행했습니다.다양한 전략적 프로젝트를 수행했습니다. 
		                                                            수치 분석 및 예산 관리에 능숙하며, 비즈니스 목표를 달성하기 위한 전략을 개발하는 데에 주력해 왔습니다. 
		                                                            또한, 팀원들과의 긴밀한 협업을 통해 조직의 성장과 발전을 위한 전략을 수립하고 실행했습니다.다양한 전략적 프로젝트를 수행했습니다. 
		                                                            수치 분석 및 예산 관리에 능숙하며, 비즈니스 목표를 달성하기 위한 전략을 개발하는 데에 주력해 왔습니다. 
		                                                            또한, 팀원들과의 긴밀한 협업을 통해 조직의 성장과 발전을 위한 전략을 수립하고 실행했습니다.</p>
		                                                    </li>
		                                                    
		                                                </ul>
		    
		                                                <h5 class="mb-3 mt-4 text-uppercase"><i class="mdi mdi-cards-variant me-1"></i>
		                                                    보유자격증</h5>
		                                                <div class="table-responsive">
		                                                    <table class="table table-borderless mb-10">
		                                                        <thead class="table-light">
		                                                            <tr style="background-color:#febe98;">
		                                                                <th>#</th>
		                                                                <th>자격증</th>
		                                                                <th>발급번호</th>
		                                                                <th>취득일자</th>
		                                                                <th>인증기관</th>
		                                                                <th>증빙자료</th>
		                                                            </tr>
		                                                        </thead>
		                                                        <tbody>
		                                                            <tr>
		                                                                <td>1</td>
		                                                                <td>PMP</td>
		                                                                <td>12345678</td>
		                                                                <td>10/15/2018</td>
		                                                                <td>PMI</td>
		                                                                <td><input type="file"></td>
		                                                            </tr>
		                                                            <tr>
		                                                                <td>2</td>
		                                                                <td>경영자문사</td>
		                                                                <td>12349874</td>
		                                                                <td>12/05/2017</td>
		                                                                <td>기관</td>
		                                                                <td><input type="file"></td>
		                                                            </tr>
		                                                            <tr>
		                                                                <td>3</td>
		                                                                <td>ERP정보관리사</td>
		                                                                <td>12346598</td>
		                                                                <td>28/09/2016</td>
		                                                                <td>기관</td>
		                                                                <td><input type="file"></td>
		                                                            </tr>
		                                                            <tr>
		                                                                <td>4</td>
		                                                                <td>컴퓨터활용능력 1급</td>
		                                                                <td>12345555</td>
		                                                                <td>07/05/2015</td>
		                                                                <td>기관</td>
		                                                                <td><input type="file"></td>
		                                                            </tr>
		                                                        
		                                                        </tbody>
		                                                    </table>
		                                                </div>
		    
		                                            </div> <!-- end tab-pane -->
		                                            <!-- end about me section content -->
		    
		                                            
		    
		                                            <div class="tab-pane" id="settings">
		                                                <form>
		                                                    <h5 class="mb-4 text-uppercase"><i class="mdi mdi-account-circle me-1"></i> 개인정보</h5>
		                                                    <div class="row">
		                                                        <div class="col-md-6">
		                                                            <div class="mb-3">
		                                                                <label for="memName" class="form-label">이름</label>
		                                                                <input type="text" class="form-control" id="memName" value="${mypageUser.memName}">
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-md-6">
		                                                            <div class="mb-3">
		                                                                <label for="memGender" class="form-label">성별</label>
		                                                                <input type="text" class="form-control" id="memGender" value="${mypageUser.gender}">
		                                                            </div>
		                                                        </div> <!-- end col -->
		                                                    </div> <!-- end row -->
		
		                                                    <div class="row">
		                                                        <div class="col-md-6">
		                                                            <div class="mb-3">
		                                                                <label for="phone" class="form-label">휴대폰 번호</label>
		                                                                <input type="text" class="form-control" id="phone" value="${mypageUser.phone}">
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-md-6">
		                                                            <div class="mb-3">
		                                                                <label for="address" class="form-label">주소</label>
		                                                                <input type="text" class="form-control" id="address" value="${mypageUser.address}">
		                                                            </div>
		                                                        </div> <!-- end col -->
		                                                    </div> <!-- end row -->
		    
		                                                    
		    
		                                                    <div class="row">
		                                                        <div class="col-md-6">
		                                                            <div class="mb-3">
		                                                                <label for="memEmail" class="form-label">이메일</label>
		                                                                <input type="email" class="form-control" id="memEmail" value="${mypageUser.memEmail}">
		                                                                <span class="form-text text-muted"><small>이메일 변경 <a href="#" id="emailCheckLink"> click</a> here.</small></span>
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-md-6">
																												        <div class="mb-3">
		                                                                <label for="memPwd" class="form-label">비밀번호는 아래 버튼을 클릭해 변경해주세요.</label>
		                                                                <input type="button" class="form-control" id="memPwd" value="비밀번호 변경" style="background-color:#f97272; color:white;"> 
		                                                                <input type="hidden" id="memNo" value="${ mypageUser.memNo }">
		                                                            </div>
																												    </div> <!-- end col -->
		                                                    </div> <!-- end row -->
		                                                    
		                                                    
		                                                    <div id="emailCheckModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
							                                            <div class="modal-dialog">
							                                                <div class="modal-content">
							                                                    <div class="modal-header">
							                                                        <h4 class="modal-title">이메일 변경</h4>
							                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							                                                    </div>
							                                                    <div class="modal-body p-4">
							                                                        
							                                                        <div class="row">
							                                                            <div class="col-md-12">
							                                                                <div class="mb-3">
							                                                                    <label for="originMemEmail" class="form-label">기존 이메일</label>
							                                                                    <input type="email" class="form-control" id="originMemEmail"value="${mypageUser.memEmail}" readonly>
							                                                                </div>
							                                                            </div>
							                                                        </div>
							                                                        <div class="row">
							                                                            <div class="col-md-12">
							                                                                <div class="mb-3">
							                                                                    <label for="newMemEmail" class="form-label">변경 이메일</label>
							                                                                    <input type="email" class="form-control" id="newMemEmail" placeholder="변경할 이메일을 입력하세요" required>
							                                                                </div>
							                                                            </div>
							                                                        </div>
							                                                        
							                                                    </div>
							                                                    <div class="modal-footer">
							                                                        <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
							                                                        <button type="button" class="btn waves-effect waves-light" onclick="changeEmail();" style="background-color:#febe98; color:white;">변경</button>
							                                                    </div>
							                                                </div>
							                                            </div>
							                                        </div><!-- /.modal -->
							                                        
							                                        <div id="pwdChangeModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
							                                            <div class="modal-dialog">
							                                                <div class="modal-content">
							                                                    <div class="modal-header">
							                                                        <h4 class="modal-title">비밀번호 변경</h4>
							                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							                                                    </div>
							                                                    <div class="modal-body p-4">
							                                                        
							                                                        <div class="row">
							                                                            <div class="col-md-12">
							                                                                <div class="mb-3">
							                                                                    <label for="newMemPwd" class="form-label">변경 비밀번호(8~15자리 영문,숫자,특수문자 포함)</label>
							                                                                    <input type="email" class="form-control" id="newMemPwd" placeholder="변경할 비밀번호를 입력하세요." required>
							                                                                </div>
							                                                            </div>
							                                                        </div>
							                                                        <div class="row">
							                                                            <div class="col-md-12">
							                                                                <div class="mb-3">
							                                                                    <label for="newMemPwdConfirm" class="form-label">변경 비밀번호 확인</label>
							                                                                    <input type="email" class="form-control" id="newMemPwdConfirm" placeholder="변경할 비밀번호를 다시 한번 입력하세요." required>
							                                                                </div>
							                                                            </div>
							                                                        </div>
							                                                        
							                                                    </div>
							                                                    <div class="modal-footer">
							                                                        <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
							                                                        <button type="button" class="btn waves-effect waves-light" onclick="changePwd();" style="background-color:#febe98; color:white;">변경</button>
							                                                    </div>
							                                                </div>
							                                            </div>
							                                        </div><!-- /.modal -->	
		                                                    
		                                                    
		                                                    
		    
		                                                    <h5 class="mb-3 text-uppercase bg-light p-2"><i class="mdi mdi-office-building me-1"></i> 급여 계좌정보</h5>
		                                                    <div class="row">
		                                                        <div class="col-md-2">
		                                                            <div class="mb-3">
		                                                               <div class="bankselect">
		                                                               		<label for="bankselect" class="form-label">은행명</label>
																								                    	<select class="form-select" id="bankselect" v-model="bankname" aria-label="Default select example">
																								                        <option value="">은행선택</option>
																								                        <option value="004">국민은행</option>
																								                        <option value="020">우리은행</option>
																								                        <option value="088">신한은행</option>
																								                        <option value="003">기업은행</option>
																								                        <option value="023">SC제일은행</option>
																								                        <option value="011">농협은행</option>
																								                        <option value="005">외환은행</option>
																								                        <option value="090">카카오뱅크</option>
																								                        <option value="032">부산은행</option>
																								                        <option value="071">우체국</option>
																								                        <option value="031">대구은행</option>
																								                        <option value="037">전북은행</option>
																								                        <option value="035">제주은행</option>
																								                        <option value="007">수협은행</option>
																								                        <option value="027">씨티은행</option>
																								                        <option value="039">경남은행</option>
																								                    </select>
																								                    
																								                	</div> 
		                                                            </div>
		                                                        </div>
		
		                                                        <div class="col-md-4">
		                                                            <div class="mb-3">
		                                                                <label for="accountNumber" class="form-label">계좌번호</label>
		                                                                <input type="text" class="form-control" id="accountNumber">
		                                                            </div>
		                                                        </div>
		
		                                                        <div class="col-md-2">
		                                                            <div class="mb-3">
		                                                                <label for="accountHolder" class="form-label">예금주</label>
		                                                                <input type="text" class="form-control" id="accountHolder" value="${mypageUser.memName}" readonly>
		                                                            </div>
		                                                        </div>
		                                                        
		                                                        <div class="col-md-4">
		                                                            <div class="mb-3">
		                                                                <label for="accountAuthentication" class="form-label">계좌인증</label>
		                                                                <button class="form-control" id="accountAuthentication" onclick="checkAccount();">계좌 실명 인증</button>
		                                                            </div>
		                                                        </div> <!-- end col -->
		                                                    </div> <!-- end row -->
		                                                    
		                                                
		                                                    
		                                                    
		                                                    
		    
		                                                    <h5 class="mb-3 text-uppercase bg-light p-2"><i class="mdi mdi-earth me-1"></i> SNS</h5>
		                                                    
		                                                    <div class="row">
		                                                        <div class="col-md-6">
		                                                            <div class="mb-3">
		                                                                <label for="social-insta" class="form-label">Instagram</label>
		                                                                <div class="input-group">
		                                                                    <span class="input-group-text"><i class="fab fa-instagram"></i></span>
		                                                                    <input type="text" class="form-control" id="social-insta" placeholder="Url">
		                                                                </div>
		                                                            </div>
		                                                        </div>
		                                                        <div class="col-md-6">
		                                                            <div class="mb-3">
		                                                                <label for="social-lin" class="form-label">Linkedin</label>
		                                                                <div class="input-group">
		                                                                    <span class="input-group-text"><i class="fab fa-linkedin"></i></span>
		                                                                    <input type="text" class="form-control" id="social-lin" placeholder="Url">
		                                                                </div>
		                                                            </div>
		                                                        </div> <!-- end col -->
		                                                    </div> <!-- end row -->
		    
		                                                    <div class="text-end">
		                                                        <button type="submit" class="btn waves-effect waves-light mt-2" style="background-color:#febe98; color:white;"><i class="mdi mdi-content-save"></i> Save</button>
		                                                    </div>
		                                                </form>
		                                            </div>
		                                            <!-- end settings content-->
		    
		                                        </div> <!-- end tab-content -->
		                                    </div>
		                                </div> <!-- end card-->
		
		                            </div> <!-- end col -->
		                        </div>
		                        <!-- end row-->
		
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
                                        <img src="${ contextPath }/assets/images/users/user-10.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${ contextPath }/assets/images/users/user-1.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${ contextPath }/assets/images/users/user-9.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${ contextPath }/assets/images/users/user-2.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${ contextPath }/assets/images/users/user-4.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${ contextPath }/assets/images/users/user-5.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${ contextPath }/assets/images/users/user-6.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${ contextPath }/assets/images/users/user-7.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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
                                        <img src="${ contextPath }/assets/images/users/user-8.jpg" class="rounded-circle avatar-sm" alt="user-pic">
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