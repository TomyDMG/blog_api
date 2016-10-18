class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :email, :password_digest

  has_many :posts
  has_many :comments
end
