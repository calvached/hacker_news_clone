class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.integer :vote
    end
  end
end
