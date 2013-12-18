class BuildingsController < ApplicationController  
  def create
    @building = Building.new(player_id: current_player, board_id: 1)
    @building.save
  end  

  def update
    @building.update_attributes(building_params)
  end 
end