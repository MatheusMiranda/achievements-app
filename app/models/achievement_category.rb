class AchievementCategory
  include Mongoid::Document
  field :name, type: String
  field :level, type: Integer
end
