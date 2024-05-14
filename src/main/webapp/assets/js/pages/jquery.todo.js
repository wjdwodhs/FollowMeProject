!function(t) {
  "use strict";

  function o() {
    this.$body = t("body"), this.$todoContainer = t("#todo-container"), this.$todoMessage = t("#todo-message"), this.$todoRemaining = t("#todo-remaining"), this.$todoTotal = t("#todo-total"), this.$archiveBtn = t("#btn-archive"), this.$todoList = t("#todo-list"), this.$todoDonechk = ".todo-done", this.$todoForm = t("#todo-form"), this.$todoInput = t("#todo-input-text"), this.$todoBtn = t("#todo-btn-submit"), this.$todoData = [], this.$todoCompletedData = [], this.$todoUnCompletedData = []
  }
  
  o.prototype.markTodo = function(t, o) {
    for (var e = 0; e < this.$todoData.length; e++) this.$todoData[e].id == t && (this.$todoData[e].done = o)
  };
  
  o.prototype.addTodo = function() {
    var self = this;
    
    // todo 입력 필드에서 값 가져오기
    var todoText = $('#todo-input-text').val();

    if (todoText.trim() === '') {
        $('#todo-input-text').addClass('is-invalid');
        return;
    }

    $.ajax({
        type: 'POST',
        url: 'ceoMain/insertTodo',
        data: { todoText: todoText },
        success: function(response) {
            
            $('#todo-input-text').val('');
            $('#todo-input-text').removeClass('is-invalid');
           
            // 서버에서 받은 번호를 사용하여 Todo를 추가
						for (var i = 0; i < response.length; i++) {
						    var newTodo = {
						        id: response[i].todoNo,
						        text: response[i].content,
						        done: response[i].todoDone
						    };
						
						    self.$todoData.push(newTodo);
						}

            self.$todoData.push(newTodo);
            
            // 새로운 To-do를 추가한 후 UI를 갱신
            self.generate();
        },
        error: function(xhr, status, error) {
            console.error('Todo 추가 중 오류가 발생했습니다:', error);
        }
    });
};

  o.prototype.deleteTodo = function(t) {
    var self = this;

    // 서버에 삭제 요청 보내기
    $.ajax({
        type: 'POST',
        url: 'ceoMain/deleteTodo', 
        data: { todoNo: t }, 
        success: function(response) {
            console.log('To-do가 성공적으로 삭제되었습니다.');
            // 서버에서의 삭제가 성공했을 때에만 클라이언트의 UI를 갱신
            self.$todoData = self.$todoData.filter(function(e) {
                return e.id != t;
            });
            self.generate(); // UI 갱신
        },
        error: function(xhr, status, error) {
            console.error('Todo 삭제 중 오류가 발생했습니다:', error);
        }
    });
};
  
  o.prototype.loadTodos = function() {
    var self = this;
    
    // 서버에서 To-do 목록을 가져오는 AJAX 요청
    $.ajax({
        type: 'GET',
        url: 'ceoMain/getTodo', 
        success: function(response) {
        		console.log(response);
        		
            // 클라이언트의 todoData를 초기화
            self.$todoData = [];
            
            // 서버에서 받은 각 To-do 항목을 클라이언트의 todoData에 추가
            for (var i = 0; i < response.todoList.length; i++) {
                self.$todoData.push({
                    id: response.todoList[i].todoNo,
                    text: response.todoList[i].content,
                    done: response.todoList[i].todoDone
                });
            }
            
            // UI를 갱신하여 불러온 To-do 목록을 화면에 표시
            self.generate();  
        },
        error: function(xhr, status, error) {
            console.error('Todo 목록 불러오기 중 오류가 발생했습니다:', error);
        }
    });
};
  
  
  o.prototype.archives = function() {
    this.$todoUnCompletedData = [];
    for (var t = 0; t < this.$todoData.length; t++) {
      var o = this.$todoData[t];
      1 == o.done ? this.$todoCompletedData.push(o) : this.$todoUnCompletedData.push(o)
    }
    this.$todoData = [], this.$todoData = [].concat(this.$todoUnCompletedData), this.generate()
  };
  
  o.prototype.generate = function() {
    console.log("Generate"), this.$todoList.html("");
    for (var t = 0, o = 0; o < this.$todoData.length; o++) {
      var e = this.$todoData[o];
      if (!e.done) {
        t += 1;
        this.$todoList.prepend('<li class="list-group-item border-0 ps-0"><div class="form-check"><input type="checkbox" class="form-check-input todo-done" id="todo-' + e.id + '"><label class="form-check-label" for="todo-' + e.id + '">' + e.text + "</label></div></li>");
      }
    }
    this.$todoTotal.text(this.$todoData.length), this.$todoRemaining.text(t)
  };
  
  o.prototype.init = function() {
    var o = this;
    window.addEventListener("load", function() {
     	o.loadTodos(); // 화면 로드 시 Todo 목록 불러오기
      o.generate()
    }), o.$archiveBtn.on("click", function(t) {
      return t.preventDefault(), o.archives(), !1
    }), t(document).on("change", this.$todoDonechk, function() {
      if (this.checked) {
        var todoId = t(this).attr("id").replace("todo-", ""); // 체크된 체크박스의 id에서 'todo-'를 제거하여 실제 todo의 id를 추출
        o.deleteTodo(todoId);
      }
    }), o.$todoForm.on("submit", function(t) {
      return t.preventDefault(), "" == o.$todoInput.val() || void 0 === o.$todoInput.val() || null == o.$todoInput.val() ? (o.$todoInput.focus(), !1) : (o.addTodo(o.$todoInput.val()), o.$todoInput.val(""), o.$todoForm.removeClass("was-validated"), setTimeout(function() {
        o.$todoForm.removeClass("was-validated")
      }), !0)
    })
  };
  
  t.TodoApp = new o, t.TodoApp.Constructor = o
}(window.jQuery),
function() {
  "use strict";
  window.jQuery.TodoApp.init()
}();
