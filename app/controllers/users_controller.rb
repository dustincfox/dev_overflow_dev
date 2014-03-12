class UsersController < ApplicationController
  # def create
  #   binding.pry
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to root
  #   else
  #     render :"registrations/new"
  #   end
  # end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
