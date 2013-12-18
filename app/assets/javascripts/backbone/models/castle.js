Bv.Models.Castle = Backbone.Model.extend({
  urlRoot: "/buildings",

  defaults: {
    player_id: 1,
    board_id: 1,
    type: "Castle",
    x_cord: "00",
    y_cord: "00",
    population: 50
  }
  
});
