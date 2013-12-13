var BoardView = Backbone.View.extend({
  el: "#world",

  initialize: function(){
    this.createBoard();
    this.placeCastle();
    this.addHouses();
  },

  createBoard: function(){
    // var allTiles = new TilesCollection();
    var x_one = "00";
    var x_two = "01";

    for(var x = 0; x < 12; x++){
      var y_one = "00";
      var y_two = "01";

      for(var y = 0; y < 12; y++) {
        var tile = new Tile({dataX: x_one + "-" + x_two, dataY: y_one + "-" +  y_two});
        var tileView = new TileView({model: tile});
        
        y_one = this.increment_points(y_one);
        y_two = this.increment_points(y_two);

        var data_x = tileView.model.get("dataX");
        var data_y = tileView.model.get("dataY");

        var distanceFromTop = 12 - data_y.split("-")[1];
        var distanceFromLeft = data_x.split("-")[0];

        tileView.$el.css({top: 32 * distanceFromTop, left: 32 * distanceFromLeft});
        this.$el.append(tileView.el);
      };

    x_one = this.increment_points(x_one);
    x_two = this.increment_points(x_two);

    }
  },

  increment_points: function(variable){
    var integer = parseInt(variable)
    integer++
    var num = integer.toString();

    if(num.length === 1){
      num = "0" + integer.toString();
    } else {
      num = integer.toString();
    }
    return num
  },

  placeCastle: function(){
    var x = "04";
    var y = "07";

    var castle = new Castle({dataX: x, dataY: y});
    var castleView = new CastleView({model: castle});

    var data_x = castleView.model.get("dataX");
    var data_y = castleView.model.get("dataY");

    castleView.$el.css({top: (32 * (12 - data_y)) - 10, left: (32 * data_x) - 10});
    this.$el.append(castleView.el);
  },

  addHouses: function(){
    var x_one = "01";

    for(var x = 0; x < 11; x++){
      var y_one = "00";

      for(var y = 0; y < 11; y++) {
        var house = new House({dataX: x_one, dataY: y_one});
        var houseView = new HouseView({model: house});

        y_one = this.increment_points(y_one);

        var data_x = houseView.model.get("dataX");
        var data_y = houseView.model.get("dataY");

        houseView.$el.css({top: (32 * (11 - data_y)) - 5, left: (32 * data_x) - 5});
        this.$el.append(houseView.el);
      };

    x_one = this.increment_points(x_one);

    }
  }

});