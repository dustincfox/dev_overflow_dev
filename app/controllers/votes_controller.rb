class VotesController < ApplicationController 
  def upvote
    if current_user
      @voted, @post = voted_element_and_post
      @voted.liked_by current_user
      redirect_to post_path(@post)
    else
      redirect_to root_path
    end
  end

  def downvote
    if current_user
      @voted, @post = voted_element_and_post
      @voted.downvote_from current_user
      redirect_to post_path(@post)
    else
      redirect_to root_path
    end
  end

  private

  def voted_element_and_post
    if params[:answer_id]
      voted = Answer.find(params[:answer_id])
      @post = voted.post
    else
      voted = Post.find(params[:post_id])
      @post = voted
    end
    return voted, @post
  end
end