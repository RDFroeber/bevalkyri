class Stat < ActiveRecord::Base
  belongs_to :player
  belongs_to :board
  
  validates :player_id,:board_id, presence: true
end