class AchievementCategory
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  field :name, type: String
  field :level, type: Integer

  def as_indexed_json(options={})
    as_json(except: [:id, :_id])
  end
end
