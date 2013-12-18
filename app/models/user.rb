class User < ActiveRecord::Base
  has_many :players
  has_many :games, :through => :players
  
  has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :password, :password_confirmation, presence: true, length: {minimum: 6}
  
  # def self.from_omniauth(auth)
  #   where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.name = auth.info.name
  #     user.email = auth.info.email
  #     user.oauth_token = auth.credentials.token
  #     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #     user.save!
  #   end
  # end
end
