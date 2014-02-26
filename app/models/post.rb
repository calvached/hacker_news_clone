class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_votes

  validates :title, presence: true
  validates :url, presence: true
  # Remember to create a migration!
end
