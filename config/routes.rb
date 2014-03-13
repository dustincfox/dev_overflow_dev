DbcOverflow::Application.routes.draw do
  devise_for :users
  resources :users, :only => :show


  get "/posts/:post_id/comments/new", to: "comments#new", as: :new_post_comment
  get "/answers/:answer_id/comments/new", to: "comments#new", as: :new_answer_comment
  post "/posts/:post_id/comments", to: "comments#create", as: :post_comments
  post "/answers/:answer_id/comments", to: "comments#create",  as: :answer_comments

  resources :posts do
    resources :answers
  end



  # get '/home/index'
  root to: "home#index"
end
