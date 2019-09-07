class KilledMonster
  include Mongoid::Document
  belongs_to :user
  belongs_to :monster
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
