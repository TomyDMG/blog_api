class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :author, :published_at

  has_one :author
  belongs_to :post_id
end
