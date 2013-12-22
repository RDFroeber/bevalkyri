class Player < ActiveRecord::Base
  belongs_to :user
  has_many :games
  has_many :boards, :through => :games
  has_many :tiles
  has_many :buildings
  has_many :stats

  validates :user_id, :name, :crest, :color_one, presence: true
end