module GameHelper

  def build_board(board)
    create_tiles(board)
    place_castle(board)
  end
  
  def create_tiles(board)
    x_one = "00"
    x_two = "01"

    12.times do
      y_one = "00"
      y_two = "01"

      12.times do
        Tile.create(player_id: params[:player_id], board_id: board.id, x_cords: x_one + "-" + x_two, y_cords: y_one + "-" +  y_two)
        
        y_one = increment(y_one)
        y_two = increment(y_two)
      end

      x_one = increment(x_one)
      x_two = increment(x_two)
    end
  end

  def increment(point)
    i = point.to_i
    i += 1
    num = i.to_s

    if num[1] == nil
      num = "0" + num
    else
      num
    end
  end

  def place_castle(board)
    Castle.create(player_id: params[:player_id], board_id: board.id, type: "Castle", x_cord: "03", y_cord: "07")
  end


end