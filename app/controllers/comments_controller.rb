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

  end


  private
  def comment_params
    if params[:answer_id]
      @commentable_type = "Answer"
      @commentable_id = params[:answer_id]
    else
      @commentable_type = "Post"
      @commentable_id = params[:post_id]
    end

    params.require(:comment).permit(:body).merge(commentable_id: @commentable_id, commentable_type: @commentable_type, user_id: current_user.id)
  end
end
