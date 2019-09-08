class Monster
  include Mongoid::Document

  field :name, type: String
  has_many :killed_monsters

  searchkick

  def search_data
    {
      name: name
    }
  end
end
