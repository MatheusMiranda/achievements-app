class Death
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user

  def as_indexed_json(options={})
    as_json(except: [:id, :_id])
  end

  settings index: {number_of_shards: 1} do
    mappings dynamic: 'false' do
      indexes :users
    end
  end

  def as_indexed_json(options={})
    as_json(except: [:id, :_id],
            include: {
              user: {
                only: :id
              }
            })
  end
end
