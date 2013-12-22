class GamesController < ApplicationController  
  def start
    @board = Board.create
    @game = Game.create(player_id: params[:player_id], board_id: @board.id)

    redirect_to build_user_player_game_boards_path(params[:user_id], params[:player_id], @game.id, board_id: @board)
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