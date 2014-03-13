class PostsController < ApplicationController
  include ApplicationHelper

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
      @tags = params[:tag_list]
      @tags.split.each do |tag|
        @post.tags << create_tag(tag)
      end
      redirect_to post_url(@post)
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @tags = @post.tags
    if @post

      @answers = @post.answers
      @favorite = @post.find_fav
      # binding.pry
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
      @tags = params[:tag_list]
      @tags.split.each do |tag|
        @post.tags << create_tag(tag)
      end
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

  def favorite
    @post = Post.find(params[:post_id])
    @post.favorite_answer = params[:answer_id]
    @post.save
    @answers = @post.answers
    @favorite = @post.find_fav
    @answer = Answer.new
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:subject, :body)
  end
end
