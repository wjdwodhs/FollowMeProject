<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">

<head>
<meta charset="utf-8" />
<title>예약페이지 | Follow me</title>
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
.seatingNum td:hover {
  background-color: #FEBE98 !important;
  cursor: pointer; 
}

.content-page .allday { 
    background-color: #DDDDDD !important;
    pointer-events: none;
}
.content-page .morning { 
     background-color: #FFF8C9 !important;
     pointer-events: none;
}
.content-page .afternoon { 
     background-color: #DFCCFB !important;
     pointer-events: none;
}

.content-page .myreservation { 
		background-color: #FEBE98 !important;
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
	

	
	    <div class="content" style="background-color: #F2E8DA;">
	
	        <!-- Start Content-->
	        <div class="container-fluid" style="background-color: #F2E8DA;">
	            
	            <!-- start page title -->
	            <div class="row">
	                <div class="col-12">
	                    <div class="page-title-box">
	                        <div class="page-title-right">
	                            <ol class="breadcrumb m-0">
                                  <li class="breadcrumb-item"><a href="javascript: void(0);">FOLLOW ME</a></li>
                                  <li class="breadcrumb-item"><a href="javascript: void(0);">자산관리</a></li>
                                  <li class="breadcrumb-item"><a href="javascript: void(0);">좌석</a></li>
                                  <li class="breadcrumb-item active">사무실 좌석 예약</li>
                              </ol>
	                        </div>
	                        <h4 class="page-title"><b>사무실 좌석 예약</b></h4>
	                    </div>
	                </div>
	            </div>
	            <!-- end page title -->
	
	
	            <div class="row">
	                <div class="col-lg-6">
	                    <div class="card">
	                        <div class="card-body">
	                            <h5 class="text-uppercase bg-light p-2 mt-0 mb-3"><b>사무실 좌석배치도</b> | <small> Seating Chart</small></h5>
	                            
	                            <div style="border: 1px solid lightgray; width: 100%; height: 700px; box-sizing:border-box;">
	
	                                <div style=" height: 10%; display: flex; align-items: center; justify-content: space-evenly; box-sizing:border-box;">
	                                    <div style="border: 3px solid black; width: 40%; height: 30%; "></div>
	                                    <div style="border: 3px solid black; width: 40%; height: 30%;"></div>
	                                </div>
	                            
	                                <div style="height: 90%; display: flex; box-sizing:border-box;">
	                                    <div style=" width: 40%; box-sizing:border-box;">
	                                        <div style="height: 80%; box-sizing:border-box; ">
	                                            <div style="border: 3px solid black; height: 300px; width: 200px; margin: auto; margin-top: 20%; ">
	                                               <table class="table table-bordered seatingNum" style="width: 100%; height: 100%; border: 1px solid black; text-align: center; color: black; font-size: large;">
	                                                    <tr>
	                                                        <td>01</td>
	                                                        <td>02</td>
	                                                    </tr>
	                                                    <tr>
	                                                        <td>03</td>
	                                                        <td>04</td>
	                                                    </tr>
	                                                    <tr>
	                                                        <td>05</td>
	                                                        <td>06</td>
	                                                    </tr>
	                                                </table>                    
	                                            </div>
	                                        </div>
	                            
	                                        <div style="height: 20%; box-sizing:border-box;">
	                                            <div style="border: 3px solid black; height: 20%; width: 80%; margin: auto; margin-top: 10%; box-sizing:border-box; text-align: center;"><b>입구</b></div>
	                                        </div>
	                                    </div>
	                            
	                                    <div style="width: 40%; box-sizing:border-box;">
	                                        <div style="border: 3px solid black; height: 200px; width: 80%; margin: auto; margin-top: 20%;" >
	                                            <table class="table table-bordered seatingNum" style="width: 100%; height: 100%; border: 1px solid black; text-align: center; color: black; font-size: large;">
	                                                <tr>
	                                                    <td>07</td>
	                                                    <td>08</td>
	                                                </tr>
	                                                <tr>
	                                                    <td>09</td>
	                                                    <td>10</td>
	                                                </tr>
	                                            </table>  
	                                        </div>
	                                    </div>
	                            
	                                    <div style=" width: 40% ">
	                                        <div style=" height: 50%; box-sizing:border-box;">
	                                            <div style="border: 3px solid black; height: 200px; width: 80%; margin: auto; margin-top: 20%; ">         
	                                                <table class="table table-bordered seatingNum" style="width: 100%; height: 100%; border: 1px solid black; text-align: center; color: black; font-size: large;">
	                                                    <tr>
	                                                        <td>11</td>
	                                                        <td>12</td>
	                                                    </tr>
	                                                    <tr>
	                                                        <td>13</td>
	                                                        <td>14</td>
	                                                    </tr>
	                                                </table>  </div>    
	                                        </div>
	                            
	                                        <div style="height: 50% ">
	                                            <div style="border: 3px solid black; height: 200px; width: 80%; margin: auto; margin-top: 20%; ">
	                                                <table class="table table-bordered seatingNum" style="width: 100%; height: 100%; border: 1px solid black; text-align: center; color: black; font-size: large;">
	                                                    <tr>
	                                                        <td>15</td>
	                                                        <td>16</td>
	                                                    </tr>
	                                                    <tr>
	                                                        <td>17</td>
	                                                        <td>18</td>
	                                                    </tr>
	                                                </table>  
	                                            </div>
	                                        </div>
	                                    </div>
	                            
	                                </div>
	                            
	                            </div>
	
	
	                        </div>
	                    </div> <!-- end card -->
	                </div> <!-- end col -->
	
	                <div class="col-lg-6">
	                    
	                <!-- 예약 조회-->
                  <form action="">
                      <div class="card">
                          <div class="card-body">
                              <h5 class="text-uppercase mt-0 mb-3 bg-light p-2"><b>예약 조회</b> | <small> RESERVATION INQUIRY</small></h5>

                              <!-- Preview -->
                              <div class="dropzone-previews mt-3" id="file-previews">
                                  
                                  <div style="display: flex; justify-content: center;">
                                      <div>
                                          <label for="reservationDate" style="margin-right: 5px;">희망예약일</label>
                                          <input type="date" name="rsvnDate" id="reservationDate" min="" style="border: 0.5px solid lightgray; border-radius: 3px; color: gray;">
                                      </div>
                                  </div>
                                  
                                  <br><br>
                                  <div style="display: flex; justify-content: center;">

                                      <div style="border:none; background-color: #FFF8C9; width: 50px; height: 50px; margin-right: 12px;"> </div> 
                                      <label style="margin-top: 5px;">&nbsp;&nbsp;&nbsp;오전<br> 이용가능 </label> <br>
                                      <label id="afternoon-label" style="margin-top: 5px;"><br> (<b>n</b>석) </label>
                                      
                                      <div style="border:none; background-color: #DFCCFB; width: 50px; height: 50px; margin-right: 12px; margin-left: 10px;"> </div> 
                                      <label style="margin-top: 5px;">&nbsp;&nbsp;&nbsp;오후<br> 이용가능 </label> <br>
                                      <label id="morning-label" style="margin-top: 5px;"><br> (<b>n</b>석) </label>
                                      
                                      <div style="border:none; background-color: lightgray; width: 50px; height: 50px; margin-right: 12px; margin-left: 15px;"></div>
                                      <label style="margin-top: 12px;">이용불가</label>
                                      <label id="allday-label" style="margin-top: 12px;"> (<b>n</b>석)</label>

                                  </div>
                                  <br><br>
                              </div>

                              <button type="button" class="btn w-sm btn-success waves-effect waves-light" id='selectListSeat-btn' 
                                      style="background-color: #FFBE98; border: none; margin-left: 45%;">조회</button>
                      
                          </div>
                      </div> <!-- end col-->
                  </form>

			            <!-- 예약 신청 -->
			            <div class="card">
			                <div class="card-body">
			                    <h5 class="text-uppercase mt-0 mb-3 bg-light p-2"><b>예약 신청</b> | <small> RESERVATION</small></h5>
			
			                    <div class="mb-3">
			                        <form id="insertReservation-form">
			                            <table class="table-sm"  style="margin-left: 20px;">
			                                <tr>
			                                    <th>예약자명</th>
			                                    <td style="width: 150px;">
			                                        <input type="text" name="rsvnName" value="${loginUser.memName}" class="form-control" style="height: 30px;" readonly>    
			                                    </td>
			                                    <th>소속부서</th>
			                                    <td  style="width: 150px;">
			                                        <input type="text" name="deptName" value="${ loginUser.deptName }" class="form-control" style="height: 30px;" readonly  >     
			                                    </td>
			                                </tr>
			                                <tr>
			                                    <th>희망예약일</th>
			                                    <td>
			                                     <input type="date" id="rsvnDate-input" name="rsvnDate" min="" style="border: 0.5px solid lightgray; border-radius: 3px; color: gray; height: 30px;">
			                                    </td>
			                                    <th>선택좌석</th>
			                                    <td>
			                                        <select class="reservation-select" name="assetName" required style="border: 0.5px solid lightgray; border-radius: 3px; height: 30px; width: 80px; color: gray;">
			                                            <option value="01">01</option>
			                                            <option value="02">02</option>
			                                            <option value="03">03</option>
			                                            <option value="04">04</option>
			                                            <option value="05">05</option>
			                                            <option value="06">06</option>
			                                            <option value="07">07</option>
			                                            <option value="08">08</option>
			                                            <option value="09">09</option>
			                                            <option value="10">10</option>
			                                            <option value="11">11</option>
			                                            <option value="12">12</option>
			                                            <option value="13">13</option>
			                                            <option value="14">14</option>
			                                            <option value="15">15</option>
			                                            <option value="16">16</option>
			                                            <option value="17">17</option>
			                                            <option value="18">18</option>
			                                        </select>  
			                                    </td>
			                                </tr>
			                                <tr>
			                                    <th>예약시간</th>
			                                    <td colspan="3">
			                                        <select class="reservation-select" name="rsvnTime" required style="border: 0.5px solid lightgray; border-radius: 3px; height: 30px; color: gray;">
			                                            <option value="09:00~18:00">종일 [ 09 : 00 ~ 18 : 00 ]</option>
			                                            <option value="09:00~14:00">오전 [ 09 : 00 ~ 14 : 00 ]</option>
			                                            <option value="14:00~18:00">오후 [ 14 : 00 ~ 18 : 00 ]</option>
			                                        </select> 
			                                    </td>
			                                </tr>
			                                <tr>
			                                    <th>코멘트</th>
			                                    <td colspan="3">
			                                        <input type="text" class="form-control" name="rsvnContent" id="product-meta-keywords" placeholder="(선택) 특이사항이 있을시 작성해주세요.">
			                                    </td>
			                                </tr>
			                            </table>
			                        
			                            <br><br>
			
			                            <div class="text-center mb-3">
			                                <button type="submit" class="btn w-sm btn-success waves-effect waves-light" 
			                                        style="background-color: #FFBE98; border: none;">예약</button>
			                            </div>
			
			                        </form>
			                    
			
			
			                    
			                    </div> <!--  end card -->
			                    
			        
			                </div> <!-- end col-->
			            </div>
			            <!-- 예약신청 end row -->    
	          	</div> <!-- container -->
				            <!-- end row -->
				    </div> <!-- content -->
				</div>
	            
			</div>
	</div>		
	</div>
					
	<!-- 자리 예약 조회 모달 -->
  <div id="seatReservation" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
      <div class="modal-dialog">
          <div class="modal-content">
              <div class="modal-header">
                  <h4 class="modal-title"><b>예약 조회</b></h4>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body p-4">
                  <div class="row">
                      <div class="col-md-6">
                          <div class="mb-3">
                              <label for="field-1" class="form-label"><b>이름</b></label>
                              <input type="text" class="form-control" id="field-1" value="" readonly>
                              <input type="hidden" id="field-3">
                          </div>
                      </div>
                      <div class="col-md-6">
                          <div class="mb-3">
                              <label for="field-2" class="form-label"><b>소속부서</b></label>
                              <input type="text" class="form-control" id="field-2" readonly>
                          </div>
                      </div>
                  </div>
                  <div class="row">
                  	<div class="col-md-4">
                          <div class="mb-3">
                              <label for="field-6" class="form-label"><b>선택좌석</b></label>
                              <input type="text" class="form-control" id="field-6" readonly>
                          </div>
                      </div>
                  </div>
                  <div class="row">
                      <div class="col-md-4">
                          <div class="mb-3">
                              <label for="field-4" class="form-label"><b>예약일</b></label>
                              <input type="text" class="form-control" id="field-4" readonly>
                          </div>
                      </div>
                      <div class="col-md-4">
                          <div class="mb-3">
                              <label for="field-5" class="form-label"><b>예약시간</b></label>
                              <input type="text" class="form-control" id="field-5" readonly style="width:200px">
                          </div>
                      </div>
                      
                  </div>
                  <div class="row">
                      <div class="col-md-12">
                          <div class="">
                              <label for="field-7" class="form-label"><b>코멘트</b></label>
                              <input type="text" class="form-control" id="field-7" readonly>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="modal-footer">
                   <!-- 예약한 직원 본인일 경우 보일 버튼 -->
                  <button type="button" class="btn w-sm btn-light waves-effect" id="reservationSeat-delMobal-btn"
                  				style="background-color: #FFBE98; color:white; border: none;"
                  				data-bs-toggle="modal" data-bs-target="#reservationSeat-delMobal">예약취소</button>
                  
                  <button type="button" class="btn btn-light waves-effect" data-bs-dismiss="modal">확인</button>
              </div>
          </div>
      </div>
  </div><!-- /.modal -->
	
	<!-- 선택예약 삭제 모달 -->
	<div id="reservationSeat-delMobal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="standard-modalLabel">예약내역 취소</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>삭제하시면 정보를 다시 불러올 수 없습니다.</p>
                <p>선택하신 예약을 삭제하시겠습니까?</p></div>
            <div class="modal-footer">
                <button type="button" class="btn w-sm btn-light waves-effect" data-bs-dismiss="modal">취소</button>
                <button type="button" id="seatReservation-delbtn" class="btn btn-primary" 
                        style="background-color: #FFBE98; border: none;">삭제</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
	<!-- 선택예약 삭제 모달 -->
	
	
	

	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>		
		
		$(document).ready(function(){
			// 예약조회,신청 다음날만 조회 가능하도록
				var tomorrow = new Date();
				tomorrow.setDate(tomorrow.getDate() + 1);
				var maxDate = new Date();
				maxDate.setDate(maxDate.getDate() + 3);
				
				var tomorrowStr = tomorrow.toISOString().split('T')[0];
				var maxDateStr = maxDate.toISOString().split('T')[0];
				
			$('input[type=date]').each(function(){
				$(this).val(tomorrowStr);
				$(this).attr('min', tomorrowStr);
				$(this).attr('max', maxDateStr);
			})

		
			// 예약 조회
			$("#selectListSeat-btn").on("click", function(){
				 var rsvnDate = $("#reservationDate").val();
				$.ajax({
					url:"${contextPath}/asset/selectlistseat.do",
					type:"get",
					data:{rsvnDate : rsvnDate},
					success:function(rlist){
						
						var allDayCount = 0;
						var morningCount = 0;
						var afternoonCount = 0;
						
						console.log(rlist);
						
						// 모든 좌석 초기화
						$(".seatingNum td").removeClass("myreservation allday morning afternoon");
						
						// 좌석배치도에 예약 표시
						rlist.forEach(function(r){
							$(".seatingNum td").each(function(){	
								if($(this).text() == r.assetName ){
									var startHour = parseInt(r.startDate.split(':')[0]);
									var endHour = parseInt(r.endDate.split(':')[0]);
									
									if('${loginUser.memName}' == r.rsvnName){
											$(this).addClass("myreservation");
									}else{
										if(startHour == 9 && endHour == 6){
											$(this).addClass("allday");
											allDayCount++;
											
										}else if(startHour == 9 && endHour == 2){
											$(this).addClass("morning");
											morningCount++;
											
										}else if(startHour == 2 && endHour == 6){
											$(this).addClass("afternoon");
											afternoonCount++;
										}else{
											$(this).addClass("allday");
											allDayCount++;
										}
									}
								}
							})

						})
						
						$("#allday-label").html( " (" + "<b>" + allDayCount + "</b>" + " 석)");
						$("#morning-label").html("<br>" + " (" + "<b>" + morningCount + "</b>" + " 석)");
						$("#afternoon-label").html("<br>" +  " (" + "<b>" + afternoonCount + "</b>" + " 석)");
						
						// 자리 클릭시 예약 상세 조회
						$(".seatingNum td").click(function() {
							let no = $(this).text();
							let found = false;
							let loginUser = '${loginUser.memName}';
							
							for(let i=0; i<rlist.length; i++){
								if(rlist[i].assetName == no && loginUser == rlist[i].rsvnName){
									$("#field-6").val(no);
									$("#field-1").val(rlist[i].rsvnName);
									$("#field-2").val(rlist[i].deptName);
									$("#field-3").val(rlist[i].rsvnNo);
									$("#field-4").val(rlist[i].rsvnDate);
									$("#field-5").val(rlist[i].startDivision + rlist[i].startDate + ' ~ ' + rlist[i].endDivision + rlist[i].endDate);
									$("#field-7").val(rlist[i].rsvnContent);
									found = true;

									break;
								}
							}
							if(!found){
								$("#field-6").val(no);
								$("#field-1").val('');
								$("#field-2").val('');
								$("#field-4").val('');
								$("#field-5").val('');
								$("#field-7").val('');
							}
						$("#seatReservation").modal("show");
						
					})			
					},
					error:function(){
						console.log("예약조회 ajax통신실패");
					}
				})
			})	
			
		})
		
		
		
		// 좌석 예약
		$("#insertReservation-form").submit(function(event){
			event.preventDefault()
			
			var formData = $(this).serializeArray(); // 폼데이터 직렬화
			
			var rsvnDate = formData.find(item => item.name == 'rsvnDate').value // 선택한 예약값
			var rsvnTime = formData.find(item => item.name == 'rsvnTime').value // 선택한 예약시간
			
			// 예약 날짜 분할
			var [year, month, day] = rsvnDate.split('-');
			
			// 예약 시간 추출
			var [startHour, endHour] = rsvnTime.split('~').map(time => parseInt(time.trim().split(':')[0]));
			var startDivision = startHour < 12 ? '오전' : '오후';
			var endDivision = endHour < 12 ? '오전' : '오후';
			
			var startDate = year + '-' + month + '-' + day + ' ' + startHour.toString().padStart(2,'0');
			var endDate = year + '-' + month + '-' + day + ' ' + endHour.toString().padStart(2,'0');
			
			// formData에 속성 추가
			formData.push({name:'startDivision', value:startDivision});
			formData.push({name:'endDivision', value:endDivision});
			formData.push({name:'startDate', value:startDate});
			formData.push({name:'endDate', value:endDate});
			
			// 폼 데이터 객체로 변환
			var data = {};
			formData.forEach(function(item){
				data[item.name] = item.value;
			});
			
			$.ajax({
				url: "${contextPath}/asset/insertrsvnseat.do",
				type:"post",
				data: JSON.stringify(data),
				dataType: "json",
				contentType:"application/json; charset=utf-8",
				success:function(result){
					
					if(result > 0){
						alert("선택좌석 예약에 성공하였습니다.");
					}else{
						alert("선택좌석에 실패하였습니다. 예약정보를 다시 확인해주세요.");
					}
					
					location.reload();
					
				},
				error:function(xhr, textStatus, errorThrown){
		            if (xhr.status === 409) {
		                alert("이미 예약이 존재합니다. 예약정보를 확인하시고 다시 시도해주세요.");
		            } else {
		                console.error("좌석 예약 ajax 통신 실패");
		                alert("예약이 중복 되었습니다. 예약정보를 확인하시고 다시 예약해주세요.");
		            }
				}
			})
			
		})
		
		// 예약 삭제
		$(document).ready(function(){
			$("#seatReservation-delbtn").on("click", function(){
				var rsvnNo = $("#field-3").val();
				location.href = "${contextPath}/asset/deletereservationseat.do?no=" + rsvnNo;
				
			})
		})
		
	</script>


	






      <!-- ============================================================== -->
      <!-- <-- End Page Content
      <!-- ============================================================== -->
	
        
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