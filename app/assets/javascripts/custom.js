$(function(){
    $('.answer-btn').click(function(){
        // siblingsは兄弟
        $(this).siblings('.answer').slideToggle();
    });
    $('#show-favorite').hide();
    $('#show-question-btn').addClass('timeline-btn-new');
    $('#show-favorite-btn').click(function(){
    	$('#show-question').hide();
    	$('#show-favorite').show();
    	$('#show-favorite-btn').addClass('timeline-btn-new');
    	$('#show-question-btn').removeClass('timeline-btn-new');
    	return false;
    });
    $('#show-question-btn').click(function(){
    	$('#show-question').show();
    	$('#show-favorite').hide();
    	$('#show-question-btn').addClass('timeline-btn-new');
    	$('#show-favorite-btn').removeClass('timeline-btn-new');
    	return false;
    });

});