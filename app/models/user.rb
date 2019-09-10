class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  validates_uniqueness_of :name

  has_many :collected_coins
  has_many :killed_monsters
  has_many :deaths
  has_many :achievements

  searchkick

  def search_data
    {
      name: name,
      created_at: created_at,
      updated_at: updated_at
    }
  end

  def as_json(_opts = {})
    {
      id: id,
      name: name,
      achievements: get_achievements,
    }
  end

  def update_achievements(item, value)
    achievements = Achievement.search id.to_s, fields: [:user_id], order: {created_at: :desc}, where: {name: item}
    last_achievement_level = achievements.first.level

    new_achievements = AchievementCategory.search item, fields: [:category], where: {level: {gt: last_achievement_level, lt: value + 1}}

    new_achievements.each do |new_achievement|
      Achievement.create(user: self, category: new_achievement.category, level: new_achievement.level)
    end
  end
end
