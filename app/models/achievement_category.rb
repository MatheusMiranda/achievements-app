class AchievementCategory
  include Mongoid::Document
  include Mongoid::Timestamps

  field :category, type: String
  field :type, type: String
  field :level, type: Integer

  searchkick

  def search_data
    {
      level: level,
      category: category,
      type: type,
      created_at: created_at,
      updated_at: updated_at
    }
  end

  def as_json(_opts = {})
    {
      id: id,
      level: level,
      category: category,
      type: type
    }
  end
end
