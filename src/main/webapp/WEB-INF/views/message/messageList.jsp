<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en" data-topbar-color="dark">

<head>
<meta charset="utf-8" />
<title>쪽지함 | Follow me</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- App favicon -->
<link rel="shortcut icon" href="${ contextPath }assets/images/favicon.ico">

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
	.scroll-message {
    overflow: hidden; /* 스크롤을 숨깁니다. */
    text-overflow: ellipsis; /* 텍스트가 컨테이너를 벗어날 때 생략되도록 합니다. */
	}
	.card:empty,
	.card-body:empty {
	    display: none;
	}
	.conversation-list-wrapper {
    background-color: #ffffff;
    height: 700px;
	}
	.hidden {
    display: none;
	}
	
	
</style>

</head>

<body>

<script>
	
	var contextPath = "${contextPath}";
	
	// 메시지를 가져온 후 스크롤을 맨 아래로 이동하는 함수
  function scrollToBottom() {
      var messageArea = document.querySelector('.message-area.card-body');
      if (messageArea) {
          messageArea.scrollTop = messageArea.scrollHeight;
      }
  }
	
	//날짜 형식 변경 함수
  function formatTimestamp(timestamp) {
      var date = new Date(timestamp);
      var year = date.getFullYear();
      var month = (date.getMonth() + 1).toString().padStart(2, '0');
      var day = date.getDate().toString().padStart(2, '0');
      var hours = date.getHours().toString().padStart(2, '0');
      var minutes = date.getMinutes().toString().padStart(2, '0');
      
      return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes;
  }

  // 맨 처음 페이지 로딩 시 채팅방 리스트 불러오기
  $(document).ready(function() {
    $.ajax({
        type: 'GET',
        url: '${contextPath}/message/getMsgList',
        dataType: 'json',
        success: function(response) {
            console.log('채팅방 리스트 조회에 성공했습니다.');
            console.log(response);

            $('#chat-room-list').empty(); // 기존 채팅방 리스트를 비웁니다.

            // 응답 데이터로 채팅방 목록 생성 및 추가
            response.msgList.forEach(function(msg) {
                var unreadBadge = msg.unread > 0 
                    ? '<div class="col-2 unread' + msg.unread + '"><span class="badge bg-danger">' + msg.unread + '</span></div>' 
                    : '';

                var chatRoomItem = '<div class="row">' +
                    '<div class="col">' +
                    '<div data-simplebar style="max-height: 500px;">' +
                    '<a href="javascript:void(0);" class="text-body">' +
                    '<input type="hidden" id="selectedMemNo" name="memNo" value="' + response.memNo + '" />' +
                    '<div class="d-flex align-items-start p-2" room-id="' + msg.msgRoNo + '" data-receiver-id="' + msg.msgTo + '" data-sender-id="' + msg.msgFrom + '">' +
                    '<input type="hidden" id="loginMemName" value="' + response.memName + '">' +
                    '<input type="hidden" id="loginMemNo" value="' + response.memNo + '">' +
                    '<input type="hidden" id="profileImgPath" value="' + contextPath + msg.profileImgPath + '">' +
                    '<input type="hidden" id="otherMem" value="' + msg.otherMem + '">' +
                    '<img src="' + contextPath + msg.profileImgPath + '" class="me-2 rounded-circle" height="42" />' +
                    '<div class="w-100">' +
                    '<h5 class="mt-0 mb-0 font-14">' +
                    '<span class="float-end text-muted fw-normal font-12">' + formatTimestamp(msg.sendDate) + '</span>' + msg.otherMem + '</h5>' +
                    '<p class="mt-1 mb-0 text-muted font-14 scroll-message">' +
                    '<span class="w-75">' + msg.msgContent + '</span>' +
                    '</p>' +
                    unreadBadge +
                    '</div>' +
                    '</div>' +
                    '</a>' +
                    '</div>' +
                    '</div>' +
                    '</div>';

                $('#chat-room-list').append(chatRoomItem); 
            });
        },
        error: function(xhr, status, error) {
            console.error('채팅방 불러오기에 실패함', error);
        }
    });
});
  
  
  // 새로운 메세지 보낼 경우 채팅방 리로드 하기
  function reloadChatRoomList() {
	  
	  $.ajax({
	        type: 'GET',
	        url: '${contextPath}/message/getMsgListAgain',
	        dataType: 'json',
	        success: function(response) {
	            console.log('채팅방 리스트 조회에 성공했습니다.');
	            console.log(response);

	            $('#chat-room-list').empty(); // 기존 채팅방 리스트를 비웁니다.

	            // 응답 데이터로 채팅방 목록 생성 및 추가
	            response.msgList.forEach(function(msg) {
	                var unreadBadge = msg.unread > 0 
	                    ? '<div class="col-2 unread' + msg.unread + '"><span class="badge bg-danger">' + msg.unread + '</span></div>' 
	                    : '';

	                var chatRoomItem = '<div class="row">' +
	                    '<div class="col">' +
	                    '<div data-simplebar style="max-height: 500px;">' +
	                    '<a href="javascript:void(0);" class="text-body">' +
	                    '<input type="hidden" id="selectedMemNo" name="memNo" value="' + response.memNo + '" />' +
	                    '<div class="d-flex align-items-start p-2" room-id="' + msg.msgRoNo + '" data-receiver-id="' + msg.msgTo + '" data-sender-id="' + msg.msgFrom + '">' +
	                    '<input type="hidden" id="loginMemName" value="' + response.memName + '">' +
	                    '<input type="hidden" id="loginMemNo" value="' + response.memNo + '">' +
	                    '<input type="hidden" id="profileImgPath" value="' + contextPath + msg.profileImgPath + '">' +
	                    '<input type="hidden" id="otherMem" value="' + msg.otherMem + '">' +
	                    '<img src="' + contextPath + msg.profileImgPath + '" class="me-2 rounded-circle" height="42" />' +
	                    '<div class="w-100">' +
	                    '<h5 class="mt-0 mb-0 font-14">' +
	                    '<span class="float-end text-muted fw-normal font-12">' + formatTimestamp(msg.sendDate) + '</span>' + msg.otherMem + '</h5>' +
	                    '<p class="mt-1 mb-0 text-muted font-14 scroll-message">' +
	                    '<span class="w-75">' + msg.msgContent + '</span>' +
	                    '</p>' +
	                    unreadBadge +
	                    '</div>' +
	                    '</div>' +
	                    '</a>' +
	                    '</div>' +
	                    '</div>' +
	                    '</div>';

	                $('#chat-room-list').append(chatRoomItem); 
	            });
	        },
	        error: function(xhr, status, error) {
	            console.error('채팅방 불러오기에 실패함', error);
	        }
	    });
	  
	  
	  
	  
  }

	
	//채팅방 리스트의 각 항목을 클릭했을 때
	$(document).on('click', '.d-flex.align-items-start.p-2', function() {
		

      // 채팅방 리스트 리로드 (안 읽은 알림 있으면 읽음 확인 처리)
      reloadChatRoomList();
        
	    // 해당 채팅방의 방 번호를 가져옴
	    var roomId = $(this).attr('room-id');
	    var currentUserId = document.getElementById('loginMemNo').value;
	    
	 		// 해당 채팅방의 정보를 가져옴
	    var profileImgPath = $(this).find('img').attr('src');
	    var otherMem = $(this).find('h5').clone().children().remove().end().text().trim();

	    
	    // 대화 상대방 정보 추가
	    var $conversationInfo = $('<div class="d-flex align-items-start"></div>');
	    $conversationInfo.append('<img src="'+ profileImgPath +'" class="me-2 rounded-circle" height="30" >');
	    $conversationInfo.append('<div><h5 class="mt-0 mb-0 font-15"><a href="#" class="text-reset">'+otherMem+'</a></h5></div>');

	    // 이전에 추가한 대화 상대방 정보를 모두 제거
	    $('.message-area.card-body .d-flex.align-items-start').remove();

	    $('.message-area.card-body').prepend($conversationInfo);
	
	    // AJAX 요청을 보내서 해당 방의 메시지를 가져옴
	    $.ajax({
	        type: 'GET',
	        url: '${contextPath}/message/getMessage', 
	        data: { roomId: roomId },
	        success: function(messages) {
	            // 최근 메시지를 가져옴
	            var latestMessage = messages[messages.length - 1];
	            var senderId = latestMessage.msgFrom;
	            var receiverId = latestMessage.msgTo;
	
	            // 메시지를 보낸 사용자가 현재 로그인한 사용자인지 확인
	            var isCurrentUserSender = senderId === currentUserId;
	
	            // 상대방의 ID 추출
	            var otherUserId = isCurrentUserSender ? receiverId : senderId;
	
	            console.log("상대방의 ID:", otherUserId);
	
	            
	            // 메세지 표시하기
	            displayMessages(messages);
	            // 채팅 입력 폼 생성
	            createChatInputForm(roomId, otherUserId, currentUserId);
	        },
	        error: function(xhr, status, error) {
	            console.error('메세지 불러오기에 실패함', error);
	        }
	    });
	    

	});
	
	
	
	// 서버에서 받은 메시지를 처리하여 화면에 표시하는 함수
	function displayMessages(messages) {
	    // 메시지를 표시할 영역을 선택하고 비움
	    var $card = $('.card');
	    var $cardbody = $('.card-body');
	    var $messageList = $('.conversation-list');
	    $messageList.empty();
	    
	    var currentUserID = document.getElementById('loginMemNo').value;
	    var profileImgPath = document.getElementById('profileImgPath').value;
	    var otherMem = document.getElementById('otherMem').value;
	    
	  
	    // 각 메시지를 순회하면서 화면에 추가
	    messages.forEach(function(message) {
	    		
	    		var $messageItem = $('<li class="clearfix">');
	        var $avatar = $('<div class="chat-avatar">');
	        var $messageText = $('<div class="conversation-text">');
	        var $ctextWrap = $('<div class="ctext-wrap">');
	        var $actions = $('<div class="conversation-actions dropdown">');

	        
	        // 보낸 메세지인지 받은 메세지인지 확인하여 오른쪽 또는 왼쪽에 배치
	        if (message.msgFrom === currentUserID) {
	            // 보낸 메세지일 경우 오른쪽에 배치
	            $messageItem.addClass('odd');
	            $avatar.append('<img src="${ contextPath }' + message.profileImgPath + '" class="rounded" />');
	            $ctextWrap.append('<i>' + message.msgFromName + '</i>');
	            $ctextWrap.append('<i>' + formatTimestamp(message.sendDate) + '</i>');
	        } else {
	            // 받은 메세지일 경우 왼쪽에 배치
	            $avatar.append('<img src="${ contextPath }' + message.profileImgPath + '" class="rounded" />');
	            $ctextWrap.append('<i>' + message.msgFromName + '</i>');
	            $ctextWrap.append('<i>' + formatTimestamp(message.sendDate) + '</i>');
	        }

	        $ctextWrap.append('<p>' + message.msgContent + '</p>');

	        $avatar.appendTo($messageItem);
	        $ctextWrap.appendTo($messageText);
	        $messageText.appendTo($messageItem);
	        $actions.appendTo($messageItem);

	        
	        // 메시지 항목을 목록에 추가
	        $messageList.append($messageItem);
	        
	        
	     		// 메시지를 모두 렌더링한 후 카드와 메시지 영역을 표시
	        $cardbody.removeClass('hidden');
	     		$card.removeClass('hidden');
	        
	        
	        // 채팅 입력 폼 생성
	        createChatInputForm();
	        
	        // 메시지를 모두 렌더링한 후 스크롤을 제일 아래로 이동
	        setTimeout(scrollToBottom, 100); // 100ms 지연 후 스크롤 이동
	        
	    });
	 		
	}
	

	

	// 채팅 입력 폼 생성 함수
	
	function createChatInputForm(roomId, otherUserId, currentUserId) {
	    // 이미 채팅 입력 폼이 존재하는지 확인
	    var $existingForm = $('.chat-input-form');
	    
	    if ($existingForm.length === 0) {
	        // 채팅 입력 폼이 존재하지 않는 경우, 새로 생성
	        var $formContainer = $('<div class="chat-input-form mt-2 bg-light p-3 rounded">');
	        var $form = $('<form action="' + contextPath + '/message/sendMessage" method="post" class="needs-validation" novalidate name="chat-form" id="chat-form"></form>');
	        var $row = $('<div class="row"></div>');
	        var $inputColumn = $('<div class="col mb-2 mb-sm-0"></div>');
	        var $textInput = $('<input type="text" name="msgContent" class="form-control border-0" placeholder="메세지를 입력하세요" required />');
	        var $receiverInput = $('<input type="hidden" name="msgTo" value="' + otherUserId + '">');
	        var $senderInput = $('<input type="hidden" name="msgFrom" value="' + currentUserId + '">');
	        var $chatRoomIdInput = $('<input type="hidden" name="msgRoNo" value="' + roomId + '">');
	        var $invalidFeedback = $('<div class="invalid-feedback">메세지를 입력한 후 전송 버튼을 눌러주세요!</div>');
	        var $buttonColumn = $('<div class="col-sm-auto"></div>');
	        var $buttonGroup = $('<div class="btn-group"></div>');
	        var $sendButton = $('<button type="button" class="btn btn-success chat-send w-100" onclick="sendMessage();"><i class="fe-send"></i></button>');
	
	        $inputColumn.append($textInput);
	        $inputColumn.append($receiverInput);
	        $inputColumn.append($senderInput);
	        $inputColumn.append($chatRoomIdInput);
	        $inputColumn.append($invalidFeedback);
	        $buttonGroup.append($sendButton);
	        $buttonColumn.append($buttonGroup);
	        $row.append($inputColumn);
	        $row.append($buttonColumn);
	        $form.append($row);
	        $formContainer.append($form);
	
	        // 채팅 입력 폼을 삽입할 위치 선택
	        var $chatRoom = $('.chat-room');
	        $chatRoom.append($formContainer);
	        
	    } else {
	        // 이미 채팅 입력 폼이 존재하는 경우, 값을 업데이트
	        $existingForm.find('input[name="msgTo"]').val(otherUserId);
	        $existingForm.find('input[name="msgFrom"]').val(currentUserId);
	        $existingForm.find('input[name="msgRoNo"]').val(roomId);
	    }
	}

	
	
	// 기존 대화방에서 신규 메세지 입력해서 전송하기
	function sendMessage() {
			
	    // 폼 데이터 가져오기
	    var formData = $('#chat-form').serialize();
	   
	    $.ajax({
	        url: $('#chat-form').attr('action'), // 폼의 action 속성 값 가져오기
	        type: $('#chat-form').attr('method'), // 폼의 method 속성 값 가져오기
	        data: formData, // 폼 데이터 전송
	        success: function(response) {
	            // 요청이 성공한 경우의 처리
	            console.log('요청이 성공했습니다.');
	            
	        		 // 입력 폼 비우기
	            $('#chat-form')[0].reset();
	        		 
	            
	            var $messageItem = $('<li class="clearfix">');
			        var $avatar = $('<div class="chat-avatar">');
			        var $messageText = $('<div class="conversation-text">');
			        var $ctextWrap = $('<div class="ctext-wrap">');
		        	var $actions = $('<div class="conversation-actions dropdown">');
	            	
	            
	            var currentUserID = document.getElementById('loginMemName').value;
	            
	            // 응답이 null이 아닌 경우에만 처리
	            if (response) {
		            	// 보낸 메세지인지 받은 메세지인지 확인하여 오른쪽 또는 왼쪽에 배치
		    	        if (response.msgFrom === currentUserID) {
		    	            // 보낸 메세지일 경우 오른쪽에 배치
		    	            $messageItem.addClass('odd');
		    	            $avatar.append('<img src="${ contextPath }' + response.profileImgPath + '" class="rounded" />');
		    	            $ctextWrap.append('<i>' + response.msgFrom + '</i>');
		    	            $ctextWrap.append('<i>' + formatTimestamp(response.sendDate) + '</i>');
		    	        } else {
		    	            // 받은 메세지일 경우 왼쪽에 배치
		    	            $avatar.append('<img src="${ contextPath }' + response.profileImgPath + '" class="rounded" />');
		    	            $ctextWrap.append('<i>' + response.msgFrom + '</i>');
		    	            $ctextWrap.append('<i>' + formatTimestamp(response.sendDate) + '</i>');
		    	        }
	
		    	        $ctextWrap.append('<p>' + response.msgContent + '</p>');
	
		    	        $avatar.appendTo($messageItem);
		    	        $ctextWrap.appendTo($messageText);
		    	        $messageText.appendTo($messageItem);
		    	        $actions.appendTo($messageItem);

	                // 메시지 항목을 목록에 추가
	                $('.conversation-list').append($messageItem);

	                // 스크롤을 맨 아래로 이동
	                scrollToBottom();
	                
	                // 채팅방 리스트 리로드
	                reloadChatRoomList();
	                
	                
	            }
	        },
	        error: function(xhr, status, error) {
	            // 요청이 실패한 경우의 처리
	            console.error('요청이 실패했습니다.');
	            console.error(status);
	            console.error(error);
	        }
	    });
	}

	
	
	
	
	
	
	// 새로운 쪽지 보내기 버튼 클릭 시 - 팝업창 열기 (기존 대화방 말고 새 대화방)
	function openEmployeeListPopup() {
	    // 현재 대화방 내용을 초기화
	    $('.conversation-list').empty();
	    $('.chat-room').empty();
	    
	    
	    // card, card-body 흰 부분 삭제
      $('.card-body').addClass('hidden');
  		$('.card').addClass('hidden');
  		
	    
	    // 채팅방 상대방 정보 제거
	    $('.message-area.card-body .d-flex.align-items-start').remove();
	
	    // 팝업 창 열기
	    var currentMemNo = document.getElementById('loginMemNo').value;
	    const encodedCurrentMemNo = encodeURIComponent(currentMemNo);
	    
	    // 현재 대화방 직원 목록 가져오기
	    var currentChatMembers = getAllChatMembers();
	
	    const encodedCurrentChatMembers = encodeURIComponent(JSON.stringify(currentChatMembers));
	    const popup = window.open('${contextPath}/message/empListPopUp?currentMemNo=' + encodedCurrentMemNo + '&currentChatMembers=' + encodedCurrentChatMembers, '직원 목록', 'width=600,height=750');
		
		}

		// 현재(기존) 대화방 직원 목록 가져오기
		function getAllChatMembers() {
		    var allChatMembers = [];
		
		    $('.d-flex.align-items-start.p-2').each(function() {
		        var otherMem = $(this).find('#otherMem').val();

		        allChatMembers.push(otherMem);
		    });
		
		    return allChatMembers;
		}


	
	// 전달 받은 직원번호로 새로운 대화방 생성하기
	function receiveEmpInfo(memNo, memName, deptName, deptNo, status, profileImgPath) {
		
			var currentUserId = document.getElementById('loginMemNo').value;
			
			// 대화방을 생성하기 전 카드와 메시지 영역을 표시
      $('.card-body').removeClass('hidden');
  		$('.card').removeClass('hidden');
  		
	     		
			createChatRoomUI(memNo, memName, deptName, deptNo, status, profileImgPath, currentUserId);
			
  }

	function createChatRoomUI(memNo, memName, deptName, deptNo, status, profileImgPath, currentUserId) {
		
			// 초기화: 방 번호 초기화
	    roomId = null;
	
	    var $conversationInfo = $('<div class="d-flex align-items-start"></div>');
	    $conversationInfo.append('<img src="'+ profileImgPath +'" class="me-2 rounded-circle" height="30" >');
	    $conversationInfo.append('<div><h5 class="mt-0 mb-0 font-15"><a href="contacts-profile.html" class="text-reset">'+ memName +'</a></h5></div>');

	    // 이전에 추가한 대화 상대방 정보를 모두 제거
	    $('.message-area.card-body .d-flex.align-items-start').remove();
	    $('.message-area.card-body').prepend($conversationInfo);
	    
	    var $chatRoom = $('<div class="chat-room"></div>');
	    var $formContainer = $('<div class="chat-input-form mt-2 bg-light p-3 rounded">');
	    var $form = $('<form action="' + contextPath + '/message/createNewMessage" method="post" class="needs-validation" novalidate name="new-chat-form" id="new-chat-form"></form>');
	    var $row = $('<div class="row"></div>');
	    var $inputColumn = $('<div class="col mb-2 mb-sm-0"></div>');
	    var $textInput = $('<input type="text" name="msgContent" class="form-control border-0" placeholder="메세지를 입력하세요" required />');
	    var $receiverInput = $('<input type="hidden" name="msgTo" value="' + memNo + '">');
	    var $senderInput = $('<input type="hidden" name="msgFrom" value="' + currentUserId + '">');
	    var $invalidFeedback = $('<div class="invalid-feedback">메세지를 입력한 후 전송 버튼을 눌러주세요!</div>');
	    var $buttonColumn = $('<div class="col-sm-auto"></div>');
	    var $buttonGroup = $('<div class="btn-group"></div>');
	    var $sendButton = $('<button type="button" class="btn btn-success chat-send w-100" onclick="createNewMessage();"><i class="fe-send"></i></button>');

	    $inputColumn.append($textInput);
	    $inputColumn.append($receiverInput);
	    $inputColumn.append($senderInput);
	    $inputColumn.append($invalidFeedback);
	    $buttonGroup.append($sendButton);
	    $buttonColumn.append($buttonGroup);
	    $row.append($inputColumn);
	    $row.append($buttonColumn);
	    $form.append($row);
	    $formContainer.append($form);
	    $chatRoom.append($formContainer);

	    // 채팅방을 삽입할 위치 선택
	    $('.message-area.card-body').append($chatRoom);
	    
	}


	
	// 방 번호를 저장할 전역 변수
	var roomId = null;
	
	// 새 채팅방에서 새 채팅 메세지 작성
	function createNewMessage() {
		
		// 폼 데이터 가져오기
    var formDataArray = $('#new-chat-form').serializeArray();
    var formData = {};
    $.each(formDataArray, function() {
        formData[this.name] = this.value;
    });
		
	    // 방 번호가 이미 할당되어 있는지 확인
	    if (roomId === null) {
	    	$.ajax({
		        url: $('#new-chat-form').attr('action'), 
		        type: $('#new-chat-form').attr('method'), 
		        data: formData, // 폼 데이터 전송
		        success: function(response) {
		            console.log('요청이 성공했습니다.');
		            
		            roomId = response.msgRoNo;
		            console.log(roomId);
		            
		        		 // 입력 폼 비우기
		            $('#new-chat-form')[0].reset();
		            
		            var $messageItem = $('<li class="clearfix">');
				        var $avatar = $('<div class="chat-avatar">');
				        var $messageText = $('<div class="conversation-text">');
				        var $ctextWrap = $('<div class="ctext-wrap">');
			        	var $actions = $('<div class="conversation-actions dropdown">');
		            
		            var currentUserID = document.getElementById('loginMemName').value;
		            
		            // 응답이 null이 아닌 경우에만 처리
		            if (response) {
			            	// 보낸 메세지인지 받은 메세지인지 확인하여 오른쪽 또는 왼쪽에 배치
			    	        if (response.msgFrom === currentUserID) {
			    	            // 보낸 메세지일 경우 오른쪽에 배치
			    	            $messageItem.addClass('odd');
			    	            $avatar.append('<img src="${ contextPath }' + response.profileImgPath + '" class="rounded" />');
			    	            $ctextWrap.append('<i>' + response.msgFrom + '</i>');
			    	            $ctextWrap.append('<i>' + formatTimestamp(response.sendDate) + '</i>');
			    	        } else {
			    	            // 받은 메세지일 경우 왼쪽에 배치
			    	            $avatar.append('<img src="${ contextPath }' + response.profileImgPath + '" class="rounded" />');
			    	            $ctextWrap.append('<i>' + response.msgFrom + '</i>');
			    	            $ctextWrap.append('<i>' + formatTimestamp(response.sendDate) + '</i>');
			    	        }
		
			    	        $ctextWrap.append('<p>' + response.msgContent + '</p>');
		
			    	        $avatar.appendTo($messageItem);
			    	        $ctextWrap.appendTo($messageText);
			    	        $messageText.appendTo($messageItem);
			    	        $actions.appendTo($messageItem);

		                // 메시지 항목을 목록에 추가
		                $('.conversation-list').append($messageItem);

		                // 스크롤을 맨 아래로 이동
		                scrollToBottom();
		                
		             		// 채팅방 리스트 리로드
		                reloadChatRoomList();
		            }
		        },
		        error: function(request, status, error) {
		            // 요청이 실패한 경우의 처리
		            console.error('요청이 실패했습니다.');
		        }
		    });
			
			
	    } else {
	        // 방 번호가 이미 할당되어 있으면 해당 방 번호를 사용하여 메세지 전송
	        
	        // formData와 추가 데이터를 병합하여 하나의 객체로 만들기
        	var dataToSend = $.extend({}, formData, { msgRoNo: roomId });
	        
	        
	    	$.ajax({
		        url: '${contextPath}/message/newRoomSecondMessage',
		        type: 'post',
		        data:  dataToSend,
		        success: function(response) {
		            // 요청이 성공한 경우의 처리
		            console.log('요청이 성공했습니다.');
		            
		        		 // 입력 폼 비우기
		            $('#new-chat-form')[0].reset();
		            
		            var $messageItem = $('<li class="clearfix">');
				        var $avatar = $('<div class="chat-avatar">');
				        var $messageText = $('<div class="conversation-text">');
				        var $ctextWrap = $('<div class="ctext-wrap">');
			        	var $actions = $('<div class="conversation-actions dropdown">');
		            	
		            
		            var currentUserID = document.getElementById('loginMemName').value;
		            
		            // 응답이 null이 아닌 경우에만 처리
		            if (response) {
			            	// 보낸 메세지인지 받은 메세지인지 확인하여 오른쪽 또는 왼쪽에 배치
			    	        if (response.msgFrom === currentUserID) {
			    	            // 보낸 메세지일 경우 오른쪽에 배치
			    	            $messageItem.addClass('odd');
			    	            $avatar.append('<img src="${ contextPath }' + response.profileImgPath + '" class="rounded" />');
			    	            $ctextWrap.append('<i>' + response.msgFrom + '</i>');
			    	            $ctextWrap.append('<i>' + formatTimestamp(response.sendDate) + '</i>');
			    	        } else {
			    	            // 받은 메세지일 경우 왼쪽에 배치
			    	            $avatar.append('<img src="${ contextPath }' + response.profileImgPath + '" class="rounded" />');
			    	            $ctextWrap.append('<i>' + response.msgFrom + '</i>');
			    	            $ctextWrap.append('<i>' + formatTimestamp(response.sendDate) + '</i>');
			    	        }
		
			    	        $ctextWrap.append('<p>' + response.msgContent + '</p>');
		
			    	        $avatar.appendTo($messageItem);
			    	        $ctextWrap.appendTo($messageText);
			    	        $messageText.appendTo($messageItem);
			    	        $actions.appendTo($messageItem);

		                // 메시지 항목을 목록에 추가
		                $('.conversation-list').append($messageItem);

		                // 스크롤을 맨 아래로 이동
		                scrollToBottom();
		                
		                // 채팅방 리스트 리로드
		                reloadChatRoomList();
		                
		                
		            }
		        },
		        error: function(xhr, status, error) {
		            // 요청이 실패한 경우의 처리
		            console.error('요청이 실패했습니다.');
		            console.error(status);
		            console.error(error);
		        }
		    });
	    }
		
	    
	}


