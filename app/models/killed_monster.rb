class KilledMonster
  include Mongoid::Document

  belongs_to :user
  belongs_to :monster

  searchkick

  def search_data
    {
      user_id: user.id.to_s,
      monster_id: monster.id.to_s
    }
  end
end
