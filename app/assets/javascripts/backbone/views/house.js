Bv.Views.House = Backbone.View.extend({
  tagName: "div",

  className: "house active",

  events: {
    "click": "selectHouse"
  },

  initialize: function(){
    this.$el.attr({"data-x": this.model.get("dataX"), "data-y": this.model.get("dataY")});
  },

  selectHouse: function(){
    //callback to view to change tiles

    //callback to update your model
    this.$el.removeClass("active"); 
  },

  setPosition: function(){
    var dataX = this.model.get("dataX");
    var dataY = this.model.get("dataY");

    this.$el.css({top: (32 * (11 - dataY)) - 5, left: (32 * dataX) - 5});
  }
});