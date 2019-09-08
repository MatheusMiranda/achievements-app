## CREATE ACHIEVEMENTS CATEGORY
puts "CREATING ACHIEVEMENTS CATEGORIES"
AchievementCategory.__elasticsearch__.create_index!(force: true)
AchievementCategory.__elasticsearch__.refresh_index!
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

### CREATE USERS
User.__elasticsearch__.create_index!(force: true)
User.__elasticsearch__.refresh_index!
puts "CREATING USERS"
users_names = ["Guila", "Bruna", "Taynara","Miranda", "Joao", "Assis", "Dom", "Richard", "Kamilla", "Vitoria"]

users_names.each do |name|
  user = User.create(name: name)
  (1..50).each do |i|
    CollectedCoin.create(user: user, value: i * 1000)
  end
end

## CREATE MONSTERS
puts "CREATING MONSTERS"
Monster.__elasticsearch__.create_index!(force: true)
Monster.__elasticsearch__.refresh_index!
monsters_names = ["turtle", "bowser"]

(1..200).each do |i|
  Monster.create(name: monsters_names[i % 2])
end

### CREATE KILLED MONSTERS
puts "CREATING KILLED MONSTERS"
users = User.all
users_count = users.count
monsters = Monster.limit(100)

KilledMonster.__elasticsearch__.create_index!(force: true)
KilledMonster.__elasticsearch__.refresh_index!
monsters.each do |monster|
  KilledMonster.create(user: users[rand(1..users_count)], monster: monster)
end
