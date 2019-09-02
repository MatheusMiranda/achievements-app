class User
  include Mongoid::Document
  field :name, type: String
  has_many :collected_coins
  has_many :killed_monsters
  has_many :deaths
  has_many :achievements
end
