class Monster
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  has_many :killed_monsters

  searchkick

  def search_data
    {
      name: name,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
