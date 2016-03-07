class SubredditController < ApplicationController
    def new
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
end
