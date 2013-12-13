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
  }

});