class Death
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  searchkick

  def search_data
    {
      user_id: user.id.to_s,
      created_at: created_at,
      updated_at: updated_at
    }
  end

  def as_json(_opts = {})
    {
      id: id,
      user_id: id
    }
  end
end
