Bv.Views.Tile = Backbone.View.extend({
  tagName: "div",

  className: "tile",

  events: {
    "click": "takeOver"
  },

  initialize: function(){
  },

  takeOver: function(){
    this.$el.addClass("territory");
  },

  setPosition: function(){
    var dataX = this.model.get("dataX");
    var dataY = this.model.get("dataY");

    var distanceFromTop = 12 - dataY.split("-")[1];
    var distanceFromLeft = dataX.split("-")[0];

    this.$el.css({top: 32 * distanceFromTop, left: 32 * distanceFromLeft});
  }
});