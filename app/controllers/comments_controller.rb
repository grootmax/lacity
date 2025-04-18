class CommentsController < ApplicationController
  # POST /posts/:post_id/comments
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    # Save the comment (we'll handle potential errors in the view later)
    @comment.save

    # Redirect back to the post show page
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
