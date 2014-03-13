class HomeController < ApplicationController
  def index
    @user = current_user
    @posts = Post.first(10)
  end
end
