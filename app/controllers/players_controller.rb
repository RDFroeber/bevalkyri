class PlayersController < ApplicationController  

  def create
    player = Player.new(player_params)
    # player.save
  end 

end