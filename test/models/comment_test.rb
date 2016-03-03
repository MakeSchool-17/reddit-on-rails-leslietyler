require 'test_helper'

class CommentTest < ActiveSupport::TestCase
    def setup
      @comment = Comment.new(content: "example content",
                             points: 0)
    end

    test "should be valid" do
      assert @comment.valid?
    end

    test "content should be present" do
      @comment.content = ""
      assert_not @comment.valid?
    end

    test "content should be at most 255 characters" do
      @comment.content = "a" * 256
      assert_not @comment.valid?
    end
end
