class Post < ApplicationRecord
  validates :title, :body, presence: true
  default_scope { order(published_at: :desc) }

  belongs_to :user
  has_many :comments
end
