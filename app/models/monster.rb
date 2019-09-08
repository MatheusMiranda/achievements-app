class Monster
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  field :name, type: String
  has_many :killed_monsters

  settings index: {number_of_shards: 1} do
    mappings dynamic: 'false' do
      indexes :name, analyzer: 'english'
    end
  end

  def as_indexed_json(options={})
    as_json(except: [:id, :_id])
  end
end
