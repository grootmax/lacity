require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "should be valid with body and post" do
    post = posts(:one) # Get a post from fixtures
    comment = Comment.new(body: "Valid comment body", post: post)
    assert comment.valid?
  end

  test "should be invalid without body" do
    post = posts(:one)
    comment = Comment.new(post: post) # Missing body
    assert_not comment.valid?
    assert_not_empty comment.errors[:body]
  end

  test "should be invalid without post" do
    # Note: The foreign key constraint in the migration might also catch this
    # at the database level, but model validation is still good practice.
    comment = Comment.new(body: "Valid comment body") # Missing post
    assert_not comment.valid?
    assert_not_empty comment.errors[:post] # Checks for association presence
  end

  test "should belong to post" do
    comment = comments(:one) # Load comment from fixture
    assert_respond_to comment, :post
    assert_instance_of Post, comment.post # Check if associated object is a Post
  end
end
