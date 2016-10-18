module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :nickname, :email, :password_digest

    has_many :posts
    has_many :comments
  end
end
