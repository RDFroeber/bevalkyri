Bv.Views.UserSignUp = Backbone.View.extend({
  tagName:   "div",
  className: "#user_nav",

  // template: _.template( $("script[type='text/html']#sign_in").html() ),

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
    this.listenTo(this.model, "destroy", this.remove);

    this.render();
  },
  render: function() {
    console.log("Rendering UserView from JSON object: ");
    console.log(this.model.toJSON());

    this.$el.html( this.template(this.model.toJSON()) );
  }
});