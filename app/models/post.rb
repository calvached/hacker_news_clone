class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :url, presence: true
  # Remember to create a migration!
end
