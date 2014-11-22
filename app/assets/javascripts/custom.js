$(function(){
    $('.answer-btn').click(function(){
        // siblingsは兄弟
        $(this).siblings('.answer').slideToggle();
    });
});