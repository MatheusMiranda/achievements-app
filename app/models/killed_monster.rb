class KilledMonster
  include Mongoid::Document
  belongs_to :user
  belongs_to :monster
end
