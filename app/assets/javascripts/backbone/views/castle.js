Bv.Views.Castle = Backbone.View.extend({
  tagName: "div",

  className: "castle",

  initialize: function(){
    this.$el.attr({"data-x": this.model.get("dataX"), "data-y": this.model.get("dataY")});
  },

  setPosition: function(){
    var x = "05";
    var y = "07";

    this.$el.css({top: (32 * (12 - y)) - 10, left: (32 * x) - 10});
  }
});