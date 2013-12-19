$("div.tile").each(function(){
  var distanceFromTop = (12 - $(this).attr("data-y").split("-")[1]) * 32;
  var distanceFromLeft = ($(this).attr("data-x").split("-")[0]) * 32;

  $(this).css("top", distanceFromTop);
  $(this).css("left", distanceFromLeft);
  $(this).click(function(){
    $(this).addClass("territory");
  });
});

$("div.castle").each(function(){
  var distanceFromTop = (12 - $(this).attr("data-y")) * 32 - 10;
  var distanceFromLeft = ($(this).attr("data-x") * 32) - 10;
  
  $(this).css("top", distanceFromTop);
  $(this).css("left", distanceFromLeft);
});