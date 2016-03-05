require 'test_helper'

class SubredditControllerTest < ActionController::TestCase
    def setup

    end

    test "should redirect to subreddit from slug" do
        # access a route with r/slug
        assert_template "subreddit"
    end
end
