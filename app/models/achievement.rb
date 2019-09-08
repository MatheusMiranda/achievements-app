class Achievement
  include Mongoid::Document

  belongs_to :user
  field :name, type: String

  searchkick
end