</script>






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

			<div class="content" style="background : #F2E8DA;">

                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                      	<ol class="breadcrumb m-0">
					                              		<li class="breadcrumb-item"><a href="javascript: void(0);">FOLLOW ME</a></li>
					                                  <li class="breadcrumb-item"><a href="javascript: void(0);">쪽지함</a></li>
					                                  <li class="breadcrumb-item active">쪽지함</li>
					                              </ol>
                                    </div>
                                    <h4 class="page-title">쪽지함</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="row">
                            <!-- start chat users-->
                            <div class="col-xl-3 col-lg-4">
                                <div class="card" style="overflow-y:auto;">
                                    <div class="card-body" style="height: 700px;">

                                      <button type="button" class="btn btn-danger waves-effect waves-light" onclick="openEmployeeListPopup()">
                                      <i class="mdi mdi-plus-circle me-1"></i> 새로운 쪽지 보내기</button>
                                       
                                       
                                      <br><br>
                                      	<!--  채팅방 리스트 - 비동기로 불러올 내역 -->
																				<div id="chat-room-list"> 
																				
																				
																				
																				
                                     		</div>
                                     		
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div>
                            <!-- end chat users-->

                            <!-- chat area -->
                            <div class="col-xl-9 col-lg-8">
														    <div class="card hidden">
														        <div class="message-area card-body hidden" style="max-height: 600px; overflow-y: auto;">
																		    <ul class="conversation-list" style="margin-top:30px;">
																		        <!-- 채팅 내용 -->
																		    </ul>
																		</div>
																		
																		
																		<!-- 채팅 입력창 내용 -->
																		<div class="chat-room">
																		    
																		</div>

														        <!-- end card-body -->                                    
														    </div> <!-- end card -->
														</div>
                            <!-- end chat area-->

                        </div> <!-- end row-->
                        
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
        <script src="${ contextPath }/assets/js/vendor.min.js"></script>

        <!-- App js -->
        <script src="${ contextPath }/assets/js/app.min.js"></script>
			

      <!-- ============================================================== -->
      <!-- <-- End Page Content
      <!-- ============================================================== -->
      
      

	
	
</body>
</html>