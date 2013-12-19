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

  def decrement(point)
    i = point.to_i
    i -= 1
    num = i.to_s

    if num[1] == nil
      num = "0" + num
    else
      num
    end
  end

  def place_castle(board)
    cords = ["02", "03", "04", "05", "06", "07", "08", "09", "10"]
    x = cords.sample
    y = cords.sample

    Castle.create(player_id: params[:player_id], board_id: board.id, type: "Castle", x_cord: x, y_cord: y)

    tile_fill(x,y,board)
  end

  def tile_fill(x,y,board)
    top_right = "#{x}-#{increment(x)},#{decrement(y)}-#{y}"
    bottom_right = "#{x}-#{increment(x)},#{y}-#{increment(y)}"
    top_left = "#{decrement(x)}-#{x},#{decrement(y)}-#{y}"
    bottom_left = "#{decrement(x)}-#{x},#{y}-#{increment(y)}"

    tiles = [Tile.where(board_id: board.id, x_cords: top_right.split(",")[0], y_cords: top_right.split(",")[1]), Tile.where(board_id: board.id, x_cords: bottom_right.split(",")[0], y_cords: bottom_right.split(",")[1]), Tile.where(board_id: board.id, x_cords: top_left.split(",")[0], y_cords: top_left.split(",")[1]), Tile.where(board_id: board.id, x_cords: bottom_left.split(",")[0], y_cords: bottom_left.split(",")[1])]
    # binding.pry
    tiles.each do |tile|
      tile[0].territory = true
      tile[0].save
    end
  end

end