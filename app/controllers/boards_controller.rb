class BoardsController < ApplicationController  
  def create
    @board = Board.new(user_params)
    @board.save
  end 

  def update
    @board.update_attributes(board_params)
  end 
end