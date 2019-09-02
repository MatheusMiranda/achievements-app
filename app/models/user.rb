class User
  include Mongoid::Document
  has_many :collected_coins
  has_many :killed_monsters
  has_many :deaths
end
