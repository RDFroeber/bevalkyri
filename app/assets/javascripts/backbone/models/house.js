Bv.Models.House = Backbone.Model.extend({
  urlRoot: "/buildings",

  defaults: {
    player_id: 1,
    board_id: 1,
    type: "House",
    x_cord: "00",
    y_cord: "00",
    level: 1,
    population: 5
  }
  
});