class Death
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user

  def as_indexed_json(options={})
    as_json(except: [:id, :_id])
  end
end
