class TableSerializer
  include JSONAPI::Serializer
  attributes :table, :seats, :reserve
end
