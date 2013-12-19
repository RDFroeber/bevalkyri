class GamesController < ApplicationController  
  def start
    @board = Board.create
    build_board(@board)
    # binding.pry
    @game = Game.create(player_id: params[:player_id], board_id: @board.id)

    redirect_to user_player_game_path(params[:user_id], params[:player_id], @game.id, @board)
  end

  def show
    @tiles = Tile.where(board_id: params[:format])
    @castles = Castle.where(board_id: params[:format])
  end

  def update
  end

end