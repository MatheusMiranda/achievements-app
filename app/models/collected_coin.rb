class CollectedCoin
  include Mongoid::Document
  field :value, type: Integer
  belongs_to :user
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
