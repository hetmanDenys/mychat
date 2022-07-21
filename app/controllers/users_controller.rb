class UsersController < ApplicationController

  def show
    @users = User.all
    @login_name =  current_user.user_name || current_user.email
  end

  def edit
    user
  end

  def update
    user.update! user_params
    redirect_to :edit_user
  rescue ActiveRecord::RecordInvalid => e
    flash[:messages] = e.message
    redirect_to :edit_user
  end

  private

  def user
    @user ||= User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:user_name, :age, :country, :avatar)
  end
end
