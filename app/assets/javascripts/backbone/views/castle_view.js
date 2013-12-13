var CastleView = Backbone.View.extend({
  tagName: "div",

  className: "castle",

  initialize: function(){
    this.$el.attr({"data-x": this.model.get("dataX"), "data-y": this.model.get("dataY")});
  }
});