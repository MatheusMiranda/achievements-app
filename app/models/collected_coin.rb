class CollectedCoin
  include Mongoid::Document
  include Mongoid::Timestamps

  field :value, type: Integer
  belongs_to :user

  searchkick

  def search_data
    {
      value: value,
      user_name: user.name,
      user_id: user.id.to_s,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
