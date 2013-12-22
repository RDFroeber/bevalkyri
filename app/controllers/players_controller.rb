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

  def destroy
    player_associations = []
    player_associations << Tile.where(player_id: params[:id])
    player_associations << Building.where(player_id: params[:id])
    player_associations << Stat.where(player_id: params[:id])

    player.games.each do |game|
      player_associations << Game.where(player_id: params[:id], board_id: game.board_id)
    end

    player_associations.flatten.each do |assoc|
      assoc.delete
    end

    if player.destroy
      redirect_to user_path(params[:user_id])
    end
  end

  private

  def player
    @player = Player.find(params[:id])
  end

end