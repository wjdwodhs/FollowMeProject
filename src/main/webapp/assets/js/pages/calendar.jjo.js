(function($) {
    "use strict";

    var CalendarApp = {
        $body: $("body"),
        $modal: $("#event-modal"),
        $calendar: $("#calendar"),
        $formEvent: $("#form-event"),
        $btnNewEvent: $("#btn-new-event"),
        $btnDeleteEvent: $("#btn-delete-event"),
        $btnSaveEvent: $("#btn-save-event"),
        $modalTitle: $("#modal-title"),
        $calendarObj: null,
        $selectedEvent: null,
        $newEventData: null,

        init: function() {
            var self = this;

            self.$modal = new bootstrap.Modal(document.getElementById("event-modal"), {
                keyboard: false
            });

            var now = new Date($.now());

            new FullCalendar.Draggable(document.getElementById("external-events"), {
                itemSelector: ".external-event",
                eventData: function(eventEl) {
                    return {
                        title: eventEl.innerText,
                        className: $(eventEl).data("class")
                    };
                }
            });

            var initialEvents = [ // 데이터 들어가는 영역
            
            ];

            var holidaySource = {
                googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
                backgroundColor: 'red'
            };

            self.$calendarObj = new FullCalendar.Calendar(self.$calendar[0], {
                slotDuration: "00:15:00",
                slotMinTime: "08:00:00",
                slotMaxTime: "19:00:00",
                themeSystem: "bootstrap",
                bootstrapFontAwesome: false,
                buttonText: {
                    today: "이번달",
                    month: "월별",
                    week: "주간",
                    day: "일별",
                    list: "오늘의 일정",
                    prev: "이전",
                    next: "다음"
                },
                initialView: "dayGridMonth",
                handleWindowResize: true,
                height: $(window).height() - 200,
                headerToolbar: {
                    left: "prev today",
                    center: "title",
                    right: "next"
                },
                initialEvents: initialEvents,
                eventSources: [holidaySource], // 공휴일 추가
                editable: true,
                droppable: true,
                selectable: true,
                dateClick: function(info) {
                    self.onSelect(info);
                },
                eventClick: function(info) {
                    self.onEventClick(info);
                },
                googleCalendarApiKey: 'AIzaSyC0QldKNU6DxP9twtldrmsnfJPimNvzRXo' // Google Calendar API 키 추가
            });

            self.$calendarObj.render();

            self.$btnNewEvent.on("click", function() {
                self.onSelect({
                    date: new Date(),
                    allDay: true
                });
            });

            self.$formEvent.on("submit", function(e) {
                e.preventDefault();
                var formData = self.$formEvent[0];
                if (formData.checkValidity()) {
                    if (self.$selectedEvent) {
                        self.$selectedEvent.setProp("title", $("#event-title").val());
                        self.$selectedEvent.setProp("classNames", [$("#event-category").val()]);
                    } else {
                        var eventData = {
                            title: $("#event-title").val(),
                            start: self.$newEventData.date,
                            allDay: self.$newEventData.allDay,
                            className: $("#event-category").val()
                        };
                        self.$calendarObj.addEvent(eventData);
                    }
                    self.$modal.hide();
                } else {
                    e.stopPropagation();
                    formData.classList.add("was-validated");
                }
            });

            self.$btnDeleteEvent.on("click", function() {
                if (self.$selectedEvent) {
                    self.$selectedEvent.remove();
                    self.$selectedEvent = null;
                    self.$modal.hide();
                }
            });
        }

        

        
    };

    $(document).ready(function() {
        CalendarApp.init();
    });

})(window.jQuery);