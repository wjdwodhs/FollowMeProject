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
	                                        <label style="margin-left: 30%; margin-right: 5px;">예약조회</label>
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
                                
                            <!-- 예약 조회-->
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-uppercase mt-0 mb-3 bg-light p-2"><b>자리 상태 설정 </b> | <small> Seat setting </small></h5>
                                        <br>
                                        	<form action="">
                                            <table align="center">
                                                <tr>
                                                    <th>선택 좌석 </th>
                                                    <td><input type="text" class="form-control" id="seat-no" name="seat-no" style="width: 90px; margin-right: 15px;  margin-left: 10px;"></td>
                                                    <th>이용상태</th>
                                                    <td>
                                                        <select class="reservation-select class="form-control" name="condition" required style="border: 0.5px solid lightgray; border-radius: 3px; height: 30px; color: gray; margin-left: 10px;">
                                                            <option value="writer">이용가능</option>
                                                            <option value="title">이용불가</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>

                                        <br><br>

                                        <div class="text-center mb-3">
                                        <button type="button" class="btn w-sm btn-success waves-effect waves-light" style="background-color: #FFBE98; border: none;"
                                                data-bs-toggle="modal" data-bs-target="#seatStatusModify-modal">변경</button>
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
                                                <table class="table-sm" style="margin-left: 10px;">
                                                    <tr>
                                                        <th>예약자명</th>
                                                        <td style="width: 150px;">
                                                            <input type="text" name="rsvnName" class="form-control" style="height: 30px;" readonly>    
                                                        </td>
                                                        <th>소속부서</th>
                                                        <td  style="width: 150px;">
                                                            <input type="text" name="deptName" class="form-control" style="height: 30px;" readonly  >     
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>예약일자</th>
                                                        <td>
	                                                        <input type="text" name="rsvnDate" class="form-control" style="height: 30px;" readonly  > 
                                                        </td>
                                                        <th>선택좌석</th>
                                                        <td>
                                                        	<input type="text" name="assetName" class="form-control" style="height: 30px;" readonly  >    
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>예약시간</th>
                                                        <td colspan="3">
                                                            <input type="text" name="rsvnTime" class="form-control" style="height: 30px;" readonly  > 
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>코멘트</th>
                                                        <td colspan="3">
                                                            <input type="text" class="form-control" id="product-meta-keywords" name="rsvnContent">
                                                        </td>
                                                    </tr>
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
                <p>좌석번호 &nbsp<label id="seat-no-label"></label>의 상태를 변경할 날짜를 선택해주세요.</p>
                <input type="date" id="seatStatusModify-registDate" name="registDate" style="border: 0.5px solid lightgray; border-radius: 3px;" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn w-sm btn-light waves-effect" data-bs-dismiss="modal">취소</button>
                <button type="button" id="selectCarList-delBtn" class="btn btn-primary" 
                        style="background-color: #FFBE98; border: none;">확인</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
	<!-- 선택좌석 선택 변경 모달 end -->
			
			
			
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>	
	
	// 좌석 클릭하면 자리 상태 설정에 좌석 번호 표시
	$(document).ready(function(){
		$("#seatingNum td").click(function() {
			let no = $(this).text();
			$("#seat-no").val(no);
			$("#seat-no-label").html('<b>' + no + '</b>');
		})
		
	})
	
	
	// 선택 날짜 예약내역 조회, 선택좌석 상세조회
	$(document).ready(function(){
		$("#searchListSeat-Btn").on("click", function(){
			$.ajax({
				url:"${ contextPath }/asset/searchlistseat.do",
				type:"get",
				data: {rsvnDate : $("#searchList-seat input[type=date]").val()},
				success:function(slist){
					console.log("서버로부터 받은 예약 리스트:", slist);
					
					$(".seatingNum td").each(function(){
						var seat = $(this);
						var seatNo = seat.text().trim();
						console.log("좌석번호:", seatNo);
						
						// 스타일 초기화
						seat.css("background-color", "transparent");
						seat.removeClass("searchListSeat");
						seat.removeClass("no-hover");
						
						// 예약된 좌석인지 확인
						var reservation = slist.find(function(reservation){
							return reservation.assetName == seatNo;
						});
						
						if(reservation){ // 클래스 생서해서 스타일 부여 
							console.log("예약된 좌석:", seatNo);
							seat.addClass("searchListSeat");
							seat.addClass("no-hover");
						
							// 예약된 좌석 클릭시 상세조회
							seat.on("click", function(){
								var rsvnTime = reservation.startDivision + " " + reservation.startDate + " ~ " + reservation.endDivision + " " + reservation.endDate;
								$("input[name='rsvnName']").val(reservation.rsvnName);
								$("input[name='deptName']").val(reservation.deptName);
								$("input[name='rsvnDate']").val(reservation.rsvnDate);
								$("input[name='assetName']").val(reservation.assetName);
								$("input[name='rsvnTime']").val(rsvnTime);
								$("input[name='rsvnContent']").val(reservation.rsvnContent);
							})
						}else if(!reservation){
							
							seat.on("click", function(){
								$("input[name='rsvnName']").val('');
								$("input[name='deptName']").val('');
								$("input[name='rsvnDate']").val('');
								$("input[name='assetName']").val('');
								$("input[name='rsvnTime']").val('');
								$("input[name='rsvnContent']").val('');
							})
						}
					})
				},
				error:function(){
					console.log("예약 조회 ajax 통신실패");					
				}
			})
		})
	})
	
	
	
	
	// 상태변경 날짜 당일 이후부터 선택 가능 
		var inputDate = document.querySelector('#seatStatusModify-modal input[type="date"]');
		inputDate.min = new Date().toISOString().split('T')[0];
	
	/* 조회 후 다시 작성하기
	// 자리 상태 설정 변경
	$("#selectCarList-delBtn").on("click", function(){
			var assetName = $("#seat-no-label").val();
			var registDate = $("#seatStatusModify-registDate").val();
			
			if(!registDate){
				alert("날짜를 선택해주세요.")
			}
			
			location.href = `${contextPath}/asset/modifystatusseat.do?`;
		
	})
	*/
	
	
	
		
	</script>















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