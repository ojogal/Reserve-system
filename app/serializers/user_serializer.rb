class UserSerializer
  include JSONAPI::Serializer

  has_many :tables
  attributes :email
end
