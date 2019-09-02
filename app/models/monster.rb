class Monster
  include Mongoid::Document
  field :name, type: String
  has_many :killed_monsters
end
