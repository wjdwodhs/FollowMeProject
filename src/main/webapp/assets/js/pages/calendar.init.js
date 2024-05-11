document.addEventListener('DOMContentLoaded', function () {
            $(function () {
                var request = $.ajax({
                    url: "/follow/calendar/calendar.do", // 변경하기
                    method: "GET",
                    dataType: "json"
                });
 
                request.done(function (data) {
                    console.log(data); // log 로 데이터 찍어주기.
                    const targetDiv = document.getElementById('calendar');
                    console.log(holidayList);
                    const holidaySource = {
                        googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
                        backgroundColor: 'red'  // rgb code 대체 가능
                    }

                    // event 함수 정의
                    const dateClickEvent = (info) => { // clickevent => 공휴일버튼 클릭, dateclick => 달력 날짜클릭
                        // todo 
                        const selectedDate = new Date(info.dateStr); // ex 05/07 
                        info.backgroundColor='red';
                        // 일요일 체크
                        if (selectedDate.getDay() === 0) { // 일요일 0 
                            alert('일요일');
                            return;
                        }

                        // 토요일 체크
                        if (selectedDate.getDay() === 6) { // 토요일 6
                            alert('토요일');
                            return;
                        }

                        // 공휴일 체크
                        const isHoliday = holidayList.includes(selectedDate.getTime()); // 페이지 로드시 배열안에 있는 유닉스코드면 공휴일로 지정
                        if (isHoliday ===  true) {
                            alert('공휴일');
                            return;
                        } 
                    }

                    const eventClickEvent = (info) => { // fucntion(info)
                        // todo 
                        alert(`선택하신 날은 ${info.event.title} 입니다`);
                    }


                    // 캘린더 설정
                    const calendar = new FullCalendar.Calendar(targetDiv, {
                        slotDuration: "00:15:00",
                        slotMinTime: "08:00:00",
                        slotMaxTime: "19:00:00",
                        themeSystem: "bootstrap",
                        height: '350px',  
                        customButtons:{
                        PlusButton:{
                          text:"일정 추가하기",
                          click : function(){
                                //부트스트랩 모달 열기
                                $("#event-modal").modal("show");              
                          }
                        },
                        SaveButton:{ // 생성된 이벤트 DB에 저장
                          text:"저장하기",
                          click: async function () {
                            if (confirm("저장하시겠습니까?")) {
                              //지금까지 생성된 모든 이벤트 저장하기
                              var allEvent = calendar.getEvents();
                              console.log("모든 이벤트들", allEvent);
                              //이벤트 저장하기
                              const saveEvent = await axios({ // ajax로 변경
                                method: "POST",
                                url: "/calendar",
                                data: allEvent,
                              });
                            }
                          },
                        }
                      },
                        bootstrapFontAwesome: false,
                        buttonText: {
                            today: "오늘",
                            month: "월별",
                            week: "주간",
                            day: "일별",
                            list: "오늘의 일정",
                            prev: "이전",
                            next: "다음"
                        },
                        initialView: "dayGridMonth", // 초기 로드 될때 보이는 캘린더 화면 (기본설정 : 달)
                        titleFormat: function (date) { // title부문 한글로 Ex) 2024년 5월
                          year = date.date.year;
                          month = date.date.month + 1;

                          return year + "년 " + month + "월";
                        },
                        handleWindowResize: true,
                        headerToolbar: {
                            left: "prev,next today",
                            center: "title",
                            right: "dayGridMonth,timeGridWeek,timeGridDay"
                        },
                        eventSources: [holidaySource], // 공휴일 추가
                        //locale:'ko', 한국어 설정
                        editable: false,
                        droppable: false,
                        selectable: true,
                        events:data, // DB에서 data로 넘겨주는부분
                        dateClick: function(eventInfo) {     // 날짜 선택 이벤트
                            // info data 확인
                            // console.log(eventInfo);
                            console.log(eventInfo);
                            dateClickEvent(eventInfo);
                        },
                        eventClick: function(eventInfo) {    // 일정 선택 이벤트
                            // 구글 캘린더로 자동이동을 막음
                            eventInfo.jsEvent.preventDefault();      

                            // info data 확인
                            // console.log(eventInfo);
                            eventClickEvent(eventInfo);
                        },
                        googleCalendarApiKey: 'AIzaSyC0QldKNU6DxP9twtldrmsnfJPimNvzRXo'
                    });
                    //모달창 이벤트 화면에 생성
                      $("#btn-save-event").on("click", function () {
                            var eventData = {
                              title: $("#event-title").val(),
                              content: $("#event-content").val(),
                              start: $("#event-start").val(),
                              end: $("#event-end").val(),
                              category: $("#event-category").val(),
                            };
                            //빈값입력시 오류
                            if (
                              eventData.title == "" ||
                              eventData.start == "" ||
                              eventData.end == ""
                            ) {
                              alert("입력하지 않은 값이 있습니다.");

                              //끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
                            } else if ($("#start").val() > $("#end").val()) {
                              alert("시간을 잘못입력 하셨습니다.");
                            } else {
                              // 이벤트 추가
                              calendar.addEvent(eventData);
                              $("#event-modal").modal("hide"); // 모달창 닫고 초기화
                              $("#event-title").val("");
                              $("#event-content").val("");
                              $("#event-start").val("");
                              $("#event-end").val("");
                              $("#event-category").val("");
                            }
                          });
                           
                    calendar.render();
                });
 
            });
 
        });