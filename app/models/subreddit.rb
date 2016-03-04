class Subreddit < ActiveRecord::Base
	has_many :moderators
	has_many :users
	has_many :posts, dependent: :destroy

    validates :title, presence: true, length: { maximum: 21 }, uniqueness: { case_sensitive: false }
	validates :description, presence: true, length: { maximum: 1500 }
end
