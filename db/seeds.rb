AchievementCategory.__elasticsearch__.create_index!(force: true)
coins_levels = [1, 100, 1000, 10000, 100000]
coins_levels.each do |coin_level|
  AchievementCategory.create(name: "coins", level: coin_level)
end

deaths_levels = [1, 10, 25, 50, 100]
deaths_levels.each do |death_level|
  AchievementCategory.create(name: "deaths", level: death_level)
end

monsters_levels = [1, 100, 1000, 10000, 100000]
monsters_levels.each do |monster_level|
  AchievementCategory.create(name: "monsters", level: monster_level)
end


User.__elasticsearch__.create_index!(force: true)
users_names = ["Guila", "Bruna", "Taynara","Miranda", "Joao", "Assis", "Dom", "Richard", "Kamilla"]

users_names.each do |name|
  User.create(name: name)
end

users = User.all

Monster.__elasticsearch__.create_index!(force: true)
monsters_names = ["turtle", "bowser"]

(1, 1000).each do |i|
  Monster.create(name: monsters_names[i % 2])
end
