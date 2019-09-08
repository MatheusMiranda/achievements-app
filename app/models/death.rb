class Death
  include Mongoid::Document

  belongs_to :user

  searchkick

  def search_data
    {
      user_id: user.id.to_s
    }
  end
end
