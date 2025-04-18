require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "should be valid with title and body" do
    post = Post.new(title: "Valid Title", body: "Valid Body")
    assert post.valid?
  end

  test "should be invalid without title" do
    post = Post.new(body: "Valid Body")
    assert_not post.valid?
    assert_not_empty post.errors[:title]
  end

  test "should be invalid without body" do
    post = Post.new(title: "Valid Title")
    assert_not post.valid?
    assert_not_empty post.errors[:body]
  end

  test "should have many comments" do
    post = posts(:one) # Load post from fixture
    assert_respond_to post, :comments
    assert_not_empty post.comments # Fixture has associated comments
  end

  test "should destroy associated comments when destroyed" do
    post = posts(:one)
    associated_comment_ids = post.comments.map(&:id)
    assert_not_empty associated_comment_ids

    # Ensure comments exist before destroying post
    assert_equal associated_comment_ids.count, Comment.where(id: associated_comment_ids).count

    # Destroy the post
    assert_difference("Post.count", -1) do
      post.destroy
    end

    # Check that associated comments are also destroyed
    assert_empty Comment.where(id: associated_comment_ids)
  end
end
