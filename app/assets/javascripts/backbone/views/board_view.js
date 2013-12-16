var BoardView = Backbone.View.extend({
  el: "#world",

  initialize: function(options){
    this.createBoard();
    this.placeCastle();
    this.addHouses();
    // this.allTiles = options.allTiles;
    // console.log(this.allTiles);
    // this.allHouses = options.allHouses;
  },

  createBoard: function(){
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

        tileView.setPosition();
        // this.allTiles.add(tile)
        this.$el.append(tileView.el);
      };

    xOne = this.incrementPoints(xOne);
    xTwo = this.incrementPoints(xTwo);
    }
  },

  placeCastle: function(){
    var castle = new Castle();
    var castleView = new CastleView({model: castle});

    castleView.setPosition();
    this.$el.append(castleView.el);
  },

  addHouses: function(){
    var xOne = "01";

    for(var x = 0; x < 11; x++){
      var yOne = "00";

      for(var y = 0; y < 11; y++) {
        var house = new House({dataX: xOne, dataY: yOne});
        var houseView = new HouseView({model: house});

        yOne = this.incrementPoints(yOne);

        houseView.setPosition();
        this.$el.append(houseView.el);
      };

    xOne = this.incrementPoints(xOne);
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
  }

});

// var tilesCollection = new allTilesView({ collection: allTiles });