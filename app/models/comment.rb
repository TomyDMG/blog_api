class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  belongs_to :post

  def self.in_period(from, to)
    where(created_at: from..to)
  end
end
