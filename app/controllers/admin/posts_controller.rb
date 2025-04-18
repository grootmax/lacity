module Admin
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    # GET /admin/posts
    def index
      @posts = Post.all
    end

    # GET /admin/posts/1
    def show
    end

    # GET /admin/posts/new
    def new
      @post = Post.new
    end

    # GET /admin/posts/1/edit
    def edit
    end

    # POST /admin/posts
    def create
      @post = Post.new(post_params)
      if @post.save
        # Assuming routes are set up, redirect to the show page for the new post
        # Need to define admin_post_path helper later in routes.rb
        redirect_to [:admin, @post], notice: 'Post was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /admin/posts/1
    def update
      if @post.update(post_params)
        # Assuming routes are set up, redirect to the show page for the updated post
        # Need to define admin_post_path helper later in routes.rb
        redirect_to [:admin, @post], notice: 'Post was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /admin/posts/1
    def destroy
      @post.destroy
      # Assuming routes are set up, redirect to the index page
      # Need to define admin_posts_path helper later in routes.rb
      redirect_to admin_posts_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:title, :body)
      end
  end
end
