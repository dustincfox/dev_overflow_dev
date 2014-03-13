class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to post_path(@answer.post)
      flash[:notice]="Answer posted succesfuly!"
    else
      flash[:error]="Something went wrong and your answer was not posted"
      render 'posts/show'
    end
  end

  def edit
    @answer, @post = get_answer_and_post(params)
  end

  def update
    @answer, @post = get_answer_and_post(params)
    @answer.update(answer_params)
    if @answer.save
      flash[:alert]=nil
      redirect_to post_path(@answer.post)
    else
      flash[:alert]="Your answer can't be empty"
      render :edit
    end
  end

  def destroy
    @answer, @post = get_answer_and_post(params)
    @answer.destroy
    flash[:notice]="Answer succesfully deleted!"
    redirect_to post_path(@post)
  end

  private

  def get_answer_and_post(prms)
    @post = Post.where(id: prms[:post_id]).first
    @answer = Answer.where(id: prms[:id]).first
    return @answer, @post
  end

  def answer_params
    params.require(:answer).permit(:body).merge({user_id: current_user.id, post_id: params[:post_id]})
  end
end
