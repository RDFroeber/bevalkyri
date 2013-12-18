Bv.Models.Tile = Backbone.Model.extend({
  urlRoot: "/tiles",

  defaults: {
    player_id: 1,
    board_id: 1,
    x_cords: "00-00",
    y_cords: "00-00",
    territory: false
  },

  save: function(options){
    $.ajax({
      url: '/tiles',
      type: 'POST',
      dataType: 'json',
      data: this.toJSON(),
      success: function(object, status) {
        //if(options.success) options.success(this, object);
        console.log("IT WORKED!");
      }
    });
  }
  
});
