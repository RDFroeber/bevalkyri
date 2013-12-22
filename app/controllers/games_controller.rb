class GamesController < ApplicationController  
  def start
    @board = Board.create
    # build_board
    @game = Game.create(player_id: params[:player_id], board_id: @board.id)

    redirect_to user_player_game_boards_path(params[:user_id], params[:player_id], @game.id, board_id: @board)
  end

  def show
    @this_game = Game.find(params[:id])
    @tiles = Tile.where(board_id: params[:format])
    @castles = Castle.where(board_id: params[:format])
    @castles.each do |c|
      tile_fill(c.x_cord,c.y_cord,params[:format])
    end
  end

  def update
  end

  def destroy
    if game.destroy
      redirect_to user_path(params[:user_id])
    end
  end

  private

  def game
    @game = Game.find(params[:id])
  end

end