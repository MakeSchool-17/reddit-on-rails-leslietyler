require 'test_helper'

class SubredditsControllerTest < ActionController::TestCase
    def setup
    	@subreddit = subreddits(:subreddit_one)
    end

    test "should redirect to subreddit from slug" do
    	get :show, id: @subreddit

        assert_template "show"
    end
end
