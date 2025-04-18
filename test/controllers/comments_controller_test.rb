require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one) # Fixture post to add comments to
  end

  test "should create comment" do
    assert_difference("Comment.count") do
      # POST to the nested route: /posts/:post_id/comments
      post post_comments_url(@post), params: { comment: { body: "This is a test comment." } }
    end

    # Should redirect back to the post's show page
    assert_redirected_to post_url(@post)

    # Optional: Check if the comment body exists on the page after redirect
    follow_redirect!
    assert_select "div.comment p", "This is a test comment."
  end

  test "should not create comment with invalid params" do
    # CommentsController#create currently doesn't handle failure well (just saves and redirects)
    # A more robust implementation would check `save` and render/redirect accordingly.
    # For this test, we'll assume the current implementation and just check count.
    # If the controller were enhanced to handle failure (e.g., render :new), this test would change.

    assert_no_difference("Comment.count") do
      # Post invalid data (missing body)
      post post_comments_url(@post), params: { comment: { body: "" } }
    end

    # It still redirects in the current implementation even on failure
    assert_redirected_to post_url(@post)

    # Note: In a real app, you'd likely improve the controller to handle the
    # validation failure (e.g., render the post show page again with an error message)
    # and update this test to assert that behavior (e.g., assert_response :unprocessable_entity or similar).
  end
end
