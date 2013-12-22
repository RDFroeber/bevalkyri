class BoardsController < ApplicationController  
  def build
    @board = Board.find(params[:board_id])
    @board.build_board(params[:player_id])

    redirect_to user_player_game_board_path(params[:user_id], params[:player_id], params[:game_id], params[:board_id])
  end 

  def show
    @this_game = Game.find(params[:game_id])
    @tiles = Tile.where(player_id: params[:player_id], board_id: params[:id])
    @castles = Castle.where(player_id: params[:player_id], board_id: params[:id])
    @castles.each do |c|
      tile_fill(c.x_cord,c.y_cord)
    end
  end
end