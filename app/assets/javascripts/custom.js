$(function(){
    $('.answer-btn').click(function(){
        // siblingsは兄弟
        $(this).siblings('.answer').slideToggle();
    });
    $('#show-favorite').hide();
    $('#show-favorite-btn').click(function(){
    	$('#show-question').hide();
    	$('#show-favorite').show();
    	return false;
    });
    $('#show-question-btn').click(function(){
    	$('#show-question').show();
    	$('#show-favorite').hide();
    	return false;
    });

});