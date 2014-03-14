class VotesController < ApplicationController 
  def upvote
    if current_user
      @voted, @post = voted_element_and_post
      if @voted.voted_on_by? current_user
        if current_user.voted_as_when_voted_for @voted
          @voted.unliked_by current_user
        else
          @voted.liked_by current_user
        end
      else
        @voted.liked_by current_user
      end
      redirect_to post_path(@post)
    else
      flash[:alert]="You need to be signed in to vote!!!" 
      redirect_to new_user_session_path
    end
  end

  def downvote
    if current_user
      @voted, @post = voted_element_and_post
      if @voted.voted_on_by? current_user
        if current_user.voted_as_when_voted_for @voted
          @voted.disliked_by current_user
        else
          @voted.undisliked_by current_user
        end
      else
        @voted.disliked_by current_user
      end
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