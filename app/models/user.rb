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
      achievements: achievements
    }
  end

  def update_all_achievements
    update_achievements("deaths")
    update_achievements("collected_coins")
    update_achievements("killed_monsters", "bowsers")
    update_achievements("killed_monsters", "turtles")
  end

  private
    def update_achievements(category, type=nil)
      achievements = Achievement.search id.to_s, fields: [:user_id], order: {created_at: :desc}, where: {category: category, type: type}

      if not achievements.empty?
        last_achievement_level = achievements.first.level
        value = get_total_value(category, type)

        new_achievements = AchievementCategory.search category, fields: [:category], where: {level: {gt: last_achievement_level, lt: value + 1}, type: type}

        new_achievements.each do |achievement_category|
          Achievement.create(user: self, achievement_category: achievement_category)
        end
      end
    end

    def get_total_value(category, type=nil)
      value = 0
      if category == "deaths"
        value = get_deaths_quantity
      elsif category == "killed_monsters"
        value = get_killed_monsters_quantity(type)
      elsif category == "collected_coins"
        value = get_collected_coins_total
      end
      value
    end

    def get_deaths_quantity
      results = Death.search id.to_s, fields: [:user_id]
      results.size
    end

    def get_killed_monsters_quantity(monsters_type)
      results = KilledMonster.search id.to_s, fields: [:user_id], where: {name: monsters_type}
      results.size
    end

    def get_collected_coins_total
      results = CollectedCoin.search id.to_s, fields: [:user_id], aggs: {sum_value: {sum: {field: :value}}}
      results.aggs["sum_value"]["value"]
    end
end
