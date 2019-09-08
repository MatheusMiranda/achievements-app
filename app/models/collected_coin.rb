class CollectedCoin
  include Mongoid::Document

  field :value, type: Integer
  belongs_to :user

  searchkick

  def search_data
    {
      value: value,
      user_name: user.name,
      user_id: user.id.to_s
    }
  end
end
