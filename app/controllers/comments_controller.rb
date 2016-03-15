class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def index
        #@posts = Post.all
    end

    def show
        @current_post = Post.find(params[:id])
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        if @comment.update_attributes(comment_params)
          flash[:success] = "Comment updated"
          redirect_to @post
        else
          render 'edit'
        end
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = 1
        @comment.points = 0
        if @comment.save
            redirect_to subreddit_post_path(@comment.post_id, @comment.id)
        else
            render 'new'
        end
    end

    private
        def comment_params
            params.require(:comment).permit(:content, :post_id)
        end
end
