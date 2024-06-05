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
.content-page .a.nav-link.active { background-color: #FEBE98; }

.content-page .searchListSeat { 
    background-color: lightgray !important;
}

.content-page .seatingNum td:hover {
    background-color: #FFA74F !important;
    cursor: pointer;
}

.content-page .no-hover{
		background-color : inital !important;
		cursor:default !important;
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
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">좌석</a></li>
                                            <li class="breadcrumb-item active">사무실 좌석 예약</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title"><b>사무실 좌석</b></h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->


                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-uppercase bg-light p-2 mt-0 mb-3"><b>사무실 좌석배치도</b> | <small> Seating Chart</small></h5>
                                        <form id="searchList-seat">
	                                        <label style="margin-left: 30%; margin-right: 5px;"><b>예약조회</b></label>
	                                        <input type="date" name="rsvnDate" style="border: 0.5px solid lightgray; border-radius: 3px;">
	                                        <button type="button" id="searchListSeat-Btn" class="btn btn-primary btn-sm" 
	                       												  style="background-color: #FFBE98; border: none;">조회</button>
                                        </form>
                                        <br><br>
                                        
                                        <div style="border: 1px solid lightgray; width: 100%; height: 700px; box-sizing:border-box;">

                                            <div style=" height: 10%; display: flex; align-items: center; justify-content: space-evenly; box-sizing:border-box;">
                                                <div style="border: 3px solid black; width: 40%; height: 30%; "></div>
                                                <div style="border: 3px solid black; width: 40%; height: 30%;"></div>
                                            </div>
                                        
                                            <div style="height: 90%; display: flex; box-sizing:border-box;">
                                                <div style=" width: 40%; box-sizing:border-box;">
                                                    <div style="height: 80%; box-sizing:border-box; ">
                                                        <div style="border: 3px solid black; height: 300px; width: 200px; margin: auto; margin-top: 20%; ">
                                                            <table class="table table-bordered seatingNum" id="seatingNum" style="width: 100%; height: 100%; border: 1px solid black; text-align: center; color: black; font-size: large;">
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
                                                        <table class="table table-bordered seatingNum" id="seatingNum" style="width: 100%; height: 100%; border: 1px solid black; text-align: center; color: black; font-size: large;">
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
                                                            <table class="table table-bordered seatingNum" id="seatingNum" style="width: 100%; height: 100%; border: 1px solid black; text-align: center; color: black; font-size: large;">
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
                                                            <table class="table table-bordered seatingNum" id="seatingNum" style="width: 100%; height: 100%; border: 1px solid black; text-align: center; color: black; font-size: large;">
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
                                
                            		<!-- 상태 설정 -->
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-uppercase mt-0 mb-3 bg-light p-2"><b>자리 상태 설정 </b> | <small> Seat setting </small></h5>
                                        	<form action="updateSeatStatus">
                                            <label style="margin-left:25%; color:lightgray;"><h5><b>변경일<b></h5></label>
                                            <input type="date" name="modifyDate" id="modifyDate" style="border: 0.5px solid lightgray; border-radius: 3px; margin-right: 15px;  margin-left: 10px;" required>
                                            <br><br>
                                            <table align="center">
                                                <tr>
                                                    <th>선택 좌석 </th>
                                                    <td><input type="text" class="form-control" id="seat-no" name="seat-no" style="width:90px; height:30px; margin-right: 10px;  margin-left: 10px;" required></td>
                                                    <th>이용상태</th>
                                                    <td>
                                                        <select class="reservation-select" name="seat-status" required style="border: 0.5px solid lightgray; border-radius: 3px; height: 30px; color: gray; margin-left: 15px;">
                                                            <option value="Y">이용가능</option>
                                                            <option value="N">이용불가</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>

                                        <br><br>

                                        <div class="text-center mb-3">
                                        <button type="button" class="btn w-sm btn-success waves-effect waves-light" id="statusModify-btn" 
                                                style="background-color: #FFBE98; border: none;"
                                                data-bs-toggle="modal" data-bs-target="#seatStatusModify-modal" disabled>변경</button>
                                        </div>
                                        </form>
                                    </div>
                                </div> <!-- end col-->


                                <!-- 예약 상세조회 -->
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-uppercase mt-0 mb-3 bg-light p-2"><b>예약 상세조회</b> | <small> Reservation details inquiry </small></h5>

                                        <div class="mb-3">
                                            <form id="detailSeat">
                                                <table class="table table-sm" id="reservationList-table" style="margin-left: 10px;">
                                                	<thead>    
                                                    <tr align="center">
                                                        <th>예약자명</th>
                                                        <th>소속부서</th>
                                                        <th>선택좌석</th>
                                                        <th>예약일자</th>
                                                        <th>예약시간</th>
                                                        <th>코멘트</th>
                                                		</tr>
                                                	</thead>
                                                	<tbody>
                                                	
                                                	</tbody>
                                                </table>

                                            </form>
                                                <br><br>
                                        


                                        
                                        </div> <!--  end card -->
                                        
                            
                                    </div> <!-- end col-->
                                </div>
                                <!-- end row -->

                                </div>
                        <!-- end row -->

                        
                    </div> <!-- container -->

                </div> <!-- content -->

            </div>
		
	<!-- 선택좌석 선택 변경 모달-->
	<div id="seatStatusModify-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="standard-modalLabel">좌석 상태 변경</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>좌석번호 &nbsp<label id="seat-no-label"></label>의 
                   상태를 변경하시겠습니까? <br><br>
                   <small>* 이미 지난 날짜의 상태는 변경이 불가합니다.</small>
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn w-sm btn-light waves-effect" data-bs-dismiss="modal">취소</button>
                <button type="button" id="updateSeat-Btn" class="btn btn-primary" 
                        style="background-color: #FFBE98; border: none;">확인</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
	<!-- 선택좌석 선택 변경 모달 end -->
			
			
			
			
	<!-- ------------------------------ script -------------------------------------------- -->		
			
			
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>	
	
		
		// 좌석 클릭하면 자리 상태 설정에 좌석 번호 표시
		$(".seatingNum td").on("click",function() {
			let no = $(this).text();
			$("#seat-no").val(no);
			console.log(no);
			$("#seat-no-label").html('<b>' + no + '</b>');
		})
		
		
		// 상태변경은 이전날짜 선택 안되도록
		var today = new Date().toISOString().split('T')[0];
		$("#modifyDate").attr('min', today);		

	
	
		// 선택 날짜 예약내역 조회, 선택좌석 상세조회
		$("#searchListSeat-Btn").on("click", function(){
			
			// 변경 버튼 클릭시 모달에 조회한 날짜 표시
			var modifyDate = $("#searchList-seat input[name='rsvnDate']").val();
			$("#modifyDate").val(modifyDate);
			
			$.ajax({
				url:"${ contextPath }/asset/searchlistseat.do",
				type:"get",
				data: {rsvnDate : $("#searchList-seat input[type=date]").val()},
				success:function(slist){
					//console.log("서버로부터 받은 예약 리스트:", slist);
					
					$(".seatingNum td").each(function(){
						var seat = $(this);
						var seatNo = seat.text().trim();
						
						//console.log("좌석번호:", seatNo);
						
						// 스타일 초기화
						seat.css("background-color", "transparent");
						seat.removeClass("searchListSeat no-hover");
						
						
						// 예약된 좌석인지 확인
						var reservation = slist.filter(function(reservation){
							return reservation.assetName == seatNo;
						});
						
						
						if(reservation.length > 0){ // 클래스 생서해서 스타일 부여 
							//console.log("예약된 좌석:", seatNo);
							seat.addClass("searchListSeat no-hover");
						
							// 예약된 좌석 클릭시 상세조회
							seat.off("click").on("click", function(){
								$("#reservationList-table tbody").empty();
								
									
								reservation.forEach(function(rsvn){
									console.log("조건식 전", rsvn.rsvnContent);
									
									// 예약 내역중 null값 변경
									rsvn.rsvnName = rsvn.Name == null ? '대기발령' : revn.Name;
									rsvn.rsvnContent = rsvn.rsvnContent == null ? '' : rsvn.rsvnContent;
									
									console.log("조건식 후", rsvn.rsvnContent);
									
									// 예약 상세조회테이블
									var tr = $("<tr align='center'></tr>");
										tr.append("<td>" + rsvn.rsvnName + "</td>");
										tr.append("<td>" + rsvn.deptName + "</td>");
										tr.append("<td>" + rsvn.assetName + "</td>");
										tr.append("<td>" + rsvn.rsvnDate + "</td>");
										tr.append("<td>" + rsvn.startDivision 
												             + " " + rsvn.startDate  
												             + " ~ " + rsvn.endDivision  
												             + " " + rsvn.endDate + "</td>");
										tr.append("<td>" + rsvn.rsvnContent + "</td>");
										
										$("#reservationList-table tbody").append(tr);
									
								});
								
								 $("input[name='rsvnName'], input[name='deptName'], input[name='assetName'], input[name='rsvnTime'], input[name='rsvnContent']").val('');
								 $("#statusModify-btn").prop("disabled", true); 
								 
								
							})
						}else {
							seat.removeClass("searchListSeat no-hover");
							
							seat.off("click").on("click", function(){
								
								var tr = "<tr align='conter'>"
								       + "<td colspan='6'>" + "조회된 예약이 없습니다." + "</td>"
								       + "</tr>";
								$("#reservationList-table tbody").html(tr);
								
								$("input[name='rsvnName'], input[name='deptName'], input[name='assetName'], input[name='rsvnTime'], input[name='rsvnContent']").val('');
								// 변경버튼 활성화
								$("#statusModify-btn").prop("disabled", false);
							})
						}
					})
				},
				error:function(){
					console.log("예약 조회 ajax 통신실패");					
				}
			})
		})
		
		
		// 선택좌석 상태 변경
		$("#updateSeat-Btn").on("click", function(){
			
			var modifyDateForm = $("#modifyDate").val();
			var seatNoForm = $("#seat-no").val();
			var seatStatusForm = $(".reservation-select").val();
			
			if(!modifyDateForm){
				alsert("날짜를 지정해주세요.");
				return;
			}

			$.ajax({
				url:"${contextPath}/asset/modifyseat.bo",
				type:"post",
				data: {
					assetName : seatNoForm,
					modifyDate : modifyDateForm,
					status : seatStatusForm
				},
				success:function(result){
					
					if(result > 0){
						$("#seatStatusModify-modal").modal('hide');
						alert("성공적으로 변경 되었습니다.");
						
						if(seatStatusForm == "N"){
							$(".seatingNum td:contains(" + seatNoForm + ")").addClass("searchListSeat no-hover");
						} else if(seatStatusForm == 'Y'){
							$(".seatingNum td:contains(" + seatNoForm + ")").removeClass("searchListSeat no-hover");
						}
						
						
					}else{
						alert("변경에 실패하였습니다. 입력내용을 확인하시고 다시 시도해주세요.");
					}
					
				},
				error:function(){
					console.log("상태변경 ajax실패");
				}
			})
			
		})
		
		
		
		

	

		
	</script>

	<!-- ------------------------------ script -------------------------------------------- -->	













      <!-- ============================================================== -->
      <!-- <-- End Page Content
      <!-- ============================================================== -->
      
      

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