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

  def as_json(_opts = {})
    {
      id: id,
      user_id: user.id,
      level: level,
      category: category
    }
  end
end
