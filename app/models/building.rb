class Building < ActiveRecord::Base
  belongs_to :player
  belongs_to :board
    
  validates :player_id, :board_id, :x_cord, :y_cord, presence: true
end