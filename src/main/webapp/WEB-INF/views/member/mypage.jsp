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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
		
		
		// 계좌실명 인증
		function checkAccount() {
	    var bankselect = document.getElementById('bankselect').value;
	    var accountNumber = document.getElementById('accountNumber').value;
	    
	    var data = {
	        bank_code: bankselect,
	        bank_num: accountNumber
	    };
	    
	    var contextPath = "${contextPath}";
	    
	    // Ajax 요청
	    fetch(contextPath + "/member/checkAccount", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json"
	        },
	        body: JSON.stringify(data)
	    })
	    .then(function(response) {
	        if (!response.ok) {
	            throw new Error('네트워크 응답이 오지 않습니다.');
	        }
	        return response.json();
	    })
	    .then(function(data) {
	        // 예금주명을 예금주 칸에 기입
	        document.getElementById('accountHolder').value = data.bankHolderInfo;
	        // 알람창으로 예금주명 띄우기
	        alert('예금주명: ' + data.bankHolderInfo + '\n\n확인되었습니다.');
	    })
	    .catch(function(error) {
	        console.error('오류가 발생했습니다', error);
	        alert('계좌 인증에 실패하였습니다.');
	    });
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
            
		           <div class="content"  style="background-color:#F2E8DA;">
		
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
		                                        
		                                        <div class="tab-content">
		    
		                                            <div id="settings">
		                                                <form>
		                                                    <h5 class="mb-3 text-uppercase bg-light p-2"><i class="mdi mdi-account-circle me-1"></i> 개인정보</h5>
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
																								                        <option value="004" ${bankAccount.bankName eq '국민은행' ? 'selected' : ''}>국민은행</option>
																								                        <option value="020" ${bankAccount.bankName eq '우리은행' ? 'selected' : ''}>우리은행</option>
																								                        <option value="088" ${bankAccount.bankName eq '신한은행' ? 'selected' : ''}>신한은행</option>
																								                        <option value="003" ${bankAccount.bankName eq '기업은행' ? 'selected' : ''}>기업은행</option>
																								                        <option value="023" ${bankAccount.bankName eq 'SC제일은행' ? 'selected' : ''}>SC제일은행</option>
																								                        <option value="011" ${bankAccount.bankName eq '농협은행' ? 'selected' : ''}>농협은행</option>
																								                        <option value="005" ${bankAccount.bankName eq '외환은행' ? 'selected' : ''}>외환은행</option>
																								                        <option value="090" ${bankAccount.bankName eq '카카오뱅크' ? 'selected' : ''}>카카오뱅크</option>
																								                        <option value="032" ${bankAccount.bankName eq '부산은행' ? 'selected' : ''}>부산은행</option>
																								                        <option value="071" ${bankAccount.bankName eq '우체국' ? 'selected' : ''}>우체국</option>
																								                        <option value="031" ${bankAccount.bankName eq '대구은행' ? 'selected' : ''}>대구은행</option>
																								                        <option value="037" ${bankAccount.bankName eq '전북은행' ? 'selected' : ''}>전북은행</option>
																								                        <option value="035" ${bankAccount.bankName eq '제주은행' ? 'selected' : ''}>제주은행</option>
																								                        <option value="007" ${bankAccount.bankName eq '수협은행' ? 'selected' : ''}>수협은행</option>
																								                        <option value="027" ${bankAccount.bankName eq '씨티은행' ? 'selected' : ''}>씨티은행</option>
																								                        <option value="039" ${bankAccount.bankName eq '경남은행' ? 'selected' : ''}>경남은행</option>
																								                    </select>
																								                    
																								                	</div> 
		                                                            </div>
		                                                        </div>
		
		                                                        <div class="col-md-4">
		                                                            <div class="mb-3">
		                                                                <label for="accountNumber" class="form-label">계좌번호</label>
		                                                                <input type="text" class="form-control" id="accountNumber" value="${bankAccount.bankAccountNo }">
		                                                            </div>
		                                                        </div>
		
		                                                        <div class="col-md-2">
		                                                            <div class="mb-3">
		                                                                <label for="accountHolder" class="form-label">예금주</label>
		                                                                <input type="text" class="form-control" id="accountHolder" value="${bankAccount.accountHolder }">
		                                                            </div>
		                                                        </div>
		                                                        
		                                                        <div class="col-md-4">
		                                                            <div class="mb-3">
		                                                                <label for="accountAuthentication" class="form-label">계좌인증</label>
		                                                                <button class="form-control" id="accountAuthentication" onclick="checkAccount();" style="background-color:#f97272; color:white;">계좌 실명 인증</button>
		                                                            </div>
		                                                        </div> <!-- end col -->
		                                                    </div> <!-- end row -->
		                                                    
				                                                
		                                                    <h5 class="mb-3 text-uppercase bg-light p-2"><i class="mdi mdi-cards-variant me-1"></i>보유자격증</h5>
					                                                <div class="table-responsive">
								                                            <table class="table table-centered table-nowrap table-striped" id="products-datatable" style="text-align:center">
								                                                <thead>
								                                                    <tr>
								                                                        <th>자격증명</th>
								                                                        <th>발급번호</th>
								                                                        <th>발급일자</th>
								                                                        <th>발급기관</th>
								                                                        <th>증빙자료</th>
								                                                        <th style="width: 85px;">Action</th>
								                                                    </tr>
								                                                </thead>
								                                                <tbody>
								                                                	<c:forEach var="lc" items="${ licenseList }">
								                                                    <tr>
								                                                        
								                                                        <td>
								                                                            ${ lc.licName }
								                                                        </td>
								                                                        <td>
								                                                            ${ lc.licConfirmNo }
								                                                        </td>
								                                                        <td>
								                                                            ${ lc.issuedDate }
								                                                        </td>
								                                                        <td>
								                                                            ${ lc.licAgency }
								                                                        </td>
								                                                        <td>
								                                                        	<input type="file" class="form-control" name="uploadFile">
								                                                        </td>
								                                                        <td>
								                                                            <a href="javascript:void(0);" class="action-icon" data-bs-toggle="modal" data-bs-target="#license-modify-modal-${ lc.licNo }"> <i class="mdi mdi-square-edit-outline"></i></a>
								                                                            <a href="javascript:void(0);" class="action-icon" data-bs-toggle="modal" data-bs-target="#license-delete-modal-${ lc.licNo }"> <i class="mdi mdi-delete"></i></a>
								                                                        </td>
								                                                    </tr>
								                                                   </c:forEach>
								                                                    
								                                                    
								                                                </tbody>
								                                            </table>
								                                        </div>
                                                
		    
		                                                    <div class="text-end">
		                                                        <button type="submit" class="btn waves-effect waves-light mt-2" style="background-color:#febe98; color:white;"><i class="mdi mdi-content-save"></i> 저장</button>
		                                                    </div>
		                                                </form>
		                                            </div>
		                                            <!-- end settings content-->
		                                            
		                                            <!-- 자격증 추가 Modal -->                                     
																								        <div class="modal fade" id="license-add-modal" tabindex="-1" role="dialog" aria-hidden="true">
																								            <div class="modal-dialog modal-dialog-centered">
																								                <div class="modal-content">
																								                    <div class="modal-header bg-light">
																								                        <h4 class="modal-title" id="myCenterModalLabel">자격증 정보 추가</h4>
																								                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
																								                    </div>
																								                    <div class="modal-body p-4">
																								                        <form>
																								                            <div class="row">
																								                            		<div class="col-md-6">
																								                            			  <div class="mb-3">
																																						            <label for="licName" class="form-label">자격증명</label>
																																						            <input type="text" class="form-control" id="licName" required>
																																						        </div>
																																						        <div class="mb-3">
																																						            <label for="issuedDate" class="form-label">발급일자</label>
																																						            <input type="email" class="form-control" id="issuedDate" required>
																																						        </div>
																																						    </div>
																																						    <div class="col-md-6">
																																						    		<div class="mb-3">
																																						            <label for="licConfirmNo" class="form-label">발급번호</label>
																																						            <input type="text" class="form-control" id="licConfirmNo" required>
																																						        </div>
																																						        <div class="mb-3">
																																						            <label for="licAgency" class="form-label">발급기관</label>
																																						            <input type="text" class="form-control" id="licAgency" required>
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
																								        
																								        
																										    <!-- 자격증 수정 Modal -->     
																										    <c:forEach var="lc" items="${ licenseList }">                                
																								        	<div class="modal fade" id="license-modify-modal-${ lc.licNo }" tabindex="-1" role="dialog" aria-hidden="true">
																								            <div class="modal-dialog modal-dialog-centered">
																								                <div class="modal-content">
																								                    <div class="modal-header bg-light">
																								                        <h4 class="modal-title" id="myCenterModalLabel">자격증 정보 수정</h4>
																								                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
																								                    </div>
																								                    <div class="modal-body p-4">
																								                    	
																								                        <form action="${ contextPath }/member/modifyLicense" method="post">
																								                        		<input type="hidden" name="licNo" value="${ lc.licNo }">
																								                            <div class="row">
																								                            		<div class="col-md-6">
																								                            			  <div class="mb-3">
																																						            <label for="licName" class="form-label">자격증명</label>
																																						            <input type="text" class="form-control" name="licName" id="licName" value="${ lc.licName }" required>
																																						        </div>
																																						        <div class="mb-3">
																																						            <label for="issuedDate" class="form-label">발급일자</label>
																																						            <input type="text" class="form-control" name="issuedDate" id="issuedDate" value="${ lc.issuedDate }" required>
																																						        </div>
																																						    </div>
																																						    <div class="col-md-6">
																																						    		<div class="mb-3">
																																						            <label for="licConfirmNo" class="form-label">발급번호</label>
																																						            <input type="text" class="form-control" name="licConfirmNo" id="licConfirmNo" value="${ lc.licConfirmNo }" required>
																																						        </div>
																																						        <div class="mb-3">
																																						            <label for="licAgency" class="form-label">발급기관</label>
																																						            <input type="text" class="form-control" name="licAgency" id="licAgency" value="${ lc.licAgency }" required>
																																						        </div>
																																						    </div>
																																						</div>
																								        
																								                            <div class="text-end">
																								                                <button type="submit" class="btn btn-success waves-effect waves-light" style="background-color: #febe98; border: #febe98;">수정</button>
																								                                <button type="button" class="btn btn-danger waves-effect waves-light" data-bs-dismiss="modal" style="border: none;">취소</button>
																								                            </div>
																								                        </form>
																								                     
																								                    </div>
																								                </div><!-- /.modal-content -->
																								            </div><!-- /.modal-dialog -->
																								        </div><!-- /.modal -->
																								      
						                                            
						                                            
						                                            <div class="modal fade" id="license-delete-modal-${ lc.licNo }" tabindex="-1" role="dialog" aria-hidden="true">
																							            <div class="modal-dialog modal-dialog-centered">
																							                <div class="modal-content">
																							                    <div class="modal-header bg-light">
																							                        <h4 class="modal-title" id="myCenterModalLabel">자격증 정보 삭제</h4>
																							                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
																							                    </div>
																							                    <div class="modal-body p-4">
																							                    
																							                    	<form action="${ contextPath }/member/deleteLicense" method="post">
																							                    	  <input type="hidden" name="licNo" value="${lc.licNo }">
																							                        <p>선택한 자격증 정보를 삭제하시겠습니까?</p>
																							
																							                        <div class="text-end">
																							                            <button type="submit" class="btn btn-success waves-effect waves-light" style="background-color: #febe98; border: #febe98;">삭제</button>
																							                            <button type="button" class="btn btn-danger waves-effect waves-light" data-bs-dismiss="modal" style="border: none;">취소</button>
																							                        </div>
																							                      </form>
																							                    </div>
																							
																							                    
																							                </div><!-- /.modal-content -->
																							            </div><!-- /.modal-dialog -->
																							        </div><!-- /.modal -->
		    																						</c:forEach>
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