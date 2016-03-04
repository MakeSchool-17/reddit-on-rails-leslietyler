require 'test_helper'

class ModeratorTest < ActiveSupport::TestCase
  def setup
     @user = users(:userone)
  end
  test "should be valid" do
  	@subreddit = Subreddit.new(title:"Test Subreddit", description:"Test description")
  	@user.save
  	@subreddit.save
  	@moderator = Moderator.new(user_id:@user.id , subreddit_id:@subreddit.id)
    assert @moderator.valid?
  end
end
