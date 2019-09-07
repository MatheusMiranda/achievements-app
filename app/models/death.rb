class Death
  include Mongoid::Document
  belongs_to :user
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
