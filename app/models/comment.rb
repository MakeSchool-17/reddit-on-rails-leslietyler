class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :note, polymorphic: true
	has_many :comments, as: :note, dependent: :destroy

    validates :content, presence: true, length: { maximum: 255 }
end
