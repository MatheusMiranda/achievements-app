class AchievementCategory
  include Mongoid::Document
  include Mongoid::Timestamps

  field :category, type: String
  field :level, type: Integer
  validates_uniqueness_of :level

  searchkick

  def search_data
    {
      category: category,
      level: level,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
