Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do
      get "like", to: "posts#upvote"
      get "dislike", to: "posts#downvote"
    end
    resources :comments
  end
  
  root 'posts#index'
  
  get 'contact', to: 'posts#contact'
  post 'request_contact', to: 'posts#request_contact'
end
