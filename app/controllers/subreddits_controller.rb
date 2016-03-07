class SubredditsController < ApplicationController
    def new
        @subreddit = Subreddit.new
    end

    def index
        @subreddits = Subreddit.all
    end

    def show
        @current_subreddit = Subreddit.find(params[:id])
        @feed_items = @current_subreddit.feed
    end

    def edit
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
