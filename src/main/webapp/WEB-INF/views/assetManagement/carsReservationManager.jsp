<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">

<head>
<meta charset="utf-8" />
<title>시설예약 / 법인차량 | Follow me</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />

<!-- App favicon -->
<link rel="shortcut icon" href="${contextPath}/assets/images/favicon.ico">

<!-- Theme Config Js -->
<script src="${contextPath}/assets/js/head.js"></script>

<!-- Bootstrap css -->
<link href="${contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="app-style" />

<!-- App css -->
<link href="${contextPath}/assets/css/app.min.css" rel="stylesheet" type="text/css" />

<!-- Icons css -->
<link href="${contextPath}/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

<style>
	.a.nav-link.active{backgroun-color:#FEBE98;}
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

			
			            <div class="content-page">

                <!-- ========== Topbar Start ========== -->
                <!-- ========== Topbar End ========== -->

                <div class="content">

                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                        		<li class="breadcrumb-item"><a href="javascript: void(0);">FOLLOW ME</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">자산관리</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">차량</a></li>
                                            <li class="breadcrumb-item active">법인차량 예약 관리</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title"><b>법인차량 예약 관리</b></h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->


                        <div class="row">
                            <div class="col-lg-6" style="width:60%">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-uppercase mt-0 mb-3 bg-light p-2"><b>예약 내역</b> | <small>RESERVAION / CANCEL</small></h5>
                                        
                                        <div class="carList" style="border: 1px solid none; width: 100%; height: 720px; box-sizing:border-box;">

                                           <br>

                                           <button type="button" class="btn w-sm btn-light waves-effect" id="excelDownloadButton" onclick="exportSelectedToExcel();">.xlsx 다운로드</button>
                                           <button class="btn btn-danger waves-effect waves-light btn-group" style="background-color: #FFBE98; border: none; margin-left:75%;" 
                                           				 data-bs-toggle="modal" data-bs-target="#reservation-delMobal">삭제</button>
                                           <br><br>
                                            <table class="table table-sm table-bordered" id="reservation-table">
                                            	<thead>  
                                                <tr align="center">
                                                		<th style="width: 20px;">
	                                                    <div class="form-check">
	                                                        <input type="checkbox" id="allCheckBox" class="form-check-input" id="customCheck1">
	                                                        <label class="form-check-label" for="customCheck1">&nbsp;</label>
	                                                    </div>
                                                    </th>
                                                    <th>이용차량</th>
                                                    <th>사용일</th>
                                                    <th colspan="2">사용시간</th>
                                                    <th colspan="2">반납시간</th>
                                                    <th>예약자</th>
                                                    <th>소속부서</th>
                                                    <th>이용사유</th>
                                                </tr>
                                              </thead>
                                              <tbody> 
                                              	<c:forEach var="r" items="${rList}">
                                                <tr align="center">
                                                		<td>
                                                      <div class="form-check">
                                                          <input type="checkbox" class="form-check-input" id="customCheck2">
                                                          <label class="form-check-label" for="customCheck2">&nbsp;</label>
                                                          <input type="hidden" class="form-check-input" id="rsvnNo" value="${r.rsvnNo}">
                                                      </div>
                                                    </td>
                                                    <td>${ r.assetName }</td>
                                                    <td>${ r.rsvnDate }</td>
                                                    <td>${ r.startDivision }</td>
                                                    <td>${ r.startDate }</td>
                                                    <td>${ r.endDivision }</td>
                                                    <td>${ r.endDate }</td>
                                                    <td>${ r.rsvnName }</td>
                                                    <td>${ r.deptName }</td>
                                                    <td>${ r.rsvnContent }</td>
                                                </tr>
                                               </c:forEach> 
                                              </tbody>   
                                            </table>
                                            
                                            <br><br>
                                            
                                            <!--페이징-->
		                                        <ul class="pagination pagination-rounded justify-content-end mb-0">
	                                            <li class="page-item ${ pi.currentPage == 1 ? 'disabled' : '' }">
	                                                <a class="page-link" href="${ contextPath }/asset/carsReservationManager.page?page=${pi.currentPage-1}" aria-label="Previous">
	                                                    <span aria-hidden="true">«</span>
	                                                    <span class="visually-hidden">Previous</span>
	                                                </a>
	                                            </li>
	                                            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                                            <li class="page-item ${ pi.currentPage == p ? 'active' : '' }"><a class="page-link" href="${ contextPath }/asset/carsReservationManager.page?page=${p}">${ p }</a></li>
	                                            </c:forEach>
	                                            
	                                            <li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' }">
	                                                <a class="page-link" href="${ contextPath }/asset/carsReservationManager.page?page=${pi.currentPage+1}" aria-label="Next">
	                                                    <span aria-hidden="true">»</span>
	                                                    <span class="visually-hidden">Next</span>
	                                                </a>
	                                            </li>
                                        		</ul>


                                        </div>

                                        

                                    </div>
                                </div> <!-- end card -->
                            </div> <!-- end col -->

                            <div class="col-lg-6" style="width:40%">
                                
                                <!-- 예약 조회-->
                                <div class="card">
                                    <div class="card-body" id="car-list">
                                        <h5 class="text-uppercase bg-light p-2 mt-0 mb-3"><b>법인차량 목록</b> | <small>COMPANY CAR LIST</small></h5>
                                       
                                        <button type="button" class="btn w-sm btn-success waves-effect waves-light" 
                                                style="background-color: #FFBE98; border: none; margin-left: 87%;" 
                                                data-bs-toggle="modal" data-bs-target="#con-close-modal">추가</button>
                                        <br><br>
                                        <table class="table table-striped table-hover" id="carList">
                                        	<thead>
                                            <tr align="center">
                                                <th>차종</th>
                                                <th>차량번호</th>
                                                <th>탑승인원(명)</th>
                                                <th>비고</th>
                                            </tr>
                                           </thead>
                                           <tbody>
                                            <c:choose>
                                            	<c:when test="${ empty carlist }">
                                            		<tr>
                                            			<td colspan="6">조회된 차량이 없습니다.</td>
                                            		</tr>
                                            	</c:when>
                                            	<c:otherwise>
                                            		<c:forEach var="car" items="${ carlist }">
	                                            		<tr align="center" onclick="detailCar(${car.assetNo});">
	                                                <td>${ car.assetName }</td>
	                                                <td>${ car.carNo }</td>
	                                                <td>${ car.noMem }</td>
	                                                <td>${ car.status }</td>
	                                                </tr>
                                            		</c:forEach>
                                            	</c:otherwise>
                                            </c:choose>
                                           </tbody> 
                                          </table>
                                    </div>
                                </div> <!-- end col-->

                                <!-- 차량 상세조회 / 수정 / 삭제 -->
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-uppercase mt-0 mb-3 bg-light p-2"><b>차량 상세조회</b> | <small>VEHICLEV DETAILED INQUIRY</small></h5>

                                      	<form id="modifyCar">
                                        	<input type="hidden" name="assetNo" id="assetNo" value="">
                                        <table class="table-sm" id="detailC">
                                            <tr>
                                                <th>차종</th>
                                                <td></td>
                                                <td colspan="2">
                                                    <input type="text"class="form-control" id="assetName" name="assetName" value="" required>    
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>차량번호</th>
                                                <td></td>
                                                <td colspan="2">
                                                    <input type="text"class="form-control" id="carNo" name="carNo" value="" required>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>탑승인원(명)</th>
                                                <td></td>
                                                <td colspan="2">
                                                    <input type="text"class="form-control" id="noMem" name="noMem" value="" >    
                                                </td> 
                                            </tr>
                                            <tr>
                                                <th>등록일자</th>
                                                <td></td>
                                                <td colspan="2">
                                                    <input type="date"class="form-control" id="registDate" name="registDate" value="" required>        
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>차량상태</th>
                                                <td></td>
                                                <td colspan="2">
                                                    <div class="form-check-inline">
																										  <label class="form-check-label" for="status">
																										    <input type="radio" class="form-check-input" name="status" value="Y">&nbsp;이용가능
																										  </label>
																										</div>
																										<div class="form-check-inline">
																										  <label class="form-check-label" for="status">
																										    <input type="radio" class="form-check-input" name="status" value="N">&nbsp;이용불가
																										  </label>
																										</div>
                                                </td>
                                            </tr>
                                        </table> 
                                           <br>
                                        	<button type="submit" class="btn w-sm btn-success waves-effect waves-light" 
                                        					style="background-color: #FFBE98; border: none; margin-left: 45%;">수정</button>
                                        	<button type="button" class="btn w-sm btn-light waves-effect" 
                                        	        data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</button>
                                        </form>
                                        </div> <!-- end card -->
                                        
                            
                                    </div> <!-- end col-->
                                </div>
                                <!-- end row -->

                                </div>

                        <!-- end row -->
                        
                    </div> <!-- container -->

                </div> <!-- content -->


            </div>
			
	 <!-- 차량추가 모달 -->
   <div id="con-close-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
       <div class="modal-dialog">
           <div class="modal-content">
                   <div class="modal-header" style="background-color: #FFBE98;">
                       <h4 class="modal-title" style="color:white"><b>법인차량 등록</b></h4>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                   </div>
               <form action="${ contextPath }/asset/insertcar.do" method="post">
                   <div class="modal-body p-4">
                       <div class="row">
                           <div class="col-md-6">
                               <div class="mb-3">
                                   <label for="field-1" class="form-label">차종</label>
                                   <input type="text" class="form-control" id="field-1" name="assetName" required>
                               </div>
                           </div>
                           <div class="col-md-6">
                               <div class="mb-3">
                                   <label for="field-2" class="form-label">차량번호</label>
                                   <input type="text" class="form-control" id="field-2" name="carNo" required placeholder="ex) 111가1111">
                               </div>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-md-12">
                               <div class="mb-3">
                                   <label for="field-3" class="form-label">등록일자</label>
                                   <input type="date" class="form-control" id="field-3" name="registDate" required>
                               </div>
                           </div>
                       </div>
           						<div class="row">
	                       <div class="col-md-4">
	                           <div class="mb-3">
	                               <label for="field-4" class="form-label">탑승인원</label>
	                               <input type="number" class="form-control" id="field-4" name="noMem">
	                           </div>
	                       </div>
	                       <div class="col-md-4">
	                           <div class="mb-3" style="width:200px; margin-top:3px;">
	                             <label for="field-5" class="form-label">비고</label> <br>
	                           		<div class="form-check-inline">
																  <label class="form-check-label" for="status">
																    <input type="radio" class="form-check-input" name="status" value="Y">&nbsp;이용가능
																  </label>
																</div>
																<div class="form-check-inline">
																  <label class="form-check-label" for="status">
																    <input type="radio" class="form-check-input" name="status" value="N">&nbsp;이용불가
																  </label>
																</div>  
	                           </div>
	                       </div>
                      </div>
                   </div>
                   <div class="modal-footer">
                       <button type="submit" class="btn btn-info waves-effect waves-light"
                               style="background-color: #FFBE98; border: none;">등록</button>
                       <button type="button" class="btn w-sm btn-light waves-effect" data-bs-dismiss="modal">닫기</button>
                   </div>
               </form>
           </div>
       </div>
   </div>
   <!-- /.차량추가 모달 끝 -->
   
   
  <!-- 차량삭제 모달 -->
	<div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="staticBackdropLabel">법인차량 삭제</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            삭제하시면 정보를 다시 불러올 수 없습니다. <br>
            선택하신 차량을 삭제하시겠습니까? 
        </div>
        <div class="modal-footer">
            <button type="button" class="btn w-sm btn-light waves-effect" data-bs-dismiss="modal">취소</button>
            <button type="button" id="deletebtn"class="btn btn-primary" 
                    style="background-color: #FFBE98; border: none;">삭제</button>
        </div>
      </div>
    </div>
	</div>
	<!-- 차량 삭제 모달 -->
   
  <!-- 선택예약 삭제 모달 -->
	<div id="reservation-delMobal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="standard-modalLabel">예약내역 삭제</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>삭제하시면 정보를 다시 불러올 수 없습니다.</p>
                <p>선택하신 이용내역을 삭제하시겠습니까?</p></div>
            <div class="modal-footer">
                <button type="button" class="btn w-sm btn-light waves-effect" data-bs-dismiss="modal">취소</button>
                <button type="button" id="reservation-delBtn" class="btn btn-primary" 
                        style="background-color: #FFBE98; border: none;">삭제</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
	<!-- 선택예약 삭제 모달 -->
   
   
   

	<script>
	
			// 체크박스 일괄 선택
			$(document).on('click', '#allCheckBox', function() {
		    if($(this).prop("checked")) {
		        $("input[type=checkbox]").prop("checked",true);
		    } else {
		        $("input[type=checkbox]").prop("checked",false);
		    }
			});
			
			
			// 엑셀 다운로드
			var contextPath = "${ contextPath }";
			
			function exportSelectedToExcel() {
				// 선택한 요소의 데이터를 담을 배열 생성
				var selectedData = [];
				
				// 데이블 요소 선택 
				var table = document.getElementById("reservation-table");
				
				// 테이블의 체크된 체크박스 요소를 찾아서 선택한 행의 데이터를 수집
				var checkboxes = table.querySelectorAll('input[type="checkbox"]:checked');
				 checkboxes.forEach(function(checkbox) {
					 var row = checkbox.closest('tr');
					 var rowData = [];
						
				// 각 행의 셀 데이터를 수집하여 배열에 추가
	        for (var j = 0; j < row.cells.length; j++) {
	            rowData.push(row.cells[j].innerText.trim());
	        }
						
       // 선택한 행의 데이터 배열을 전체 데이터 배열에 추가
          selectedData.push(rowData);
      });
				
				// 선택한 데이터를 서버로 전송하여 엑셀 파일 생성 요청
			  sendSelectedDataToServer(selectedData);
			}
			
			 function sendSelectedDataToServer(selectedData){
				// 서버로 선택한 데이터를 전송하여 엑셀 파일 생성 요청
				fetch(contextPath + '/asset/excelDownload', {
           method: 'POST',
           headers: {
               'Content-Type': 'application/json'
           },
           body: JSON.stringify(selectedData)
       })
       .then(response => response.blob())
			 .then(blob => {
					// 엑셀 파일 다운로드 링크 생성
					var url = window.URL.createObjectURL(blob);
          var a = document.createElement('a');
          a.href = url;
					a.download = 'mileage_logbook.xlsx';
					document.body.appendChild(a);
          a.click();
          window.URL.revokeObjectURL(url);
				})
				.catch(error => console.error('Error:', error));
			}
			
			 
			// 법인차량 예약 내역 삭제
			$("#reservation-delBtn").on("click", function(){
					
				var checkedRsvn = [];
				// 체크된 목록들을 담기
				$("#reservation-table tbody input[type=checkbox]:checked").each(function(){
						var rsvnNo = $(this).closest("tr").find("#rsvnNo").val();
						checkedRsvn.push(rsvnNo);
						console.log(checkedRsvn);
				});
				
				if(checkedRsvn == null || checkedRsvn.length == 0){
					$('#reservation-delMobal').modal('hide');
					alert("선택된 내용이 없습니다.");
					return;
				}
				
				// 계속 값을 넘기는데에 있어 오류가 나서 string으로 엮어서 넘기기
				var checkedRsvnStr = checkedRsvn.join(",");
				
				$.ajax({
					url:"${contextPath}/asset/deletersvn.do",
					type:"post",
					data:{checkedRsvnStr:checkedRsvnStr},
					success:function(result){
						console.log(result);
						if(result>0){
							$('#reservation-delMobal').modal('hide');
							alert("선택하신 예약내역이 삭제되었습니다.");
							location.reload();
						}else{
							$('#reservation-delMobal').modal('hide');							
							alert("차량삭제에 실패하였습니다.");
						}
						
						
					},
					error:function(){

					}
				})
			})
			
			 
			 
			 
	
	
			// 차량상세조회
			function detailCar(no){
				$.ajax({
					url: "${contextPath}/asset/detailCar.do",
					type:"post",
					data: {no:no},
					success:function(ad){
						console.log(ad);
					
						$("#modifyCar input[name='assetNo']").val(ad.assetNo); // assetNo
						$("#detailC input[name='assetName']").val(ad.assetName); // 차종
						$("#detailC input[name='carNo']").val(ad.carNo); // 차량번호
						$("#detailC input[name='noMem']").val(ad.noMem); // 탑승인원
						
						// 등록일자 => Date로 년,월,일 추출하기 console.log로 찍었을때 1644073200000 이런식으로 출력됨
						let date = new Date(ad.registDate);
						
						let year = date.getFullYear();
						let month = ('0' + (date.getMonth()+1)).slice(-2); // 월은 0부터 시작이라 +1, 끝자리부터 2자리 추출
						let day = ('0' + date.getDate()).slice(-2);
						let registDt = year + '-' + month + '-' + day;
						
						$("#detailC input[name='registDate']").val(registDt); 
						
						// 차량상태
						const statusYN = ["Y","N"];
							$("#detailC input[name='status']").each(function(index, el){
								let radioVal = $(el).val();
								if(statusYN.includes(radioVal)){
									if(ad.status == radioVal){
										$(el).prop("checked", true);
									}else{
										$(el).prop("checked", false);
									}
								}
							})
							
						},
					error:function(){
						console.log("ajax통신 실패");
						}
				})
			}
			
		
			
			// 차량 등록정보 수정
			$("#modifyCar").submit(function(event){
			
				event.preventDefault();  // submit 바로 넘어가지 않도록 설정
				
				// form에 담겨있는 데이터가 모두 담기게됨 FormData{}
				let formData = new FormData(this);  
				
				$.ajax({
						url:"${contextPath}/asset/modifycar.do",
						type:"post",
						data:formData,
						processData:false,
						contentType:false,
						success:function(result){
							
							console.log(result);
							
							if(result>0){
								location.reload();
								alert("차량정보가 수정 되었습니다.");
							}else{
								alert("차량정보 수정에 실패하였습니다.");
							}
							
						},
						error:function(){
							console.log("차량정보 수정 ajax 통신 실패");
						}
				})
			})
			
			
			
			// 차량 삭제
			$("#deletebtn").on("click", function(){
				
				 var assetNo = $("#assetNo").val();
				
				$.ajax({
					
					url:"${contextPath}/asset/deletecar.do",
					type:"get",
					data:{no:assetNo},
					success:function(result){
						console.log(result);
						if(result>0){
							$('#deleteModal').modal('hide');
							location.reload();
							
							alert("선택하신 차량이 삭제되었습니다.");
							
						}else{
							alert("차량삭제에 실패하였습니다.");
						}
					},
					error:function(){
						consloe.log("차량 삭제 ajax 통신실패");
					}
				})
			})
			
			
			

	</script>












      <!-- ============================================================== -->
      <!-- <-- End Page Content
      <!-- ============================================================== -->
      
      

		</div>
	</div>
	
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

        <!-- Vendor js -->
        <script src="${contextPath}/assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="${contextPath}/assets/js/app.min.js"></script>
        
        <!-- Plugins js-->
        <script src="${contextPath}/assets/libs/flatpickr/flatpickr.min.js"></script>
        <script src="${contextPath}/assets/libs/selectize/js/standalone/selectize.min.js"></script>

        <!-- Dashboar 1 init js-->
	
</body>
</html>