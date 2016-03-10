Rails.application.routes.draw do
  get 'comments/new'

  get 'comments/show'

  get 'comments/edit'

  get 'comments/update'

  get 'comments/create'

  get 'comments/index'

    root 'subreddits#new'
    resources :subreddits

    resources :subreddits do
    	resources :posts
	end

	resources :posts
end
