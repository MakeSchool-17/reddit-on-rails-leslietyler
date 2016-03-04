class AddSubredditRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :subreddit, index: true, foreign_key: true
  end
end
