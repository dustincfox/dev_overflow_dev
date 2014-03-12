class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to post_path(@answer.post)
    else
      flash[:error]="Something went wrong and your answer was not posted"
      render 'posts/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body).merge({user_id: current_user.id, post_id: params[:post_id]})
  end
end
