class TableSerializer
  include JSONAPI::Serializer
  attributes :table, :seats, :reserve

  belongs_to :user
end
