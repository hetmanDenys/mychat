class UsersController < ApplicationController
  # before_action :authorized, only: [:auto_login]

  def show
    @users = User.all
    @login_name =  current_user.user_name || current_user.email
  end

  def edit
    user
  end

  def users_age
    date_sent = Date.parse(user_params[:age])
    date_now = Date.today
    how_many_days_have_passed = (date_now - date_sent).to_i
    ((how_many_days_have_passed / 365.24).to_i).to_s
  end

  def update
    params = user_params
    params["age"] = users_age
    user.update! params
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

  def auto_login
    render json: user
  end
end
