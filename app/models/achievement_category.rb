class AchievementCategory
  include Mongoid::Document
  field :name, type: String
  field :level, type: Integer
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
