class Achievement
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  field :category, type: String
  field :level, type: Integer

  searchkick

  def search_data
    {
      user_id: user.id.to_s,
      level: level,
      category: category,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
