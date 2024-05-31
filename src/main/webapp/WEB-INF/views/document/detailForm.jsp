<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">

<head>
<meta charset="utf-8" />
<title>전자결재 | Follow me</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />

<!-- App favicon -->
<link rel="shortcut icon"
	href="${ contextPath }/assets/images/favicon.ico">

<!-- Theme Config Js -->
<script src="${ contextPath }/assets/js/head.js"></script>

<!-- Bootstrap css -->
<link href="${ contextPath }/assets/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" id="app-style" />

<!-- App css -->
<link href="${ contextPath }/assets/css/app.min.css" rel="stylesheet"
	type="text/css" />

<!-- Icons css -->
<link href="${ contextPath }/assets/css/icons.min.css" rel="stylesheet"
	type="text/css" />


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
.a.nav-link.active {
	background-color: #FEBE98;
}

.card {
	align-items: center;
}

.document-info {
	display: flex;
}

.top-document {
	justify-content: space-between;
	display: flex;
	align-items: flex-end; /* 아이템들을 오른쪽으로 정렬합니다. */
}

.document-title {
	margin-bottom: 60px;
	margin-left: 100px;
}

.sign-table {
	text-align: right;
}

.table-sign {
	border: 1px solid rgb(102, 88, 221);
	border-collapse: collapse;
	margin-top: 50px;
	margin-bottom: 20px;
}

.table-sign tr>th, .table-sign tr>td {
	text-align: center;
	width: 100px;
	height: 25px;
	font-size: 11px;
	font-weight: lighter;
}

.sign {
	height: 75px;
}

.table-info-1, .table-info-2 {
	border: 1px solid rgb(102, 88, 221);
	border-collapse: collapse;
	margin-bottom: 15px;
}

.table-info-2 {
	margin-left: 2px;
}

.table-2-1 {
	border: 1px solid rgb(102, 88, 221);
	border-collapse: collapse;
	margin-bottom: 15px;
}

.table-sign th, .table-sign td, .table-info-1 th, .table-info-1 td,
	.table-info-2 th, .table-info-2 td {
	border: 1px solid rgb(102, 88, 221);
	padding: 8px;
	text-align: left;
}

.table-2-1 th, .table-2-1 td {
	border: 1px solid rgb(102, 88, 221);
	padding: 8px;
	text-align: left;
	height: 40px;
}

#editor {
	flex: 1; /* 자식 요소를 꽉 채우도록 설정합니다. */
}

input:focus, td>textarea:focus {
	outline: none;
}

.btn-group-2 {
	margin-top: 30px;
	display: flex;
	justify-content: center;
}

.btn-group-2>.write {
	background-color: #FFBE98;
	border: 1px solid #FFBE98; /* 테두리 */ -
	-ct-btn-active-bg: #FA9A85; -
	-ct-btn-active-border-color: #FA9A85; -
	-ct-btn-hover-bg: #FA9A85; -
	-ct-btn-hover-border-color: #FA9A85;
	margin-left: 15px;
}

.btn-group-2>.cancel { -
	-ct-btn-color: #323a46; -
	-ct-btn-bg: #f3f7f9; -
	-ct-btn-border-color: #f3f7f9; -
	-ct-btn-hover-color: #323a46; -
	-ct-btn-hover-bg: #cfd2d4; -
	-ct-btn-hover-border-color: #c2c6c7; -
	-ct-btn-focus-shadow-rgb: 214, 219, 222; -
	-ct-btn-active-color: #323a46; -
	-ct-btn-active-bg: #c2c6c7; -
	-ct-btn-active-border-color: #b6b9bb; -
	-ct-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125); -
	-ct-btn-disabled-color: #323a46; -
	-ct-btn-disabled-bg: #f3f7f9; -
	-ct-btn-disabled-border-color: #f3f7f9;
	margin-right: 15px;
}

#pend {
	margin-left: 12px;
}

.btn-group-3>.write {
	background-color: #FFBE98;
	border: 1px solid #FFBE98; /* 테두리 */ -
	-ct-btn-active-bg: #FA9A85; -
	-ct-btn-active-border-color: #FA9A85; -
	-ct-btn-hover-bg: #FA9A85; -
	-ct-btn-hover-border-color: #FA9A85;
}

