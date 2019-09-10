class KilledMonster
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :monster

  searchkick

  def search_data
    {
      user_id: user.id.to_s,
      monster_id: monster.id.to_s,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
