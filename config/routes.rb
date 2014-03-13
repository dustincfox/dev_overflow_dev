DbcOverflow::Application.routes.draw do
  devise_for :users
  resources :users, :only => :show

  get 'posts/:post_id/answers/new', to: "answer#new", as: :new_post_answer
  post "posts/:post_id/answers/", to: "answers#create"
  get "/posts/:post_id/answers", to: "answers#index", as: :post_answers
  get "posts/:post_id/answers/:id", to: "answers#edit", as: :edit_post_answer
  put "posts/:post_id/answers/:id/update", to: "answers#update" 
  patch "posts/:post_id/answers/:id/update", to: "answers#update"
  delete "posts/:post_id/answers/:id", to: "answers#destroy"
  resources :posts do
    # resources :answers
  end

  root to: "home#index"
end
