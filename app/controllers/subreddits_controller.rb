class SubredditsController < ApplicationController
    def new
        @subreddit = Subreddit.new
    end

    def index
        @subreddits = Subreddit.paginate(page: params[:page])
    end

    def show
        @current_subreddit = Subreddit.find(params[:id])
        @feed_items = @current_subreddit.feed.paginate(page: params[:page])
    end

    def edit
        @subreddit = Subreddit.find(params[:id])
    end

    def update
        @subreddit = Subreddit.find(params[:id])
        if @subreddit.update_attributes(subreddit_params)
          flash[:success] = "Subreddit updated"
          redirect_to @subreddit
        else
          render 'edit'
        end
    end

    def create
        @subreddit = Subreddit.new(subreddit_params)

        if @subreddit.save
            redirect_to subreddit_path(@subreddit.id)
        else
            render 'new'
        end
    end

    private
        def subreddit_params
            params.require(:subreddit).permit(:title, :description)
        end
end
