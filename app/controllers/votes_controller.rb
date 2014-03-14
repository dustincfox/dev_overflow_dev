include VoteHelper

class VotesController < ApplicationController 
  def upvote
    if current_user
      @voted, @post = voted_element_and_post
      determine_vote(args = {voted: @voted, post: @post, type: "up"})
      redirect_to post_path(@post)
    else
      flash[:alert]="You need to be signed in to vote!!!" 
      redirect_to new_user_session_path
    end
  end

  def downvote
    if current_user
      @voted, @post = voted_element_and_post
      determine_vote(args = {voted: @voted, post: @post, type: "down"})
      redirect_to post_path(@post)
    else
      flash[:alert]="You need to be signed in to vote!!!" 
      redirect_to new_user_session_path
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