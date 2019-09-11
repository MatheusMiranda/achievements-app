class Achievement
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  has_one :achievement_category

  searchkick

  def search_data
    {
      user_id: user.id.to_s,
      level: achievement_category.level,
      category: achievement_category.category,
      type: achievement_category.type,
      created_at: created_at,
      updated_at: updated_at
    }
  end

  def as_json(_opts = {})
    {
      id: id,
      user_id: user.id,
      level: achievement_category.level,
      category: achievement_category.category,
      type: achievement_category.type
    }
  end
end
