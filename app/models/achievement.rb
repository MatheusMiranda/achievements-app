class Achievement
  include Mongoid::Document
  belongs_to :user
end
