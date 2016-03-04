class Post < ActiveRecord::Base
	has_many :comments, as: :note, dependent: :destroy
	belongs_to :user
	belongs_to :subreddit

	validates :title, presence: true, length: { maximum: 140 }
	validates :content, presence: true, length: { maximum: 255 }
	validates :user_id, presence: true
	validates :subreddit_id, presence: true
end
