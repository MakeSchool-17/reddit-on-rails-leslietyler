Rails.application.routes.draw do
    root                    'subreddits#new'
    resources :subreddits

    resources :subreddits do
    	resources :posts
	end
end
