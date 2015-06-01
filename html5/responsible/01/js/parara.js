$(function(){
  var top = $("#sq1").offset().top;
  $(window).scroll(function(){
    var value = $(this).scrollTop();
    $("#sq1").css("top", top + value / 2);
    $("#sq2").css("top", top + value / 4);
    $("#sq3").css("top", top + value / 6);
  });
});
