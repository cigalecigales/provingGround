$(function(){
  var top = $("#circle1").offset().top;
  $(window).scroll(function(){
    var value = $(this).scrollTop();
    $("#circle1").css("top", top - value);
    $("#circle2").css("top", top - value / 4);
    $("#circle3").css("top", top - value / 6);
  });
});
