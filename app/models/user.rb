class User
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  field :name, type: String
  has_many :collected_coins
  has_many :killed_monsters
  has_many :deaths
  has_many :achievements

  def as_indexed_json(options={})
    as_json(except: [:id, :_id])
  end
end
