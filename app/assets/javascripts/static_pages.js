// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(function() {
	$('.summernote').each(function(){
		var summer_note;
	    summer_note = $("#"+$(this).attr('id'));
	    console.log(summer_note);
	    summer_note.summernote({
	      height: 500,
	      lang: 'en-US',
	      codemirror: {
	        lineNumbers: true,
	        tabSize: 2,
	        theme: "solarized light"
	      }
	    });
	    summer_note.code(summer_note.val());
	    return summer_note.closest('form').submit(function() {
	      summer_note.val(summer_note.code());
	      return true;
	    });
	})
});
