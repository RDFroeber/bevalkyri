var BoardView = Backbone.View.extend({
  el: "#world",

  initialize: function(){
    this.createBoard();
    this.placeCastle();
    this.addHouses();
  },

  createBoard: function(){
    var allTiles = new TilesCollection();
    var xOne = "00";
    var xTwo = "01";

    for(var x = 0; x < 12; x++){
      var yOne = "00";
      var yTwo = "01";

      for(var y = 0; y < 12; y++) {
        var tile = new Tile({dataX: xOne + "-" + xTwo, dataY: yOne + "-" +  yTwo});
        var tileView = new TileView({model: tile});
        
        yOne = this.incrementPoints(yOne);
        yTwo = this.incrementPoints(yTwo);

        var data_x = tileView.model.get("dataX");
        var data_y = tileView.model.get("dataY");

        var distanceFromTop = 12 - data_y.split("-")[1];
        var distanceFromLeft = data_x.split("-")[0];

        tileView.$el.css({top: 32 * distanceFromTop, left: 32 * distanceFromLeft});
        allTiles.push({tile});
        this.$el.append(tileView.el);
      };

    xOne = this.incrementPoints(xOne);
    xTwo = this.incrementPoints(xTwo);

    }
  },

  incrementPoints: function(point){
    var integer = parseInt(point)
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
    var allHouses = new HousesCollection();
    var xOne = "01";

    for(var x = 0; x < 11; x++){
      var yOne = "00";

      for(var y = 0; y < 11; y++) {
        var house = new House({dataX: xOne, dataY: yOne});
        var houseView = new HouseView({model: house});

        yOne = this.incrementPoints(yOne);

        var data_x = houseView.model.get("dataX");
        var data_y = houseView.model.get("dataY");

        houseView.$el.css({top: (32 * (11 - data_y)) - 5, left: (32 * data_x) - 5});
        allHouses.push({house});
        this.$el.append(houseView.el);
      };

    xOne = this.incrementPoints(xOne);

    }
  }

});