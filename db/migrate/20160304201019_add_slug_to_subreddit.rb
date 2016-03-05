class AddSlugToSubreddit < ActiveRecord::Migration
  def change
    add_column :subreddits, :slug, :string
  end
end
