require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one) # Load post 'one' from fixtures
  end

  test "should get index" do
    get posts_url
    assert_response :success
    assert_select "h1", "Blog Posts" # Check for heading
    # Check that post titles are listed (at least the first one)
    assert_select "article h2", @post.title
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
    assert_select "h1", @post.title # Check for post title
    assert_select "p", @post.body   # Check for post body
    # Check that comments are displayed (at least the first one associated with this post)
    assert_select "div.comment p", comments(:one).body
    # Check for the comment form
    assert_select "form[action=?]", post_comments_path(@post)
  end
end