.btn-group-3>.cancel { -
	-ct-btn-color: #323a46; -
	-ct-btn-bg: #f3f7f9; -
	-ct-btn-border-color: #f3f7f9; -
	-ct-btn-hover-color: #323a46; -
	-ct-btn-hover-bg: #cfd2d4; -
	-ct-btn-hover-border-color: #c2c6c7; -
	-ct-btn-focus-shadow-rgb: 214, 219, 222; -
	-ct-btn-active-color: #323a46; -
	-ct-btn-active-bg: #c2c6c7; -
	-ct-btn-active-border-color: #b6b9bb; -
	-ct-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125); -
	-ct-btn-disabled-color: #323a46; -
	-ct-btn-disabled-bg: #f3f7f9; -
	-ct-btn-disabled-border-color: #f3f7f9;
}
</style>
</head>
<body>
	<!-- Begin page -->
	<div id="wrapper">

		<!-- sidemenu include -->
		<jsp:include page="/WEB-INF/views/common/sidemenu.jsp" />

		<div class="content-page">

			<!-- topbar include -->
			<jsp:include page="/WEB-INF/views/common/topbar.jsp" />


			<!-- ============================================================== -->
			<!-- Start Page content -->
			<!-- ============================================================== -->

			<div class="content"
				style="background-color: #F2E8DA; display: flex;">

				<div style="margin-top: 50px;">
					<ul class="menu">
						<c:if test="${loginUser.memGrade != '대표'}">
							<li class="menu-item"><a
								href="${ contextPath }/document/insertForm" class="menu-link">
									<span class="menu-icon"><i data-feather="edit-3"></i></span> <span
									class="menu-text"> 문서 작성하기 </span>
							</a></li>
						</c:if>
						<li class="menu-item" style="margin-top: 50px;"><a
							href="${ contextPath }/document/list" class="menu-link"> <span
								class="menu-icon"><i data-feather="archive"></i></span> <span
								class="menu-text"> 전체 문서함 </span>
						</a></li>
						<li class="menu-item"><a
							href="${ contextPath }/document/pendList" class="menu-link">
								<span class="menu-icon"><i data-feather="refresh-cw"></i></span>
								<span class="menu-text"> 진행중인 문서 </span>
						</a></li>
						<li class="menu-item"><a
							href="${ contextPath }/document/approvalList" class="menu-link">
								<span class="menu-icon"><i data-feather="check-circle"></i></span>
								<span class="menu-text"> 승인 문서함 </span>
						</a></li>
						<li class="menu-item"><a
							href="${ contextPath }/document/rejectList" class="menu-link">
								<span class="menu-icon"><i data-feather="x"></i></span> <span
								class="menu-text"> 반려 문서함 </span>
						</a></li>
						<li class="menu-item"><a
							href="${ contextPath }/document/recallList" class="menu-link">
								<span class="menu-icon"><i data-feather="trash-2"></i></span> <span
								class="menu-text"> 회수 문서함 </span>
						</a></li>
						<li class="menu-item"><a
							href="${ contextPath }/document/refList" class="menu-link"> <span
								class="menu-icon"><i data-feather="link"></i></span> <span
								class="menu-text"> 참조 문서함 </span>
						</a></li>

						<!-- 결재권한 있는 멤버만 보임 -->
						<c:if
							test="${loginUser.memGrade eq '팀장' || loginUser.memGrade eq '대표'}">
							<li class="menu-item"><a
								href="${ contextPath }/document/notDoneList" class="menu-link">
									<span class="menu-icon"><i data-feather="user-x"></i></span> <span
									class="menu-text"> 미처리 결재함 </span>
							</a></li>
						</c:if>
					</ul>
				</div>

				<!-- Start Content-->
				<div class="container-fluid"
					style="display: flex; justify-content: center;">

					<div class="row">
						<div class="col-12">
							<div class="card"
								style="margin-top: 50px; width: 1000px; text-align: center;">
								<div class="card-body" style="text-align: center;">
									<div>
										<h4 class="header-title">전자결재 문서 조회</h4>
										<p class="sub-header">Access read Electronic documents</p>
									</div>

									<c:choose>
										<c:when
											test="${loginUser.memNo eq document.memNo
						                      or loginUser.memNo eq document.midApprover
						                      or loginUser.memNo eq document.finalApprover
						                      or loginUser.memNo eq document.refMemNo
						                      or (loginUser.deptNo eq document.deptNo && loginUser.memGrade eq '팀장')
						                      }">

											<div id="documentContent" style="width: auto;">
												<input type="hidden" id="memNo"> 
												<input type="hidden" id="refMemNo"> 
												<input type="hidden" name="no" value="${ document.docuNo }">
											</div>


										</c:when>
										<c:otherwise>
		        						접근할 수 없는 페이지입니다.
                  	</c:otherwise>
									</c:choose>


									<script>				
							        function load() {

													document.getElementById('memNo').value = '${document.memNo}';
													
							        	
							            fetch("${contextPath}/resources/document/detailSample" + ${document.docuCategory} + ".html")
							                .then(response => response.text())
							                .then(htmlText => {
							                    document.getElementById('documentContent').innerHTML = htmlText;
							                })
							                .catch(error => {
							                    console.error('HTML 파일을 로드하는 중 오류가 발생했습니다:', error);
							                })
							                .finally(() => {
                           		
							               	document.getElementById('no').value = '${document.docuNo}';
							                document.getElementById('memDeptName').innerText = '${document.memDeptName}';
															document.getElementById('processReason').innerHTML = `${document.processReason}`;
							        				document.getElementById('registDate').innerText = '${document.registDate}';
							        				document.getElementById('memNo').value =  '${document.memNo}';
							                document.getElementById('memSig').src = '${contextPath}${document.memSig}';
							               	if('${document.status}' === '1'){
							               		document.getElementById('finalApproverSig').style.display = 'inline-block';
																document.getElementById('finalApproverSig').src = '${contextPath}${document.finalApproverSig}';
							               	}
															document.getElementById('refMemName').innerText = '${document.refMemName}';
															document.getElementById('finalApproveDate').innerText = '${document.finalApproveDate}';
															document.getElementById('docuTitle').innerText = '${document.docuTitle}';
											        
							        				if(${document.docuCategory} == '1'){
										            if('${document.midApproveStatus}' === 'Y'){
										            	document.getElementById('midApproverSig').style.display = 'inline-block';
																	document.getElementById('midApproverSig').src = '${contextPath}${document.midApproverSig}';
										            }
																document.getElementById('midApproveDate').innerText = '${document.midApproveDate}';
																document.getElementById('docuContent').innerHTML = `${document.docuContent}`;
																document.getElementById('docuCost').innerText = '${document.docuCost}';
																document.getElementById('docuRemark').innerText = '${document.docuRemark}';
																document.getElementById('memGrade').innerText = '${document.memGrade}';
										        		document.getElementById('memName').innerText =  '${document.memName}';
							        				}else if(${document.docuCategory} == '2'){
							        					document.getElementById('memGrade').innerText = '${document.memGrade}';
								        				document.getElementById('memName').innerText =  '${document.memName}';
																document.getElementById('docuContent').innerHTML = `${document.docuContent}`;
																document.getElementById('docuRemark').innerText = '${document.docuRemark}';
																document.getElementById('memPhone').innerText = '${document.memPhone}';
																document.getElementById('date').innerText = '${document.docuStartDate}' + '  ~  ' + '${document.docuEndDate}';
							        				}else if(${document.docuCategory} == '3'){
							        					document.getElementById('memGrade').innerText = '${document.memGrade}';
								        				document.getElementById('memName').innerText =  '${document.memName}';
																document.getElementById('memPhone').innerText = '${document.memPhone}';
																document.getElementById('docuContent').innerHTML = `${document.docuContent}`;
																document.getElementById('date').innerText = '${document.docuStartDate}' + '  ~  ' + '${document.docuEndDate}';
																document.getElementById('docuEndPlace').innerText = '${document.docuEndPlace}';
																document.getElementById('docuEmergencyCall').innerText = '${document.docuEmergencyCall}';
																
																var docuAnnualLeaveElement = '${document.docuAnnualLeave}';
														    var docuAnnualLeave = document.getElementById("docuAnnualLeave");

												        if (docuAnnualLeaveElement === 'Y') {
												        	docuAnnualLeave.innerText = '연차 휴가';
												        	docuAnnualLeave.style.color = 'blue';
												        } else {
												        	docuAnnualLeave.innerText = '연차 휴가 미사용';
												        	docuAnnualLeave.style.color = 'red';
												        	
												        }
												        
							        				}else if(${document.docuCategory} == '4'){
							        					document.getElementById('memGrade').innerText = '${document.memGrade}';
								        				document.getElementById('memName').innerText =  '${document.memName}';
								        				document.getElementById('docuCost').innerText = '${document.docuCost}';
								        				
										          	// 4번 양식 detail array list 불러오기 ajax
																$.ajax({
																     url: "${contextPath}/document/spendList.do",
																     type: 'post',
																     data: {no: ${document.docuNo}},
																     success:function(doc){
																    	  var table = document.getElementById("expenseTable").getElementsByTagName('tbody')[0];							
																							console.log(doc);
																    	        var dateArray = doc.docuStartDate ? doc.docuStartDate.split(",") : [];
																    	        var itemsArray = doc.docuItem ? doc.docuItem.split(",") : [];
																    	        var priceArray = doc.docuEtcCost ? doc.docuEtcCost.split(",") : [];
																    	        var remarkArray = remarkArray = doc.docuRemark ? doc.docuRemark.split(",") : [];

																    	        var maxLength = Math.max(dateArray.length, itemsArray.length, priceArray.length, remarkArray.length);
																    	        console.log(dateArray);
											        		            for (var i = 0; i < maxLength; i++) {
											        		                var newRow = table.insertRow(-1);
											        		            		var str = '';
											        		                str += '<td style="width:60px; text-align:center;"></td>';
											        		                str += '<td style="width:95px; text-align:center;" id="docuStartDate">' + dateArray[i] + '</td>';
											        		                str += '<td style="width:270px;" id="docuItem">' + itemsArray[i] + '</td>';
											        		                str += '<td style="width:90px; text-align:center;" id="docuCost">' + priceArray[i] + '</td>';
											        		                str += '<td style="width:100px; text-align:center;" id="docuRemark">' + remarkArray[i] + '</td>';

											        		                newRow.innerHTML = str;
											        		            }

												        		     }
																     
																});				
										          	
								        				
							        				}else if(${document.docuCategory} == '5'){
							        					document.getElementById('memGrade').innerText = '${document.memGrade}';
								        				document.getElementById('memName').innerText =  '${document.memName}';
																document.getElementById('approverInf').innerText = '${document.approverInf}';
										            if('${document.midApproveStatus}' === 'Y'){
										            	document.getElementById('midApproverSig').style.display = 'inline-block';
																	document.getElementById('midApproverSig').src = '${contextPath}${document.midApproverSig}';
										            }

												      // 5번 양식 detail array list 불러오기 ajax
															$.ajax({
															     url: "${contextPath}/document/spendList.do",
															     type: 'post',
															     data: {no: ${document.docuNo}},
															     success:function(doc){
															    	  var	 table = document.getElementById("expenseTable").getElementsByTagName('tbody')[0];							
																						console.log(doc);
															    	        var itemsArray = doc.docuItem ? doc.docuItem.split(",") : [];
															    	        var countArray = doc.docuCount ? doc.docuCount.split(",") : [];
															    	        var etcCostArray = doc.docuEtcCost ? doc.docuEtcCost.split(",") : [];
															    	        var costArray = doc.docuCost ? doc.docuCost.split(",") : [];
															    	        var remarkArray = doc.docuRemark ? doc.docuRemark.split(",") : [];
	
															    	        var maxLength = Math.max(itemsArray.length, countArray.length, etcCostArray.length, costArray.length, remarkArray.length);
										        		            
															    	        for (var i = 0; i < maxLength; i++) {
										        		                var newRow = table.insertRow(-1);
										        		            		var str = '';
										        		                str += '<td style="width:60px; text-align:center;"></td>';
										        		                str += '<td style="width:130px; text-align:center;" id="docuItem">' + itemsArray[i] + '</td>';
										        		                str += '<td style="width:45px;" id="docuCount">' + countArray[i] + '</td>';
										        		                str += '<td style="width:90px;" id="docuEtcCost">' + etcCostArray[i] + '</td>';
										        		                str += '<td style="width:100px; text-align:center;" id="docuCost">' + costArray[i] + '</td>';
										        		                str += '<td style="width:120px; text-align:center;" id="docuRemark">' + remarkArray[i] + '</td>';
	
										        		                newRow.innerHTML = str;
										        		            }
	
											        		     }
															     
															});			
							        				}else if(${document.docuCategory} == '6'){
							        					document.getElementById('memGrade').innerText = '${document.memGrade}';
								        				document.getElementById('memName').innerText =  '${document.memName}';
										            if('${document.midApproveStatus}' === 'Y'){
										            	document.getElementById('midApproverSig').style.display = 'inline-block';
																	document.getElementById('midApproverSig').src = '${contextPath}${document.midApproverSig}';
										            }
																document.getElementById('midApproveDate').innerText = '${document.midApproveDate}';
																document.getElementById('docuContent').innerHTML = `${document.docuContent}`;
																document.getElementById('docuStartPlace').innerText = '${document.docuStartPlace}';
																document.getElementById('docuEndPlace').innerText = '${document.docuEndPlace}';
																document.getElementById('date').innerText = '${document.docuStartDate}' + '  ~  ' + '${document.docuEndDate}';
																document.getElementById('docuTransportCost').innerText = '${document.docuTransportCost}' + ' 원';
																document.getElementById('docuFoodCost').innerText = '${document.docuFoodCost}' + ' 원';
																document.getElementById('docuFuelCost').innerText = '${document.docuFuelCost}' + ' 원';
																document.getElementById('docuRoomCost').innerText = '${document.docuRoomCost}' + ' 원';
																document.getElementById('docuEtcCost').innerText = '${document.docuEtcCost}' + ' 원';
																document.getElementById('docuCost').innerText = '${document.docuCost}' + ' 원';
							        				}else if(${document.docuCategory} == '7'){
										            if('${document.midApproveStatus}' === 'Y'){
										            	document.getElementById('midApproverSig').style.display = 'inline-block';
																	document.getElementById('midApproverSig').src = '${contextPath}${document.midApproverSig}';
										            }
																document.getElementById('mem').innerText = '${document.memName}' + '  ' + '${document.memGrade}'; 
																document.getElementById('date').innerText = '${document.docuStartDate}' + '  ~  ' + '${document.docuEndDate}';
																document.getElementById('refDeptName').innerText = '${document.refDeptName}';
																document.getElementById('approverInf').innerText = '${document.approverInf}';
																document.getElementById('docuText').innerText = '${document.docuText}';
																document.getElementById('docuTextNote').innerText = '${document.docuTextNote}';
																document.getElementById('docuContent').innerHTML = `${document.docuContent}`;
																document.getElementById('refDeptName').innerText = '${document.refDeptName}';
							        					
							        				}

															
															document.getElementById('goList').href = "${contextPath}/document/list";
																		
															// 회수/승인/반려 버튼 권한에 따라 표시
															var loginUserMemNo = "${loginUser.memNo}";
							                var documentMemNo = "${document.memNo}";
							                var documentStatus = "${document.status}";
							                var midApproveStatus = "${document.midApproveStatus}";
							                var finalApproveStatus = "${document.finalApproveStatus}";
							                var midApprover = "${document.midApprover}";
							                var finalApprover = "${document.finalApprover}";

							                if (loginUserMemNo === documentMemNo) {
							                    var recallButton = document.getElementById('recall');
							                    if (recallButton) {
							                        recallButton.style.display = (documentStatus === '0' && midApproveStatus === 'N') ? 'block' : 'none';
							                    }
							                } else {
							                    var rejectButton = document.getElementById('reject');
							                    var pendButton = document.getElementById('pend');
							                    
							                    if (rejectButton && pendButton) {
							                        var isMidApprover = (loginUserMemNo === midApprover && midApproveStatus === 'N' && documentStatus === '0');
							                        var isFinalApprover = (loginUserMemNo === finalApprover && finalApproveStatus === 'N' && documentStatus === '0');
							                        
							                        rejectButton.style.display = (isMidApprover || isFinalApprover) ? 'block' : 'none';
							                        pendButton.style.display = (isMidApprover || isFinalApprover) ? 'block' : 'none';
							                    }
							                }
							                
							                // 첨부파일 ajax
															$.ajax({
															     url: "${contextPath}/document/selectAt.do",
															     type: 'post',
															     data: {no: ${document.docuNo}},
															     success:function(attachmentList){
								                      let container = document.getElementById('attachTd');
						
								                      if (container) {
								                          container.innerHTML = '';  // 기존 내용을 비웁니다.
				
								                          attachmentList.forEach(function(at) {
								                              let link = document.createElement('a');
								                              link.href = '${contextPath}' + at.filePath + "/" + at.systemName;
								                              link.download = at.originName;
								                              link.textContent = '[' + at.originName + ']';
				
								                              let br = document.createElement('br');
				
								                              container.appendChild(link);
								                              container.appendChild(br);
								                          });
								                      } else {
								                          console.error("Element with ID 'attachTd' not found");
								                      }
															 	 	}
													 	  });
							                
							                // 처리사유 영역 최종결재자만 보이게
													    if ('${document.status}' === '0' && '${loginUser.memNo}' === '${document.finalApprover}') {
													        $("#showReason").hide();
													    		$("#reasonContainer").show();
													        $("#regist").show();
													    } else {
													    		$("showReason").show();
													        $("#reasonContainer").hide();
													        $("#regist").hide();
													    }
						            		  
							            });
							        		
							        }
							                
							        
							    
							        window.onload = load();
							    </script>

									<script>
								        
								      function updateStatus(){
									    	$("#frm").attr("action", "${contextPath}/document/recall.do");
								    		$("#frm").submit();	    	
									    }
									    
									    function rejectStatus(){						    	
									    	if("${document.midApprover}" != "" && "${loginUser.memNo}" === "${document.midApprover}"){
									    		$("#frm2").attr("action", "${contextPath}/document/midReject.do");
									    		$("#frm2").submit();
									    	}else if("${loginUser.memNo}" === "${document.finalApprover}"){
									    		$("#frm2").attr("action", "${contextPath}/document/finalReject.do");
									    		$("#frm2").submit();
									    	}
									    }								    
									    
									    function approvalStatus(){
									    	if("${document.midApprover}" != "" && "${loginUser.memNo}" === "${document.midApprover}"){
									    		$("#frm3").attr("action", "${contextPath}/document/midApprove.do");
									    		$("#frm3").submit();
									    	}else if("${loginUser.memNo}" === "${document.finalApprover}"){
									    		$("#frm3").attr("action", "${contextPath}/document/finalApprove.do");
									    		$("#frm3").submit();

									    	}
									    }
									    

									</script>
									
									<script>
									$(document).ready(function() {
									    $('#confirmButton').on('click', function() {
									        // 모달 창의 textarea에 입력한 내용 가져오기
									        var reasonText = $('#reason').val();
									        
									        // 가져온 내용을 <td id="processReason"> 요소에 텍스트로 표시
									        $('#processReason').html(reasonText);
									    		// 모달 창 닫기	
									        $('#regist-modal').modal('hide');
									    		
									    		$('input[name="processReason"]').val(reasonText);
	
									    		console.log($('input[name="processReason"]').val());
									    });
									});
									</script>

									<!-- 회수하기 버튼-->
									<form id="frm" action="" method="post">
										<input type="hidden" name="docuNo" value="${ document.docuNo }">
										<div class="modal fade" id="recall-modal" tabindex="-1"
											role="dialog" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered">
												<div class="modal-content">
													<div class="modal-header">
														<h4 class="modal-title" id="topModalLabel">문서를
															회수하시겠습니까?</h4>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<h5 style="text-align: left;">문서 회수 시 결재 상태가 더이상 진행되지
															않습니다.</h5>

													</div>
													<div class="modal-footer">
														<div class="btn-group-3">
															<button type="button"
																class="btn btn-primary waves-effect waves-light cancel"
																data-bs-dismiss="modal">취소</button>
															<button type="submit"
																class="btn btn-primary waves-effect waves-light write"
																onclick="updateStatus();">확인</button>
														</div>
													</div>
												</div>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dialog -->
										</div>
										<!-- /.modal -->
									</form>



									<!-- 반려 버튼-->
									<form id="frm2" action="" method="post">
										<input type="hidden" name="processReason">
										<input type="hidden" name="docuNo" value="${ document.docuNo }">
										<input type="hidden" name="memNo" value="${ document.memNo }">																				
										<div class="modal fade" id="reject-modal" tabindex="-1"
											role="dialog" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered">
												<div class="modal-content">
													<div class="modal-header">
														<h4 class="modal-title" id="topModalLabel">반려하시겠습니까?</h4>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<h5 style="text-align: left;">확인을 누르시면 해당 문서의 결재가
															반려됩니다.</h5>

													</div>
													<div class="modal-footer">
														<div class="btn-group-3">
															<button type="button"
																class="btn btn-primary waves-effect waves-light cancel"
																data-bs-dismiss="modal">취소</button>
															<button type="submit"
																class="btn btn-primary waves-effect waves-light write"
																onclick="rejectStatus();">확인</button>
														</div>
													</div>
												</div>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dialog -->
										</div>
										<!-- /.modal -->
									</form>


									<!-- 승인 버튼-->
									<form id="frm3" action="" method="post">
										<input type="hidden" name="processReason">
										<input type="hidden" name="docuNo" value="${ document.docuNo }">
										<input type="hidden" name="memNo" value="${ document.memNo }">										
										<div class="modal fade" id="pend-modal" tabindex="-1"
											role="dialog" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered">
												<div class="modal-content">
													<div class="modal-header">
														<h4 class="modal-title" id="topModalLabel">승인하시겠습니까?</h4>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<h5 style="text-align: left;">확인을 누르시면 해당 문서의 결재가
															승인됩니다.</h5>
													</div>
													<div class="modal-footer">
														<div class="btn-group-3">
															<button type="button"
																class="btn btn-primary waves-effect waves-light cancel"
																data-bs-dismiss="modal">취소</button>
															<button type="submit"
																class="btn btn-primary waves-effect waves-light write"
																onclick="approvalStatus();">확인</button>
														</div>
													</div>
												</div>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dialog -->
										</div>
										<!-- /.modal -->
									</form>

									<!-- 처리사유 등록 버튼-->
										<input type="hidden" name="docuNo" value="${ document.docuNo }">
										<div class="modal fade" id="regist-modal" tabindex="-1"
											role="dialog" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered">
												<div class="modal-content">
													<div class="modal-header">
														<h4 class="modal-title" id="topModalLabel">사유 등록</h4>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
															<textarea id="reason" rows="5" style="border:0; width: 470px; resize:none;" placeholder="처리 사유를 기입해주세요."></textarea>
													</div>
													<div class="modal-footer">
														<div class="btn-group-3">
															<button type="button"
																class="btn btn-primary waves-effect waves-light cancel"
																data-bs-dismiss="modal">취소</button>
															<button type="button"
																class="btn btn-primary waves-effect waves-light write"
																id="confirmButton">확인</button>
														</div>
													</div>
												</div>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dialog -->
										</div>
										<!-- /.modal -->



								</div>
							</div>
							<!-- end card -->
						</div>
						<!-- end col -->
					</div>
					<!-- end row -->




				</div>
				<!-- container -->

			</div>
			<!-- content -->

		</div>


		<!-- ============================================================== -->
		<!-- End Page content -->
		<!-- ============================================================== -->

	</div>

	<!-- Theme Settings -->
	<div class="offcanvas offcanvas-end right-bar" tabindex="-1"
		id="theme-settings-offcanvas">
		<div class="d-flex align-items-center w-100 p-0 offcanvas-header">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs nav-bordered nav-justified w-100"
				role="tablist">
				<li class="nav-item"><a class="nav-link py-2"
					data-bs-toggle="tab" href="#chat-tab" role="tab"> <i
						class="mdi mdi-message-text d-block font-22 my-1"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link py-2"
					data-bs-toggle="tab" href="#tasks-tab" role="tab"> <i
						class="mdi mdi-format-list-checkbox d-block font-22 my-1"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link py-2 active"
					data-bs-toggle="tab" href="#settings-tab" role="tab"> <i
						class="mdi mdi-cog-outline d-block font-22 my-1"></i>
				</a></li>
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
						<a href="javascript: void(0);"
							class="text-reset notification-item ps-3 mb-2 d-block"> <i
							class="mdi mdi-checkbox-blank-circle-outline me-1 text-success"></i>
							<span class="mb-0 mt-1">App Development</span>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item ps-3 mb-2 d-block"> <i
							class="mdi mdi-checkbox-blank-circle-outline me-1 text-warning"></i>
							<span class="mb-0 mt-1">Office Work</span>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item ps-3 mb-2 d-block"> <i
							class="mdi mdi-checkbox-blank-circle-outline me-1 text-danger"></i>
							<span class="mb-0 mt-1">Personal Group</span>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item ps-3 d-block"> <i
							class="mdi mdi-checkbox-blank-circle-outline me-1"></i> <span
							class="mb-0 mt-1">Freelance</span>
						</a>
					</div>

					<h6 class="fw-medium mt-3 text-uppercase">
						Favourites <a href="javascript: void(0);"
							class="font-18 text-danger"><i
							class="float-end mdi mdi-plus-circle"></i></a>
					</h6>

					<div>
						<a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="${ contextPath }/assets/images/users/user-10.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status online"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Andrew Mackie</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">It will seem like simplified
											English.</p>
									</div>
								</div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="${ contextPath }/assets/images/users/user-1.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status away"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Rory Dalyell</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">To an English person, it
											will seem like simplified</p>
									</div>
								</div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="${ contextPath }/assets/images/users/user-9.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status busy"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Jaxon Dunhill</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">To achieve this, it would be
											necessary.</p>
									</div>
								</div>
							</div>
						</a>
					</div>

					<h6 class="fw-medium mt-3 text-uppercase">
						Other Chats <a href="javascript: void(0);"
							class="font-18 text-danger"><i
							class="float-end mdi mdi-plus-circle"></i></a>
					</h6>

					<div class="pb-4">
						<a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="${ contextPath }/assets/images/users/user-2.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status online"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Jackson Therry</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">Everyone realizes why a new
											common language.</p>
									</div>
								</div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="${ contextPath }/assets/images/users/user-4.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status away"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Charles Deakin</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">The languages only differ in
											their grammar.</p>
									</div>
								</div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="${ contextPath }/assets/images/users/user-5.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status online"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Ryan Salting</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">If several languages
											coalesce the grammar of the resulting.</p>
									</div>
								</div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="${ contextPath }/assets/images/users/user-6.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status online"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Sean Howse</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">It will seem like simplified
											English.</p>
									</div>
								</div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="${ contextPath }/assets/images/users/user-7.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status busy"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Dean Coward</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">The new common language will
											be more simple.</p>
									</div>
								</div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset notification-item">
							<div class="d-flex align-items-start noti-user-item">
								<div class="position-relative me-2">
									<img src="${ contextPath }/assets/images/users/user-8.jpg"
										class="rounded-circle avatar-sm" alt="user-pic"> <i
										class="mdi mdi-circle user-status away"></i>
								</div>
								<div class="overflow-hidden">
									<h6 class="mt-0 mb-1 font-14">Hayley East</h6>
									<div class="font-13 text-muted">
										<p class="mb-0 text-truncate">One could refuse to pay
											expensive translators.</p>
									</div>
								</div>
							</div>
						</a>

						<div class="text-center mt-3">
							<a href="javascript:void(0);" class="btn btn-sm btn-white"> <i
								class="mdi mdi-spin mdi-loading me-2"></i> Load more
							</a>
						</div>
					</div>

				</div>

				<div class="tab-pane" id="tasks-tab" role="tabpanel">
					<h6 class="fw-medium p-3 m-0 text-uppercase">Working Tasks</h6>
					<div class="px-2">
						<a href="javascript: void(0);"
							class="text-reset item-hovered d-block p-2">
							<p class="text-muted mb-0">
								App Development<span class="float-end">75%</span>
							</p>
							<div class="progress mt-2" style="height: 4px;">
								<div class="progress-bar bg-success" role="progressbar"
									style="width: 75%" aria-valuenow="75" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset item-hovered d-block p-2">
							<p class="text-muted mb-0">
								Database Repair<span class="float-end">37%</span>
							</p>
							<div class="progress mt-2" style="height: 4px;">
								<div class="progress-bar bg-info" role="progressbar"
									style="width: 37%" aria-valuenow="37" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset item-hovered d-block p-2">
							<p class="text-muted mb-0">
								Backup Create<span class="float-end">52%</span>
							</p>
							<div class="progress mt-2" style="height: 4px;">
								<div class="progress-bar bg-warning" role="progressbar"
									style="width: 52%" aria-valuenow="52" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</a>
					</div>

					<h6 class="fw-medium mb-0 mt-4 text-uppercase">Upcoming Tasks</h6>

					<div>
						<a href="javascript: void(0);"
							class="text-reset item-hovered d-block p-2">
							<p class="text-muted mb-0">
								Sales Reporting<span class="float-end">12%</span>
							</p>
							<div class="progress mt-2" style="height: 4px;">
								<div class="progress-bar bg-danger" role="progressbar"
									style="width: 12%" aria-valuenow="12" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset item-hovered d-block p-2">
							<p class="text-muted mb-0">
								Redesign Website<span class="float-end">67%</span>
							</p>
							<div class="progress mt-2" style="height: 4px;">
								<div class="progress-bar bg-primary" role="progressbar"
									style="width: 67%" aria-valuenow="67" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</a> <a href="javascript: void(0);"
							class="text-reset item-hovered d-block p-2">
							<p class="text-muted mb-0">
								New Admin Design<span class="float-end">84%</span>
							</p>
							<div class="progress mt-2" style="height: 4px;">
								<div class="progress-bar bg-success" role="progressbar"
									style="width: 84%" aria-valuenow="84" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</a>
					</div>

					<div class="p-3 mt-2 d-grid">
						<a href="javascript: void(0);"
							class="btn btn-success waves-effect waves-light">Create Task</a>
					</div>

				</div>

				<div class="tab-pane active" id="settings-tab" role="tabpanel">

					<div class="mt-n3">
						<h6
							class="fw-medium py-2 px-3 font-13 text-uppercase bg-light mx-n3 mt-n3 mb-3">
							<span class="d-block py-1">Theme Settings</span>
						</h6>
					</div>

					<div class="alert alert-warning" role="alert">
						<strong>Customize </strong> the overall color scheme, sidebar
						menu, etc.
					</div>

					<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Color Scheme</h5>

					<div class="colorscheme-cardradio">
						<div class="d-flex flex-column gap-2">
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-bs-theme" id="layout-color-light" value="light">
								<label class="form-check-label" for="layout-color-light">Light</label>
							</div>

							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-bs-theme" id="layout-color-dark" value="dark">
								<label class="form-check-label" for="layout-color-dark">Dark</label>
							</div>
						</div>
					</div>

					<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Content Width</h5>
					<div class="d-flex flex-column gap-2">
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox"
								name="data-layout-width" id="layout-width-default"
								value="default"> <label class="form-check-label"
								for="layout-width-default">Fluid (Default)</label>
						</div>

						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox"
								name="data-layout-width" id="layout-width-boxed" value="boxed">
							<label class="form-check-label" for="layout-width-boxed">Boxed</label>
						</div>
					</div>

					<div id="layout-mode">
						<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Layout Mode</h5>

						<div class="d-flex flex-column gap-2">
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-layout-mode" id="layout-mode-default"
									value="default"> <label class="form-check-label"
									for="layout-mode-default">Default</label>
							</div>


							<div id="layout-detached">
								<div class="form-check form-switch">
									<input class="form-check-input" type="checkbox"
										name="data-layout-mode" id="layout-mode-detached"
										value="detached"> <label class="form-check-label"
										for="layout-mode-detached">Detached</label>
								</div>
							</div>
						</div>
					</div>

					<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Topbar Color</h5>

					<div class="d-flex flex-column gap-2">
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox"
								name="data-topbar-color" id="topbar-color-light" value="light">
							<label class="form-check-label" for="topbar-color-light">Light</label>
						</div>

						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox"
								name="data-topbar-color" id="topbar-color-dark" value="dark">
							<label class="form-check-label" for="topbar-color-dark">Dark</label>
						</div>

						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox"
								name="data-topbar-color" id="topbar-color-brand" value="brand">
							<label class="form-check-label" for="topbar-color-brand">Brand</label>
						</div>
					</div>

					<div>
						<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Menu Color</h5>

						<div class="d-flex flex-column gap-2">
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-menu-color" id="leftbar-color-light" value="light">
								<label class="form-check-label" for="leftbar-color-light">Light</label>
							</div>

							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-menu-color" id="leftbar-color-dark" value="dark">
								<label class="form-check-label" for="leftbar-color-dark">Dark</label>
							</div>
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-menu-color" id="leftbar-color-brand" value="brand">
								<label class="form-check-label" for="leftbar-color-brand">Brand</label>
							</div>
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-menu-color" id="leftbar-color-gradient"
									value="gradient"> <label class="form-check-label"
									for="leftbar-color-gradient">Gradient</label>
							</div>
						</div>
					</div>

					<div id="menu-icon-color">
						<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Menu Icon Color</h5>

						<div class="d-flex flex-column gap-2">
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-two-column-color" id="twocolumn-menu-color-light"
									value="light"> <label class="form-check-label"
									for="twocolumn-menu-color-light">Light</label>
							</div>

							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-two-column-color" id="twocolumn-menu-color-dark"
									value="dark"> <label class="form-check-label"
									for="twocolumn-menu-color-dark">Dark</label>
							</div>
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-two-column-color" id="twocolumn-menu-color-brand"
									value="brand"> <label class="form-check-label"
									for="twocolumn-menu-color-brand">Brand</label>
							</div>
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-two-column-color" id="twocolumn-menu-color-gradient"
									value="gradient"> <label class="form-check-label"
									for="twocolumn-menu-color-gradient">Gradient</label>
							</div>
						</div>
					</div>

					<div>
						<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Menu Icon Tone</h5>

						<div class="d-flex flex-column gap-2">
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-menu-icon" id="menu-icon-default" value="default">
								<label class="form-check-label" for="menu-icon-default">Default</label>
							</div>

							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-menu-icon" id="menu-icon-twotone" value="twotones">
								<label class="form-check-label" for="menu-icon-twotone">Twotone</label>
							</div>
						</div>
					</div>

					<div id="sidebar-size">
						<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Sidebar Size</h5>

						<div class="d-flex flex-column gap-2">
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-sidenav-size" id="leftbar-size-default"
									value="default"> <label class="form-check-label"
									for="leftbar-size-default">Default</label>
							</div>

							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-sidenav-size" id="leftbar-size-compact"
									value="compact"> <label class="form-check-label"
									for="leftbar-size-compact">Compact (Medium Width)</label>
							</div>

							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-sidenav-size" id="leftbar-size-small"
									value="condensed"> <label class="form-check-label"
									for="leftbar-size-small">Condensed (Icon View)</label>
							</div>

							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-sidenav-size" id="leftbar-size-full" value="full">
								<label class="form-check-label" for="leftbar-size-full">Full
									Layout</label>
							</div>

							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox"
									name="data-sidenav-size" id="leftbar-size-fullscreen"
									value="fullscreen"> <label class="form-check-label"
									for="leftbar-size-fullscreen">Fullscreen Layout</label>
							</div>
						</div>
					</div>

					<div id="sidebar-user">
						<h5 class="fw-medium font-14 mt-4 mb-2 pb-1">Sidebar User
							Info</h5>

						<div class="form-check form-switch">
							<input type="checkbox" class="form-check-input"
								name="data-sidebar-user" id="sidebaruser-check"> <label
								class="form-check-label" for="sidebaruser-check">Enable</label>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="offcanvas-footer border-top py-2 px-2 text-center">
			<div class="d-flex gap-2">
				<button type="button" class="btn btn-light w-50" id="reset-layout">Reset</button>
				<a href="https://1.envato.market/uboldadmin"
					class="btn btn-danger w-50" target="_blank"><i
					class="mdi mdi-basket me-1"></i> Buy</a>
			</div>
		</div>
	</div>

	<!-- Vendor js -->
	<script src="${ contextPath }/assets/js/vendor.min.js"></script>

	<!-- App js -->
	<script src="${ contextPath }/assets/js/app.min.js"></script>

	<!-- Plugins js-->
	<script src="${ contextPath }/assets/libs/flatpickr/flatpickr.min.js"></script>
	<script
		src="${ contextPath }/assets/libs/selectize/js/standalone/selectize.min.js"></script>



</body>
</html>