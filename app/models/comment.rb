class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  # Remember to create a migration!
  validates :content, presence: true
end
