class PostsController < ApplicationController

  def index
    @posts = Post.all.reverse
  end

  def new
    @post = Post.new
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
    if @post
      @answers = @post.answers
      @answer = Answer.new
    else
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:subject, :body)
  end
end
