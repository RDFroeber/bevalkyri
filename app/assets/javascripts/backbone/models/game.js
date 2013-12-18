Bv.Models.Game = Backbone.Model.extend({
  urlRoot: "/games",

  defaults: {
    player_id: 1,
    board_id: 1,
  }
});