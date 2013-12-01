// $(function () {  
//   $("#question").on('click', ".submit-answer", function(event) {
//     var correct = is_correct();
//   	me = $(this);
//     if (!correct) {
//       $("#answer").focus();
//     }
//     toggle_class(me, 2, correct ? "btn-success" : "btn-danger", "btn-primary");
//   	return correct;
//   })

//   .on('click', ".request-hint", function(event) {
//     event.preventDefault();
    
//     correct_answer = $("#correct_answer").val();
//     answer_elem = $("#answer");
//     answer = answer_elem.val();
    
//     if (is_correct()) {
//       toggle_class($(".submit-answer"), 2, "btn-success", "btn-primary");
//       return;
//     }
//     else {
//       var error_index = find_error_index();
//       if (error_index != -1) {
//         answer_elem.val(answer_elem.val().slice(0, error_index));
//       }
//       else {
//         add_correct_word();
//       }
//     }
//     answer_elem.focus();
//   });
// });

$(function() {
  $(document).on('change', '#category_id', function() {
    $("#category_form").submit();
  });
});

function toggle_class(elem, toRemove, toAdd) {
  elem.removeClass(toRemove);
  elem.addClass(toAdd);
}

// function toggle_class(btn, count, new_cls, start_cls) {
//   if (count <= 0) { return; }
//   btn.removeClass(start_cls);
//   btn.addClass(new_cls);
//   setTimeout(function() {
//   	btn.removeClass(new_cls);
//   	btn.addClass(start_cls);
//   	setTimeout(function() {
//   	  toggle_class(btn, count-1, new_cls, start_cls);
//   	}, 150);
//   }, 150);
// }

// function is_correct() {
//   var to = $("#answer");
//   to.val(to.val().trim());
//   return to.val() === $("#correct_answer").val();
// }

// function find_error_index() {
//   var i = 0;
//   var len = Math.min(answer.length, correct_answer.length);
//   while (i < len) {
//     if (answer[i] !== correct_answer[i]) {
//       return i;
//     }
//     i++;
//   }
//   return answer.length > correct_answer.length ? correct_answer.length : -1;
// }

// function add_correct_char() {
//   var len = answer.length;
//   if (correct_answer.length > len) {
//     answer_elem.val(answer + correct_answer[len]);
//   }
// }

// function add_correct_word() {
//   var len = answer.length;
//   if (correct_answer.length > len) {
//     var i = correct_answer.indexOf(" ", len+1);
//     var hintBtn = $(".request-hint");
//     hintBtn.prop('disabled', true);
//     answer_elem.val(answer + correct_answer.slice(len, i === -1 ? correct_answer.length : i));
//     setTimeout(function() {
//       answer_elem.val(answer);
//       hintBtn.prop('disabled', false);
//     }, 500);
//   }
// }

// $(function(){
//   $(".more_info").popover({trigger: "hover"});
// });