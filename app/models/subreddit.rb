class Subreddit < ActiveRecord::Base
    validates :title, presence: true, length: { maximum: 140 }
	validates :description, presence: true, length: { maximum: 1500 }
end
