class PostsController < ApplicationController

  def index
    @posts = Post.all.reverse
  end

  def new
  end

  def create
    @user = current_user
    @post = Post.new(post_params.merge(:user_id => @user.id))
    if @post.save
      redirect_to post_url(@post)
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:subject, :body)
  end
end
