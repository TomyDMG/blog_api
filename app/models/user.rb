class User < ApplicationRecord
  has_secure_password
  has_attached_file :avatar, styles: { medium: "300x300>" }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :nickname, :email, :password, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates_attachment_content_type :avatar, content_type: /^image\/(png|jpeg)/
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 3.megabytes

  has_many :posts
  has_many :comments
end
