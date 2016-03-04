require 'test_helper'

class ModeratorTest < ActiveSupport::TestCase
  def setup
     @user = users(:userone)
     @moderator = Moderator.new(user_id: 1, subreddit_id: 1)
  end

  test "should be valid" do
  	@subreddit = Subreddit.new(title:"Test Subreddit", description:"Test description")
  	@user.save
  	@subreddit.save
  	@moderator = Moderator.new(user_id:@user.id , subreddit_id:@subreddit.id)
    assert @moderator.valid?
  end

  test "should require a user_id" do
     @moderator.user_id = nil
     assert_not @moderator.valid?
  end

  test "should require a subreddit_id" do
     @moderator.subreddit_id = nil
     assert_not @moderator.valid? 
  end
end
