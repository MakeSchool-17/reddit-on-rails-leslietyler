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

        if @post.save
            redirect_to post_path(@post.id)
        else
            render 'new'
        end
    end

    private
        def post_params
            params.require(:post).permit(:title, :description)
        end
end
