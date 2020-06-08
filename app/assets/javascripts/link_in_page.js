$(function(){
  $('a[href^="#"]').click(function(){
    let href = $(this).attr("href");
    let target = $(href == "#" || href == "" ? 'html' : href);
    console.log(target);
    let position = target.offset().top;
    $("html, body").animate({scrollTop:position}, 500, 'swing');
    return false;
  });
});