class TilesController < ApplicationController  
  before_action :current_player

  def create
    tile = Tile.new(player_id: current_player, board_id: 1, x_cords: params[:x], y_cords: params[:y])
    tile.save
  end 

end