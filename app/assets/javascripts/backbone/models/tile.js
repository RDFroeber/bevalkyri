Bv.Models.Tile = Backbone.Model.extend({
  urlRoot: "/tiles",

  save: function(options){
    $.ajax({
      url: '/tiles',
      type: 'POST',
      dataType: 'json',
      data: this.toJSON(),
      success: function(object, status) {
        if(options.success) options.success(this, object);
      }
    });
  }
  
});