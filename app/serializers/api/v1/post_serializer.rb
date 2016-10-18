class Api::V1::PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :author, :published_at

  has_one :user
  has_many :comments
end
