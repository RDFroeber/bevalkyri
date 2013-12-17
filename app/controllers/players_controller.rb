class PlayersController < ApplicationController  
  def new 
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    @user.save
  end 
end