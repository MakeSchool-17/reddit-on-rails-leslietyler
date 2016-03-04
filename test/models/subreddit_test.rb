require 'test_helper'

class SubredditTest < ActiveSupport::TestCase
    def setup
        @subreddit = Subreddit.new(title: "Example Title",
                                   description: "example description")
    end

    test "should be valid" do
        assert @subreddit.valid?
    end

    test "title should be present" do
        @subreddit.title = ""
        assert_not @subreddit.valid?
    end

    test "title should be at most 21 characters" do
        @subreddit.title = "a" * 22
        assert_not @subreddit.valid?
    end

    test "title should be unique" do
        duplicate_subreddit = @subreddit.dup
        duplicate_subreddit.title = @subreddit.title.upcase
        @subreddit.save
        assert_not duplicate_subreddit.valid?
    end

    test "description should be present" do
        @subreddit.description = ""
        assert_not @subreddit.valid?
    end

    test "description should be at most 1500 characters" do
        @subreddit.description = "a" * 1501
        assert_not @subreddit.valid?
    end
end
