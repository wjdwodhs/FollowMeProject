! function(t) {
  "use strict";

  function o() {
    this.$body = t("body"), this.$todoContainer = t("#todo-container"), this.$todoMessage = t("#todo-message"), this.$todoRemaining = t("#todo-remaining"), this.$todoTotal = t("#todo-total"), this.$archiveBtn = t("#btn-archive"), this.$todoList = t("#todo-list"), this.$todoDonechk = ".todo-done", this.$todoForm = t("#todo-form"), this.$todoInput = t("#todo-input-text"), this.$todoBtn = t("#todo-btn-submit"), this.$todoData = [{
      id: "1",
      text: "금주 베스트 상품 추가 매입",
      done: !1
    }], this.$todoCompletedData = [], this.$todoUnCompletedData = []
  }
  o.prototype.markTodo = function(t, o) {
    for (var e = 0; e < this.$todoData.length; e++) this.$todoData[e].id == t && (this.$todoData[e].done = o)
  }, o.prototype.addTodo = function(t) {
    this.$todoData.push({
      id: this.$todoData.length,
      text: t,
      done: !1
    }), this.generate()
  }, o.prototype.archives = function() {
    this.$todoUnCompletedData = [];
    for (var t = 0; t < this.$todoData.length; t++) {
      var o = this.$todoData[t];
      1 == o.done ? this.$todoCompletedData.push(o) : this.$todoUnCompletedData.push(o)
    }
    this.$todoData = [], this.$todoData = [].concat(this.$todoUnCompletedData), this.generate()
  }, o.prototype.generate = function() {
    console.log("Generate"), this.$todoList.html("");
    for (var t = 0, o = 0; o < this.$todoData.length; o++) {
      var e = this.$todoData[o];
      if (!e.done) {
        t += 1;
        this.$todoList.prepend('<li class="list-group-item border-0 ps-0"><div class="form-check"><input type="checkbox" class="form-check-input todo-done" id="' + e.id + '"><label class="form-check-label" for="' + e.id + '">' + e.text + "</label></div></li>");
      }
    }
    this.$todoTotal.text(this.$todoData.length), this.$todoRemaining.text(t)
  }, o.prototype.init = function() {
    var o = this;
    window.addEventListener("load", function() {
      o.generate()
    }), o.$archiveBtn.on("click", function(t) {
      return t.preventDefault(), o.archives(), !1
    }), t(document).on("change", this.$todoDonechk, function() {
      if (this.checked) {
        o.markTodo(t(this).attr("id"), !0);
      }
      o.generate();
    }), o.$todoForm.on("submit", function(t) {
      return t.preventDefault(), "" == o.$todoInput.val() || void 0 === o.$todoInput.val() || null == o.$todoInput.val() ? (o.$todoInput.focus(), !1) : (o.addTodo(o.$todoInput.val()), o.$todoInput.val(""), o.$todoForm.removeClass("was-validated"), setTimeout(function() {
        o.$todoForm.removeClass("was-validated")
      }), !0)
    })
  }, t.TodoApp = new o, t.TodoApp.Constructor = o
}(window.jQuery),
function() {
  "use strict";
  window.jQuery.TodoApp.init()
}();
