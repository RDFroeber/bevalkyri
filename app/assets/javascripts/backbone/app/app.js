window.Bv = { //Defining app name space
  Models: {},
  Collections: {},
  Views: {},
  Router: {},

  init: function(){
    new Bv.Views.Board({collection: new Bv.Collections.Houses()});
    new Bv.Router();
    Backbone.history.start();
  }
}

window.template = function(id){
  return _.template($('#'+id).html());
}