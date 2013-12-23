$("div.tile").each(function(){
  var distanceFromTop = (12 - $(this).attr("data-y").split("-")[1]) * 32;
  var distanceFromLeft = ($(this).attr("data-x").split("-")[0]) * 32;

  $(this).css({ "top": distanceFromTop, "left": distanceFromLeft, "background-color": "blue" });
  // $(this).css("background-color", $(this).attr("color_one"));
  // $(this).css("opacity", 0.4);

  $(this).click(function(){
    $(this).addClass("territory");
  });
});

$("div.castle").each(function(){
  var distanceFromTop = (12 - $(this).attr("data-y")) * 32 - 10;
  var distanceFromLeft = ($(this).attr("data-x") * 32) - 10;
  
  $(this).css("top", distanceFromTop);
  $(this).css("left", distanceFromLeft);
  // $(this).css("background-color", $(this).attr("color_one"));
});