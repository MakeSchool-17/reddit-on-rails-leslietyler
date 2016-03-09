Rails.application.routes.draw do
    root                    'subreddits#new'
    resources :subreddits

    resources :subreddits do
    	resources :posts
	end

	resources :posts, only: [:new, :create]
end
