class ChatController < ApplicationController

  before_action only: [:auto_login]

  def chat
    @first_user = User.first
    @user_count = User.count
    @user_id = current_user.id
    @users_show = User.order(:id).page params[:page]
  end

  def auto_login
    render json: @user
  end
end
