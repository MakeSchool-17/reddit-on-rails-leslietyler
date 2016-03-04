class Moderator < ActiveRecord::Base
	belongs_to :user
	belongs_to :subreddit

	validates :user_id, presence: true
	validates :subreddit_id, presence: true
end
