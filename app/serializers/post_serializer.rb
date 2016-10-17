class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :author, :published_at

  has_many :comments
  has_one :author
end
