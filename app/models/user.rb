class User < ActiveRecord::Base
  has_many :posts
  has_many :comments, through: :posts
  # Remember to create a migration!
end
