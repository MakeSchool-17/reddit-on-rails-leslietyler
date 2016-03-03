require 'test_helper'

class PostTest < ActiveSupport::TestCase
    def setup
        @post = Post.new(title: "Example Title",
                         content: "example content",
                         points: 0)
    end

    test "should be valid" do
        assert @post.valid?
    end

    test "title should be present" do
        @post.title = ""
        assert_not @post.valid?
    end

    test "title should be at most 140 characters" do
        @post.title = "a" * 141
        assert_not @post.valid?
    end

    test "content should be present" do
        @post.content = ""
        assert_not @post.valid?
    end

    test "content should be at most 255 characters" do
        @post.content = "a" * 256
        assert_not @post.valid?
    end
end
