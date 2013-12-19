class PlayersController < ApplicationController  
  def new 
    @player = Player.new
    @user = current_user
  end 

  def create
    @player = Player.new(user_id: params[:user_id], name: params[:player][:name], kingdom: params[:player][:kingdom], crest: params[:player][:crest], color_one: params[:player][:color_one], color_two: params[:player][:color_two], manifesto: params[:player][:manifesto])
    
    if @player.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end 

end