(function ($, undefined) {
    $.fn.getSelectionStart = function() {
        var el = $(this).get(0);
        var pos = 0;
        if('selectionStart' in el) {
            pos = el.selectionStart;
        } else if('selection' in document) {
            el.focus();
            var Sel = document.selection.createRange();
            var SelLength = document.selection.createRange().text.length;
            Sel.moveStart('character', -el.value.length);
            pos = Sel.text.length - SelLength;
        }
        return pos;
    }
})(jQuery);

(function ($, undefined) {
    $.fn.getSelectionEnd = function() {
        var el = $(this).get(0);
        var pos = 0;
        if('selectionEnd' in el) {
            pos = el.selectionEnd;
        } else if('selection' in document) {
            el.focus();
            var Sel = document.selection.createRange();
            var SelLength = document.selection.createRange().text.length;
            Sel.moveStart('character', -el.value.length);
            pos = Sel.text.length;
        }
        return pos;
    }
})(jQuery);

(function ($, undefined) {
  $.fn.setCursorPosition = function(pos) {
    if ($(this).get(0).setSelectionRange) {
      $(this).get(0).setSelectionRange(pos, pos);
    } else if ($(this).get(0).createTextRange) {
      var range = $(this).get(0).createTextRange();
      range.collapse(true);
      range.moveEnd('character', pos);
      range.moveStart('character', pos);
      range.select();
    }
  }
})(jQuery);

function insertCharacter(character) {
  if(typeof lastFocus == 'undefined') { return; }
  lastFocus.val(function(index, val) {
    return [val.slice(0, selStart), character, val.slice(selEnd)].join('');
  });
  lastFocus.focus();
  lastFocus.setCursorPosition(selStart+1);
}

function replaceCharacter(elem, pos, char) {
  elem.val(function(index, val) {
    return [val.slice(0, pos-1), char, val.slice(pos)].join('');
  });
  elem.setCursorPosition(pos);
}

$(function () {  
  $(document).on("blur", "input[type=text], textarea", function() {
    lastFocus = $(this);
   	selStart = lastFocus.getSelectionStart();
   	selEnd = lastFocus.getSelectionEnd();
  })

  .on("keypress", "input[type=text], textarea", function(event) {
    var txt_elem = $(this);
    var selStart = txt_elem.getSelectionStart();
    if (txt_elem.val().length > 0 && txt_elem.val()[selStart-1] === "\\") {
      var mapped_chars = [["ß", "s"], ["ä", "a"], ["Ä", "A"], ["ö", "o"], ["Ö", "O"], ["ü", "u"], ["Ü", "U"]];
      var german_char = false;
      var i = mapped_chars.length;
      while (i--) {
        if (mapped_chars[i][1] === String.fromCharCode(event.which)) {
          event.preventDefault();
          replaceCharacter(txt_elem, selStart, mapped_chars[i][0]);
          return;
        }
      }
    }
  });

  $("#german_chars .btn").on("click", function(event) {
    event.preventDefault();
    insertCharacter(this.value);
  });
});


