class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def index
        #@posts = Post.all
    end

    def show
        @current_post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
          flash[:success] = "Post updated"
          redirect_to @post
        else
          render 'edit'
        end
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = 1
        @post.points = 0
        if @post.save
            redirect_to subreddit_post_path(post.subreddit_id, post.id)
        else
            render 'new'
        end
    end

    private
        def post_params
            params.require(:post).permit(:title, :content, :subreddit_id, :content_type)
        end
end
