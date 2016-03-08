class Subreddit < ActiveRecord::Base
	extend FriendlyId
	friendly_id :slug, use: [:slugged, :finders]

	before_create :create_slug

	has_many :moderators
	has_many :users
	has_many :posts, dependent: :destroy

	VALID_TITLE_REGEX = /\A[a-zA-Z\d\s\']+\z/
    validates :title, presence: true, length: { maximum: 21 },
			  format: { with: VALID_TITLE_REGEX },
	 	  	  uniqueness: { case_sensitive: false }
	validates :description, presence: true, length: { maximum: 1500 }

	def feed
		Post.where("subreddit_id = :subreddit_id", subreddit_id: id)
	end

	private
		def create_slug
			self.slug = self.title
			self.slug = self.slug.gsub!(/\s/, '-').downcase
		end
end
