class Board < ActiveRecord::Base
  has_many :games
  has_many :players, :through => :games
  has_many :tiles
  has_many :buildings

  include BoardHelper

  def build_board(player)
    set_player(player)
    create_tiles
    place_castle
    assign_money
  end

  def set_player(player)
    @player = Player.find(player.to_i)
  end

  def player
    @player
  end
  
  def create_tiles
    x_one = "00"
    x_two = "01"

    12.times do
      y_one = "00"
      y_two = "01"

      12.times do
        Tile.create(player_id: player.id, board_id: self.id, x_cords: x_one + "-" + x_two, y_cords: y_one + "-" +  y_two)
        
        y_one = increment(y_one)
        y_two = increment(y_two)
      end

      x_one = increment(x_one)
      x_two = increment(x_two)
    end
  end

  def place_castle
    cords = ["02", "03", "04", "05", "06", "07", "08", "09", "10"]
    x = cords.sample
    y = cords.sample

    Castle.create(player_id: player.id, board_id: self.id, type: "Castle", x_cord: x, y_cord: y)
  end

  def assign_money
    new_stat = Stat.create(player_id: player.id, board_id: self.id, money: 100)
    player.stats << new_stat
  end

end