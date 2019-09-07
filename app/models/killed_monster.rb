class KilledMonster
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user
  belongs_to :monster

  def as_indexed_json(options={})
    as_json(except: [:id, :_id])
  end
end
