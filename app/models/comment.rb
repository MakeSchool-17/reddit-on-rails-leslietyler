class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :note, polymorphic: true
	has_many :comments, as: :note, dependent: :destroy

    validates :content, presence: true, length: { maximum: 255 }
	validates :user_id, presence: true
	validates :note_id, presence: true
	validates :note_type, presence: true
end
