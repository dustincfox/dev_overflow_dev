DbcOverflow::Application.routes.draw do
  devise_for :users
  resources :users, :only => :show


  resources :posts do
    resources :answers
  end
  # get '/home/index'
  root to: "home#index"
end
