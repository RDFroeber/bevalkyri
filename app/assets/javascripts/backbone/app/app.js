window.Bv = { //Defining app name space
  Models: {},
  Collections: {},
  Views: {},
  Router: {}
}

window.template = function(id){
  return _.template($('#'+id).html());
}