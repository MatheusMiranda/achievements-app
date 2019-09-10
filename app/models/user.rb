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

  def update_achievements(item)
    achievements = Achievement.search id.to_s, fields: [:user_id], order: {created_at: :desc}, where: {name: item}
    last_achievement_level = achievements.first.level
    value = get_total_value(item)

    new_achievements = AchievementCategory.search item, fields: [:category], where: {level: {gt: last_achievement_level, lt: value + 1}}

    new_achievements.each do |new_achievement|
      Achievement.create(user: self, category: new_achievement.category, level: new_achievement.level)
    end
  end

  private

  def get_total_value(item)
    value = 0
    if item == "deaths"
      value = get_deaths_quantity
    elsif item == "killed_monsters"
      value = get_killed_monsters_quantity
    elsif item == "collected_coins"
      value = get_collected_coins_total
    end
    value
  end

  def get_deaths_quantity
    results = Death.search User.first.id.to_s, fields: [:user_id]
    results.size
  end

  def get_killed_monsters_quantity
    results = KilledMonster.search User.first.id.to_s, fields: [:user_id]
    results.size
  end

  def get_collected_coins_total
    results = CollectedCoin.search selft.id.to_s, fields: [:user_id], aggs: {sum_value: {sum: {field: :value}}}
    results["sum_value"]
  end
end
