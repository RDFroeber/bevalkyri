module BoardHelper
  def tile_fill(x,y)
    top_right = "#{x}-#{increment(x)},#{decrement(y)}-#{y}"
    bottom_right = "#{x}-#{increment(x)},#{y}-#{increment(y)}"
    top_left = "#{decrement(x)}-#{x},#{decrement(y)}-#{y}"
    bottom_left = "#{decrement(x)}-#{x},#{y}-#{increment(y)}"

    tiles = [Tile.where(board_id: params[:id], x_cords: top_right.split(",")[0], y_cords: top_right.split(",")[1]), Tile.where(board_id: params[:id], x_cords: bottom_right.split(",")[0], y_cords: bottom_right.split(",")[1]), Tile.where(board_id: params[:id], x_cords: top_left.split(",")[0], y_cords: top_left.split(",")[1]), Tile.where(board_id: params[:id], x_cords: bottom_left.split(",")[0], y_cords: bottom_left.split(",")[1])]

    tiles.each do |tile|
      tile[0].territory = true
      tile[0].save
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
end