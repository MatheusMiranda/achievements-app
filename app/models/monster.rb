class Monster
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  field :name, type: String
  has_many :killed_monsters

  def as_indexed_json(options={})
    as_json(except: [:id, :_id])
  end
end
