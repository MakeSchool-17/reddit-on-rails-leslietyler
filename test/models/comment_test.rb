require 'test_helper'

class CommentTest < ActiveSupport::TestCase
    def setup
      @comment = Comment.new(content: "example content",
                             points: 0, user_id: 1, note_id: 1,
                             note_type: "post")
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

    test "should require a user_id" do
       @comment.user_id = nil
       assert_not @comment.valid?
    end

    test "should require note_id" do
        @comment.note_id = nil
        assert_not @comment.valid?
    end

    test "should require note_type" do
        @comment.note_type = nil
        assert_not @comment.valid?
    end
end
