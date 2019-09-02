class CollectedCoin
  include Mongoid::Document
  field :value, type: Integer
  belongs_to :user
end
