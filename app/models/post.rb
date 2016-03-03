class Post < ActiveRecord::Base
	validates :title, presence: true, length: {maximum: 140}
	validates :content, presence: true, length: {maximum: 255}
end
