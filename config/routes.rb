DbcOverflow::Application.routes.draw do
  devise_for :users
  resources :users, :only => :show


  get "/posts/:post_id/comments/new", to: "comments#new", as: :new_post_comment
  get "/answers/:answer_id/comments/new", to: "comments#new", as: :new_answer_comment
  post "/posts/:post_id/comments", to: "comments#create", as: :post_comments
  post "/answers/:answer_id/comments", to: "comments#create",  as: :answer_comments
  delete "/comments/:id", to: "comments#destroy", as: :delete_comment

  get "/posts/:post_id/upvote", to: "votes#upvote", as: :post_upvote
  get "/answers/:answer_id/upvote", to: "votes#upvote", as: :answer_upvote
  get "/posts/:post_id/downvote", to: "votes#downvote", as: :post_downvote
  get "/answers/:answer_id/downvote", to: "votes#downvote", as: :answer_downvote


  resources :posts do
    resources :answers
  end



  # get '/home/index'
  root to: "home#index"
end
