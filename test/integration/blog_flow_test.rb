require "test_helper"

class BlogFlowTest < ActionDispatch::IntegrationTest
  test "full blog flow: create post, view post, add comment" do
    # 1. Create a post via the admin interface
    get new_admin_post_url
    assert_response :success

    post_title = "My Integration Test Post"
    post_body = "This post was created during an integration test."

    assert_difference("Post.count", 1) do
      post admin_posts_url, params: { post: { title: post_title, body: post_body } }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success # Should be on the admin show page for the new post
    assert_select "h1", post_title # Check title on admin show page

    # Get the newly created post
    new_post = Post.find_by!(title: post_title)

    # 2. View the post on the public site
    get post_url(new_post)
    assert_response :success
    assert_select "h1", post_title # Check title on public show page
    assert_select "p", post_body   # Check body on public show page

    # 3. Add a comment to the post
    comment_body = "This is a comment added during the integration test."
    assert_difference("Comment.count", 1) do
      post post_comments_url(new_post), params: { comment: { body: comment_body } }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success # Should be back on the public show page

    # 4. Assert that the post and comment appear correctly
    assert_select "h1", post_title # Re-check title
    assert_select "p", post_body   # Re-check body
    assert_select "div.comment p", comment_body # Check that the new comment body is displayed
  end
end
