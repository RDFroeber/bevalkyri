class TilesController < ApplicationController  
  def create
    @tile = Tile.new(player_id: current_player, board_id: 1, x_cords: params[:x], y_cords: params[:y])
    @tile.save
  end 

  def update
    @tile.update_attributes(tile_params)
  end 
end