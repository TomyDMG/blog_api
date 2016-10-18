class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :author, :published_at

  has_one :user
  has_one :post
end
