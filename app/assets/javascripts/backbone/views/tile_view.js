var TileView = Backbone.View.extend({
  tagName: "div",

  className: "tile",

  events: {
    "click": "takeOver"
  },

  initialize: function(){
    this.$el.attr({"data-x": this.model.get("dataX"), "data-y": this.model.get("dataY")});
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