class Achievement
  include Mongoid::Document
  belongs_to :user
  field :name, type: String
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end