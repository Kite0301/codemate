$(function(){
    $('.answer-btn').click(function(){
        // siblingsは兄弟
        $(this).siblings('.answer').slideToggle();
    });
   
    $('#show-question-btn').addClass('timeline-btn-new');

    $('#show-favorite-btn').click(function(){
    	
    	$('#show-favorite-btn').addClass('timeline-btn-new');
    	$('#show-question-btn').removeClass('timeline-btn-new');
    	
    });
    $('#show-question-btn').click(function(){
    	$('#show-question-btn').addClass('timeline-btn-new');
    	$('#show-favorite-btn').removeClass('timeline-btn-new');
    });
   
    $('#timeline-new-btn').addClass('timeline-btn-new');
    $('#timeline-popular-btn').click(function(){
   
        $('#timeline-popular-btn').addClass('timeline-btn-new');
        $('#timeline-new-btn').removeClass('timeline-btn-new');
        $('#timeline-noanswerd-btn').removeClass('timeline-btn-new');
    })
     $('#timeline-new-btn').click(function(){
        $('#timeline-new-btn').addClass('timeline-btn-new');
        $('#timeline-popular-btn').removeClass('timeline-btn-new');
        $('#timeline-noanswerd-btn').removeClass('timeline-btn-new');
    })
     $('#timeline-noanswerd-btn').click(function(){
        $('#timeline-noanswerd-btn').addClass('timeline-btn-new');
        $('#timeline-new-btn').removeClass('timeline-btn-new');
        $('#timeline-popular-btn').removeClass('timeline-btn-new');
    })
});