Rails.application.routes.draw do
    root 'subreddits#new'
    resources :subreddits

    resources :subreddits do
    	resources :posts do
    	    resources :comments
    	end
	end

	resources :posts do
	    resources :comments
	end

    resources :comments do
	    resources :comments
	end
end
