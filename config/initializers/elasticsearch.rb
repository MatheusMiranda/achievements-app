unless User.__elasticsearch__.index_exists? 
  User.__elasticsearch__.create_index! force: true 
  User.import 
end

unless Monster.__elasticsearch__.index_exists? 
  Monster.__elasticsearch__.create_index! force: true 
  Monster.import 
end

unless Death.__elasticsearch__.index_exists? 
  Death.__elasticsearch__.create_index! force: true 
  Death.import 
end

unless KilledMonster.__elasticsearch__.index_exists? 
  KilledMonster.__elasticsearch__.create_index! force: true 
  KilledMonster.import 
end

unless CollectedCoin.__elasticsearch__.index_exists? 
  CollectedCoin.__elasticsearch__.create_index! force: true 
  CollectedCoin.import 
end
