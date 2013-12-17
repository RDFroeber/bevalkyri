window.Bv = { //Defining app name space
  Models: {},
  Collections: {},
  Views: {},
  Router: {},

  init: function(){
    new Bv.Views.Board();
    new Bv.Router();
    Backbone.history.start();
  }
}

window.template = function(id){
  return _.template($('#'+id).html());
}