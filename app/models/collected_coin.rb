class CollectedCoin
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  field :value, type: Integer
  belongs_to :user

  settings index: {number_of_shards: 1} do
    mappings dynamic: 'false' do
      indexes :value
      in
    end
  end

  def as_indexed_json(options={})
    as_json(except: [:id, :_id],
            include: {
              user: {
                methods: [:name], only: [:name]
              }
            })
  end
end
