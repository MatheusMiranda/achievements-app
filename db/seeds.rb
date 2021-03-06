## CREATE ACHIEVEMENTS CATEGORY
puts "CREATING ACHIEVEMENTS CATEGORIES"
AchievementCategory.reindex
coins_levels = [1, 100, 1000, 10000, 100000]
coins_levels.each do |coin_level|
  AchievementCategory.create(category: "collected_coins", level: coin_level)
end

deaths_levels = [1, 10, 25, 50, 100]
deaths_levels.each do |death_level|
  AchievementCategory.create(category: "deaths", level: death_level)
end

monsters_levels = [1, 100, 1000, 10000, 100000]
monsters_levels.each do |monster_level|
  AchievementCategory.create(category: "killed_monsters", level: monster_level, type: "bowser")
  AchievementCategory.create(category: "killed_monsters", level: monster_level, type: "turtle")
end

### CREATE USERS
User.reindex
Achievement.reindex
CollectedCoin.reindex
Death.reindex

puts "CREATING USERS"
users_names = ["Guila", "Bruna", "Taynara","Miranda", "Joao", "Assis", "Dom", "Richard", "Kamilla", "Vitoria"]

users_names.each do |name|
  user = User.create(name: name)
  (1..50).each do |i|
    CollectedCoin.create(user: user, value: i * 1000)
  end
  (1..50).each do |i|
    Death.create(user: user)
  end
  Achievement.create(user: user, category: 'killed_monsters', level: 1, type: "turtle")
  Achievement.create(user: user, category: 'killed_monsters', level: 100, type: "turtle")
  Achievement.create(user: user, category: 'killed_monsters', level: 1000, type: "turtle")
  Achievement.create(user: user, category: 'killed_monsters', level: 1, type: "bowser")
  Achievement.create(user: user, category: 'killed_monsters', level: 100, type: "bowser")
  Achievement.create(user: user, category: 'killed_monsters', level: 1000, type: "bowser")
  Achievement.create(user: user, category: 'collected_coins', level: 1)
  Achievement.create(user: user, category: 'collected_coins', level: 100)
  Achievement.create(user: user, category: 'collected_coins', level: 1000)
  Achievement.create(user: user, category: 'deaths', level: 1)
  Achievement.create(user: user, category: 'deaths', level: 10)
  Achievement.create(user: user, category: 'deaths', level: 25)
end

## CREATE MONSTERS
puts "CREATING MONSTERS"
Monster.reindex
monsters_names = ["turtle", "bowser"]

(1..200).each do |i|
  Monster.create(name: monsters_names[i % 2])
end

### CREATE KILLED MONSTERS
puts "CREATING KILLED MONSTERS"
users = User.all
users_count = users.count
monsters = Monster.limit(100)

KilledMonster.reindex
monsters.each do |monster|
  KilledMonster.create(user: users[rand(1..users_count)], monster: monster)
end
