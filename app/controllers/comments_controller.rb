class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @parent = if params[:answer_id]
      Answer.where(id: params[:answer_id]).first
    else
      Post.where(id: params[:post_id]).first
    end

    if @comment && @parent
      render "new"
    else
      redirect_to root_path
    end
  end

  def create
    if params[:answer_id]
      @commentable_type = "Answer"
      @commentable_id = params[:answer_id]
      @post = Answer.find(params[:answer_id]).post
    else
      @commentable_type = "Post"
      @commentable_id = params[:post_id]
      @post = Post.find(params[:post_id])
    end
    @comment = Comment.new(comment_params.merge(commentable_id: @commentable_id, commentable_type: @commentable_type, user_id: current_user.id))
    if @comment.save
      redirect_to post_path(@post)
    else
      flash[:alert]= "Your comment could not be posted. Try again!!!"
      @parent = @commentable_type.constantize.find(@commentable_id)
      render "new"
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.commentable.class == Post
      @post = @comment.commentable
    else
      @post = @comment.commentable.post
    end

    @comment.destroy

    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
