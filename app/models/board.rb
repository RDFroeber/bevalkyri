class Board < ActiveRecord::Base
  has_many :games
  has_many :players, :through => :games
  has_many :tiles
  has_many :buildings
end