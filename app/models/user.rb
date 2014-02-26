class User < ActiveRecord::Base
  has_many :posts
  has_many :post_votes
  has_many :comment_votes
  has_many :comments, through: :posts

  has_secure_password
  validates :username, uniqueness: true, presence: true
  # Remember to create a migration!
end
