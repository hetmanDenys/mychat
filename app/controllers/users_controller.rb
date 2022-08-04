class UsersController < ApplicationController

  def show
    @first_user = User.first
    @user_count = User.count
    @user_id = current_user.id
    @users_show = User.order(:id).page params[:page]
    @rooms = current_user.rooms.all
  end

  def edit
    user
  end

  def users_age
    date_sent = Date.parse(user_params[:birthday])
    date_now = Date.today
    how_many_days_have_passed = (date_now - date_sent).to_i
    ((how_many_days_have_passed / 365.24).to_i).to_s
  end

  def update
    params = user_params
    params[:age] = users_age
    user.update! params
    redirect_to :edit_user
  rescue ActiveRecord::RecordInvalid => e
    flash[:messages] = e.message
    redirect_to :edit_user
  end

  def user
    @user ||= current_user
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :birthday, :country, :avatar)
  end
end
