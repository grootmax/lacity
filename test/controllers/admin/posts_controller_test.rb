require "test_helper"

module Admin
  class PostsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @post = posts(:one) # Load post 'one' from fixtures
    end

    test "should get index" do
      get admin_posts_url
      assert_response :success
    end

    test "should get new" do
      get new_admin_post_url
      assert_response :success
    end

    test "should create post" do
      assert_difference("Post.count") do
        post admin_posts_url, params: { post: { title: "New Test Post", body: "Body for test post" } }
      end

      assert_redirected_to admin_post_url(Post.last)
      # Optionally check flash notice: assert_equal 'Post was successfully created.', flash[:notice]
    end

    test "should not create post with invalid params" do
      assert_no_difference("Post.count") do
        post admin_posts_url, params: { post: { title: "", body: "" } } # Invalid: title and body missing
      end

      assert_response :unprocessable_entity # Should re-render the 'new' template
    end

    test "should show post" do
      get admin_post_url(@post)
      assert_response :success
    end

    test "should get edit" do
      get edit_admin_post_url(@post)
      assert_response :success
    end

    test "should update post" do
      patch admin_post_url(@post), params: { post: { title: "Updated Title", body: "Updated Body" } }
      assert_redirected_to admin_post_url(@post)
      @post.reload # Reload fixture data from DB
      assert_equal "Updated Title", @post.title
      assert_equal "Updated Body", @post.body
      # Optionally check flash notice: assert_equal 'Post was successfully updated.', flash[:notice]
    end

    test "should not update post with invalid params" do
      patch admin_post_url(@post), params: { post: { title: "", body: "Only Body" } } # Invalid: title missing
      assert_response :unprocessable_entity # Should re-render the 'edit' template
      @post.reload
      assert_not_equal "", @post.title # Ensure title wasn't wiped
    end

    test "should destroy post" do
      assert_difference("Post.count", -1) do
        delete admin_post_url(@post)
      end

      assert_redirected_to admin_posts_url
      # Optionally check flash notice: assert_equal 'Post was successfully destroyed.', flash[:notice]
    end
  end
end
