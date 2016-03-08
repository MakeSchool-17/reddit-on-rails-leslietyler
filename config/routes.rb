Rails.application.routes.draw do
    root                    'subreddits#new'
    resources :subreddits
end
